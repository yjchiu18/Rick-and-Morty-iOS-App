import XCTest

final class MainPage: Page {
    let tag:String = "------At the Main Page------\t"
    lazy var searchField = app.searchFields["Search a Character"].firstMatch
    lazy var cancelBurron = app.buttons["Cancel"].firstMatch
    lazy var filterButton = app.buttons["filter"].firstMatch
    
    required init(_ app: XCUIApplication ) {
        super.init(app)
        sleep(1)
//        print(tag, XCUIApplication().debugDescription)
    }
    
    @discardableResult
    func typeTextInSearchField(_ text: String) -> Self {
        let scrollView = app.collectionViews.firstMatch
        scrollView.swipeDownToElement(element: searchField, app: app)
        tap(element: searchField)
        typeText(element: searchField, text: text)
        return self
    }
    @discardableResult
    func selectProfile(_ text: String) -> CharacterPage {
        
        let scrollView = app.collectionViews.firstMatch
        let predicate = NSPredicate(format: "label CONTAINS[c] %@", text)
        let cell = app.collectionViews.cells.staticTexts.matching(predicate).firstMatch
        scrollView.swipeUpToElement(element: cell, app: app)
        tap(element: cell)
        
        return CharacterPage(app)
    }
    
    @discardableResult
    func cancelSearch() -> Self {
        tap(element: cancelBurron)
        return self
    }
    
    
    func filterCells(containing labels: String..., inApp app: XCUIApplication) -> XCUIElementQuery {
        var cells = app.collectionViews.cells
        for label in labels {
            cells = cells.containing(NSPredicate(format: "label CONTAINS %@", label))
        }
        return cells
    }
    
    
    
    
}
