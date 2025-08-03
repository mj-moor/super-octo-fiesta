import XCTest

class CurrencyGenerationTests: TestBase {
    
    func testShouldGiveRandomNumberBetweenBoundaries() {
        pages.main.generateButton.tap()
        verifyIfAmountIsInRange(pages.main.generatedCurrencyOutput, min: 100, max: 99999999)
    }
    
    func testShouldGiveRandomNumberBetweenBoundariesConsistently() {
        for _ in 1...10 {
            pages.main.generateButton.tap()
            verifyIfAmountIsInRange(pages.main.generatedCurrencyOutput, min: 100, max: 99999999)
        }
    }
}
