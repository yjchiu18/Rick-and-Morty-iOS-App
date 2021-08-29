import XCTest

enum UIState: String {
    case exist = "exists == true"
    case notExist = "exists == false"
    case hitable = "isHittable == true"
}

class Page {
    var app: XCUIApplication
    
    required init(_ app: XCUIApplication) {
        self.app = app

    }
    
    func on<T: Page>(page: T.Type) -> T {
        let nextPage: T
        
        if self is T {
            nextPage = self as! T
        }
        else {
            nextPage = page.init(app)
        }
        
        return nextPage
    }
    
    func tap(element: XCUIElement) {
        waitFor(element: element, status: .hitable)
        element.tap()
    }
    
    func typeText(element: XCUIElement, text: String) {
        waitFor(element: element, status: .exist)
        element.typeText(text)
        element.typeText("\n")
    }
    
    func waitFor(element: XCUIElement, status: UIState, timeout: Int = 10) {
        let expectation = XCTNSPredicateExpectation(predicate: NSPredicate(format:
            status.rawValue), object: element)
        let result = XCTWaiter.wait(for: [expectation], timeout: TimeInterval(timeout))
        if result == .timedOut {
            XCTFail(expectation.description)
        }
    }
    
}

extension XCUIElement {
    func elementIsInTheWindow(element: XCUIElement) -> Bool {
        guard element.exists && element.isHittable else {
            return false
        }
        return true
    }
    
    func swipeUpToElement(element: XCUIElement, app: XCUIApplication) {
        while self.elementIsInTheWindow(element: element) == false {
            app.swipeUp()
        }
    }
    
    func swipeDownToElement(element: XCUIElement, app: XCUIApplication) {
        while self.elementIsInTheWindow(element: element) == false {
            app.swipeDown()
        }
    }
}
