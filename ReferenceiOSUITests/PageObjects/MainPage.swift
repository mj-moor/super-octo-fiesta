import XCTest

class MainPage {
    private let app: XCUIApplication
    
    
    private enum Elements: String {
        case generateButton = "generateButton"
        case welcomeMessage = "welcomeMessage"
        case generatedCurrencyOutput = "generatedCurrencyOutput"
    }
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    var welcomeMessage: XCUIElement {
        app.staticTexts[Elements.welcomeMessage.rawValue]
    }
    
    var generateButton: XCUIElement {
        app.buttons[Elements.generateButton.rawValue]
    }
    
    var generatedCurrencyOutput: XCUIElement {
        app.staticTexts[Elements.generatedCurrencyOutput.rawValue]
    }
    
    func getGeneratedCurrencyOutput() -> Double? {
        generatedCurrencyOutput.currencyAmount
    }
}
