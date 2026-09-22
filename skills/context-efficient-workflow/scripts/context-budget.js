#!/usr/bin/env node
const fs = require('node:fs');
const path = require('node:path');

const files = process.argv.slice(2);
if (!files.length) {
  console.error('Usage: node context-budget.js <file> [...]');
  process.exit(2);
}
let chars = 0;
for (const file of files) {
  const full = path.resolve(file);
  const size = fs.statSync(full).size;
  chars += size;
  console.log(`${full}\t${size} chars\t~${Math.ceil(size / 4)} tokens`);
}
console.log(`TOTAL\t${chars} chars\t~${Math.ceil(chars / 4)} tokens`);
