import XCTest

extension TestBase {
    
    func verifyElementText(_ element: XCUIElement, equals expectedText: String) {
        XCTAssertTrue(element.waitForExistence(timeout: TestConstants.Timeout.short) && element.label == expectedText)
    }
    
    func verifyElementText(_ element: XCUIElement, contains expectedText: String) {
        XCTAssertTrue(element.label.contains(expectedText))
    }
    
    func verifyElementTextIsNot(_ element: XCUIElement, equals unexpectedText: String) {
        XCTAssertTrue(element.waitForExistence(timeout: TestConstants.Timeout.short) && element.label != unexpectedText)
    }
    
    func verifyElementExists(_ element: XCUIElement) {
        XCTAssertTrue(element.waitForExistence(timeout: TestConstants.Timeout.short), "Element should exist but was not found")
    }
    
    func verifyElementDoesNotExist(_ element: XCUIElement) {
        XCTAssertFalse(element.waitForExistence(timeout: TestConstants.Timeout.short), "Element should not exist but was found")
    }
    
    func verifyIfAmountIsInRange(
           _ element: XCUIElement,
           min: Double,
           max: Double,
       ) {
           guard let amount = element.currencyAmount else {
               XCTFail("Could not parse currency from element")
               return
           }
           
           XCTAssertTrue(
               (min..<max).contains(amount),
               "Expected \(amount) to be between \(min) and \(max)",
           )
       }
    
    func verifyIfCurrenyIsInEuroFormat(
            _ element: XCUIElement,
        ) {
            let labelText = element.label
            let pattern =  "^€\\s+\\d{1,3}(\\.\\d{3})*,\\d{2}$"
            
            // We control the pattern so ! is acceptable here
            let regex = try! NSRegularExpression(pattern: pattern)
            // Convert Swift string range to NSRange for regex
            let range = NSRange(labelText.startIndex..., in: labelText)
            // Check if matches European currency format
            let matchesFormat = regex.firstMatch(in: labelText, range: range) != nil
            
            XCTAssertTrue(
                matchesFormat,
                "Expected European currency format (€ X.XXX.XXX,XX) but got: '\(labelText)'",
            )
    }
}
