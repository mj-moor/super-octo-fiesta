import XCTest

extension XCUIElement {
    
    // Gets the currency amount from label attribute or returns nil when parsing fails
    var currencyAmount: Double? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale.current
        
        if let number = formatter.number(from: self.label) {
            return number.doubleValue
        }
        return nil
    }
}
