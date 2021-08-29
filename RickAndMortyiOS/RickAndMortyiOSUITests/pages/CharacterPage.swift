import XCTest


class CharacterPage: Page {
    let tag: String = "------At the Character Page------\t"
    lazy var charactersBtn = app.buttons["Characters"].firstMatch
    
    required init(_ app: XCUIApplication) {
        super.init(app)
        sleep(1)
//        print(tag, XCUIApplication().debugDescription)
    }
    
    @discardableResult
    func backToMainPage() -> MainPage {
        tap(element: charactersBtn)
        return MainPage(app)
    }

    @discardableResult
    func assertCharacter(name: String, gender: String = "Male", species: String = "Human") -> Self {
        let nameLabel = app.staticTexts["Name: \(name)"].firstMatch
        let genderLabel = app.staticTexts["Gender: \(gender)"].firstMatch
        let speciesLabel = app.staticTexts["Species: \(species)"].firstMatch
        XCTAssertTrue(nameLabel.exists, "Name is incorrect.")
        XCTAssertTrue(genderLabel.exists, "Gender is incorrect.")
        XCTAssertTrue(speciesLabel.exists, "Species is incorrect.")
        return self
    }
}
