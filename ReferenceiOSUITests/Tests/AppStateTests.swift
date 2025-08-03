import XCTest

class AppStateTests: TestBase {
    
    func testShouldShowWelcomeMessageAndButtonOnLaunch() {
        verifyElementText(pages.main.welcomeMessage, equals: "Hello")
        verifyElementExists(pages.main.generateButton)
    }
    
    func testShouldResetStateAfterKillingApp() {
        pages.main.generateButton.tap()
        verifyElementDoesNotExist(pages.main.welcomeMessage)
        killAndRelaunchApp()
        verifyElementExists(pages.main.welcomeMessage)
    }
    
    func testShouldKeepStateAfterSendingAppToBackground() {
        pages.main.generateButton.tap()
        verifyElementDoesNotExist(pages.main.welcomeMessage)
        sendAppToBackground()
        verifyElementDoesNotExist(pages.main.welcomeMessage)
    }
}
