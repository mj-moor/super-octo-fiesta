import XCTest

class CurrencyFormattingTests: TestBase {
    
    func testShouldShowCorrectCurrencySign() {
        pages.main.generateButton.tap()
        verifyElementText(pages.main.generatedCurrencyOutput, contains: "€")
    }
    
    func testShouldShowCorrectEuroFormat() {
        pages.main.generateButton.tap()
        verifyIfCurrenyIsInEuroFormat(pages.main.generatedCurrencyOutput)
    }
}
