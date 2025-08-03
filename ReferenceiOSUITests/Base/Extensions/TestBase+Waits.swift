import XCTest

extension TestBase {
    
    func waitForElement(_ element: XCUIElement, timeout: TimeInterval = TestConstants.Timeout.standard) -> Bool {
            element.waitForExistence(timeout: timeout)
        }
}
