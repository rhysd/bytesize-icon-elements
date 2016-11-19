#! /usr/bin/env node

const list = require('../index.js').ICON_NAMES.map(n => `- \`<icon-${n}><icon-${n}/>\``).join('\n')
const template = require('fs').readFileSync(require('path').join(__dirname, 'README_template.md'), 'utf8');
process.stdout.write(template + list + '\n');

