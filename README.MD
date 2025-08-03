# ReferenceiOS UI Tests

This document explains the UI testing approach and architecture for the ReferenceiOS application.

## Architecture Overview

The UI tests follow the **Page Object Model (POM)** pattern, providing a clean separation between test logic and UI element interactions.

### Key Components

#### 1. Test Base Class (`TestBase.swift`)
- Provides common setup and teardown functionality
- Initializes the application instance
- Creates page object instances through the `Pages` factory
- Manages test lifecycle

#### 2. Page Objects (`PageObjects/`)
- **MainPage.swift**: Encapsulates all UI elements and interactions for the main screen
- Uses accessibility identifiers for reliable element selection
- Provides high-level methods for common interactions

#### 3. Test Extensions (`Base/Extensions/`)
- **TestBase+Assertions**: Custom assertion methods for common validations
- **TestBase+Navigation**: App lifecycle methods (kill/relaunch, background/foreground)
- **TestBase+Waits**: Explicit wait strategies for element synchronization
- **XCUIElement+Extensions**: Currency parsing utilities with locale support

#### 4. Test Classes (`Tests/`)
- **AppStateTests**: Validates app state persistence across lifecycles
- **CurrencyFormattingTests**: Verifies currency display formatting
- **CurrencyGenerationTests**: Tests currency generation boundaries and consistency

#### 5. Utilities (`Utils/`)
- **Constants.swift**: Centralized timeout values and other test constants

## Design Decisions

### Page Object Pattern
Chose POM to:
- Reduce code duplication
- Improve test maintainability
- Create a clear abstraction layer between tests and UI

### Custom Assertions
Custom assertion methods provide:
- More readable test code
- Better error messages
- Consistent validation patterns

### Explicit Waits
Using explicit waits instead of sleep() ensures:
- Faster test execution
- More reliable tests
- Better handling of async operations

## Running Tests

### Prerequisites
- Xcode 12.0 or later
- iOS Simulator
- Fastlane (installed via Bundler)

### Install Dependencies
```bash
bundle install
```

### Run Tests via Fastlane

#### Run UI Tests Only
```bash
bundle exec fastlane test_ui
```

#### Run Unit Tests Only
```bash
bundle exec fastlane test_unit
```

### Run Tests via Xcode
1. Open `ReferenceiOS.xcodeproj`
2. Select the `ReferenceiOSUITests` scheme
3. Press `Cmd+U` or Product → Test

### Run Tests via Command Line (xcodebuild)
```bash
xcodebuild test \
  -project ReferenceiOS.xcodeproj \
  -scheme ReferenceiOSUITests \
  -destination 'platform=iOS Simulator,name=iPhone 16,OS=18.6'
```

## Best Practices

1. **Use Accessibility Identifiers**: All UI elements should have unique, descriptive identifiers
2. **Keep Tests Independent**: Each test should be able to run in isolation
3. **Avoid Hard-Coded Waits**: Use explicit waits from TestBase+Waits
4. **Test One Thing**: Each test method should verify a single behavior
5. **Clear Test Names**: Test method names should describe what is being tested

## CI/CD Integration

Tests can be run in CI environments using Fastlane:

```yaml
# Example GitHub Actions workflow
- name: Run UI Tests
  run: bundle exec fastlane test_ui
```

Test reports are generated in `fastlane/test_output/` in both HTML and JUnit formats for easy integration with CI systems.