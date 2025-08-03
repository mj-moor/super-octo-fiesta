import XCTest

class TestBase: XCTestCase {
    
    // MARK: - Properties
    var app: XCUIApplication!
    var pages: Pages!
    let defaultTimeout = TestConstants.Timeout.standard
    
    // MARK: - Setup
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
        pages = Pages(app: app)
    }
    
    // MARK: - Teardown
    override func tearDown() {
        app = nil
        super.tearDown()
    }
    
    // MARK: - Page Factory
    struct Pages {
        let app: XCUIApplication
        
        var main: MainPage { MainPage(app: app) }
        // Easy to add more pages later:
        // var settings: SettingsPage { SettingsPage(app: app) }
        // var profile: ProfilePage { ProfilePage(app: app) }
    }
}


