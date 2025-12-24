# SwiftUI Interaction Tests

> Snapshot testing, but for actions.

A snapshot testing framework for SwiftUI UI interactions. Tests define views as codable structs, user interactions are captured as text logs, and tests verify the logs match saved snapshots.

## Snapshot Testing

This is **interaction snapshot testing**:

1. First run: Test executes, interactions are logged to a file (snapshot is created)
2. Test is skipped with "generating new log"
3. Subsequent runs: New log is compared against the saved snapshot
4. Test fails if logs don't match (behavior changed)

Similar to Jest snapshots or Swift Snapshot Testing, but for **user interaction logs** instead of visual/data output.

## How It Works

1. Tests define `TestView` with a `ViewBody` (e.g., `.button(text: "demo")`)
2. App launches with the view passed via environment variable
3. UI interactions (taps, etc.) write to log files
4. Tests compare generated logs against saved snapshots

## Usage

```bash
sh run.sh
```

Generates Xcode project with XcodeGen, picks first available iPhone simulator, and runs UI tests.

## Structure

- `SharedCode/` - `TestView` struct and extensions (shared between app and tests)
- `AppCode/` - SwiftUI app that renders test views
- `TestCode/` - XCTest UI tests
- `LogFiles/` - Interaction log snapshots for verification
- `project.yml` - XcodeGen project definition

## Requirements

- macOS
- Xcode
- Swift 6.2+
