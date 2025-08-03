import XCTest

extension TestBase {
    
    func killAndRelaunchApp() {
        app.terminate()
        app.launch()
    }
    
    func sendAppToBackground(for duration: TimeInterval = TestConstants.Timeout.short) {
        XCUIDevice.shared.press(.home)
        let expectation = XCTestExpectation(description: "Background wait")
        XCTWaiter().wait(for: [expectation], timeout: duration)
        app.activate()
    }
    
}
