#!/usr/bin/env node
// Pegagan Stop Hook — Save state after every response
// Fires after every Claude response (not just session end)

const fs = require('fs');
const path = require('path');
const os = require('os');

const input = JSON.parse(fs.readFileSync('/dev/stdin', 'utf8'));
const { transcript_path, session_id, last_assistant_message } = input;

const SESSIONS_DIR = path.join(os.homedir(), '.claude', 'sessions');
const MEMORY_DIR = path.join(os.homedir(), '.claude', 'projects', '-Users-agungperkasa-Sandbox-orbit', 'memory');

// Ensure dirs exist
[SESSIONS_DIR, MEMORY_DIR].forEach(d => fs.mkdirSync(d, { recursive: true }));

// Parse transcript for key info
let userMessages = [];
let filesModified = [];
let toolsUsed = new Set();

if (transcript_path && fs.existsSync(transcript_path)) {
  const lines = fs.readFileSync(transcript_path, 'utf8').split('\n').filter(Boolean);
  lines.forEach(line => {
    try {
      const entry = JSON.parse(line);
      if (entry.type === 'user' && entry.message?.content) {
        const text = Array.isArray(entry.message.content)
          ? entry.message.content.filter(c => c.type === 'text').map(c => c.text).join(' ')
          : entry.message.content;
        if (text) userMessages.push(text.slice(0, 150));
      }
      if (entry.type === 'tool_use') {
        toolsUsed.add(entry.name);
        if (['Write', 'Edit'].includes(entry.name) && entry.input?.file_path) {
          filesModified.push(entry.input.file_path);
        }
      }
    } catch {}
  });
}

// Keep last 5 user messages
userMessages = userMessages.slice(-5);
filesModified = [...new Set(filesModified)].slice(-10);

// Get date and short session id
const date = new Date().toISOString().split('T')[0];
const shortId = session_id ? session_id.slice(0, 8) : 'unknown';
const sessionFile = path.join(SESSIONS_DIR, `${date}-${shortId}-session.tmp`);

// Write session file (idempotent via markers)
const SUMMARY_START = '<!-- PEGAGAN:SUMMARY:START -->';
const SUMMARY_END = '<!-- PEGAGAN:SUMMARY:END -->';
const summary = `${SUMMARY_START}
## Session Summary
### Tasks
${userMessages.map(m => `- ${m}`).join('\n') || '- (none)'}
### Files Modified
${filesModified.map(f => `- ${f}`).join('\n') || '- (none)'}
### Tools Used
${[...toolsUsed].join(', ') || '(none)'}
${SUMMARY_END}`;

let content = '';
if (fs.existsSync(sessionFile)) {
  content = fs.readFileSync(sessionFile, 'utf8');
  // Replace existing summary block
  const startIdx = content.indexOf(SUMMARY_START);
  const endIdx = content.indexOf(SUMMARY_END);
  if (startIdx !== -1 && endIdx !== -1) {
    content = content.slice(0, startIdx) + summary + content.slice(endIdx + SUMMARY_END.length);
  } else {
    content += '\n' + summary;
  }
} else {
  // New session file
  const cwd = process.cwd();
  const branch = (() => { try { return require('child_process').execSync('git branch --show-current', { cwd }).toString().trim(); } catch { return 'unknown'; } })();
  content = `# Session: ${date}
**Date:** ${date}
**Session ID:** ${shortId}
**Project:** ${path.basename(cwd)}
**Branch:** ${branch}
**Last Updated:** ${new Date().toISOString()}

---
${summary}

### Notes for Next Session
-

### Context to Load
\`\`\`
(fill manually if needed)
\`\`\`
`;
}

fs.writeFileSync(sessionFile, content);

// Clean sessions older than 7 days
const sessions = fs.readdirSync(SESSIONS_DIR).filter(f => f.endsWith('-session.tmp'));
const sevenDaysAgo = Date.now() - 7 * 24 * 60 * 60 * 1000;
sessions.forEach(f => {
  const fPath = path.join(SESSIONS_DIR, f);
  if (fs.statSync(fPath).mtime.getTime() < sevenDaysAgo) {
    fs.unlinkSync(fPath);
  }
});
