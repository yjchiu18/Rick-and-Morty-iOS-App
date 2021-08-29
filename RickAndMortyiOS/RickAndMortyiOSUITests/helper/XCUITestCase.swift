import XCTest

class XCUITestCase: XCTestCase {
    var app: XCUIApplication!
    var test: Page!

    override func setUp() {
           
        // stop immediately when a failure occurs.
        continueAfterFailure = false
        super.setUp()
        app = XCUIApplication()
        test = TestBuilder(app).launch()
    }
    
    override func tearDown() {
//        print("SUCCESSED \(self.testRun!.hasSucceeded)")
        if self.testRun!.failureCount > 0 {
            app.terminate()
        }
        
    }
    
}
