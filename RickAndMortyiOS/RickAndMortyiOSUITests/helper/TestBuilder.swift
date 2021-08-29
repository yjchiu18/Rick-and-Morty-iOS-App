import XCTest

class TestBuilder {
    let app: XCUIApplication
    let tag: String = "-----AT_TestBuilder-----\t"
    
    required init(_ app: XCUIApplication) {
        self.app = app
    }
    
    func launch() -> Page {
        if XCUIApplication().state == .runningBackground || XCUIApplication().state == .runningBackgroundSuspended {
            app.terminate()
        }
        if XCUIApplication().exists == false {
            sleep(2)
            app.launch()
        }

        return Page(app)
    }
}
