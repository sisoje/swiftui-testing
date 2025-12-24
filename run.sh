#!/bin/bash
set -e

echo "📦 Generating project..."
swift run xcodegen

# List all available iPhone simulators, pick the first one that's available
UDID=$(xcrun simctl list devices available |
       grep -w "iPhone" | # filter only iPhone lines
       grep -Eo "[0-9A-Fa-f-]{36}" | # extract UUID
       head -1)

if [ -z "$UDID" ]; then
  echo "❌ No available iPhone simulator found"
  exit 1
fi

echo "📱 Using simulator: $UDID"

echo "🧪 Running UI tests..."
rm -rf TestResults.xcresult
xcodebuild test \
  -project TestApp.xcodeproj \
  -scheme TestApp \
  -destination id="$UDID" \
  -enableCodeCoverage YES \
  -derivedDataPath .derivedData \
  -resultBundlePath TestResults.xcresult

 