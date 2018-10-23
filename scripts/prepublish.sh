#!/bin/bash

if [ ! -d "node_modules" ]; then
  echo "=> Installing Deps..."
  echo ""
  npm install
fi

echo "=> Transpiling..."
echo ""
export NODE_ENV=production
rm -rf ./dist
./node_modules/.bin/babel \
  --plugins 'transform-es2015-modules-umd' \
  --presets 'stage-0,react' \
  --ignore __tests__ \
  --out-dir ./dist \
  src
echo ""
echo "=> Complete"
