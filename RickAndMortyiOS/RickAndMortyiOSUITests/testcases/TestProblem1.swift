import XCTest

class TestProblem1: XCUITestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_1_Search() {
        test
            .on(page: MainPage.self).typeTextInSearchField("Blim Blam")
            .on(page: MainPage.self).cancelSearch()
    }
    func test_2_GoToDetailPageThenBackToMainPage() {
        test
            .on(page: MainPage.self).selectProfile("Alien Rick")
            .on(page: CharacterPage.self).assertCharacter(name: "Alien Rick", gender: "Male", species: "Alien")
            .on(page: CharacterPage.self).backToMainPage()
    }
    
    
}

