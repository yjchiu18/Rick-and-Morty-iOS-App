import XCTest

class TestCaseObserver: NSObject, XCTestObservation {
    
    override init() {
        super.init()
        XCTestObservationCenter.shared.addTestObserver(self)
    }
    
    public func testCase(_ testCase: XCTestCase, didRecord issue: XCTIssue) {
        
        print("\(testCase) Failed. Issue: \(issue.description)")
    }
    
    func testSuiteWillStart(_ testSuite: XCTestSuite) {}
    
    func testCaseWillStart(_ testCase: XCTestCase) {}
    
    func testCaseDidFinish(_ testCase: XCTestCase) {
        //Implement code while the test case that finished executing
        // For example: post test result to test management software
        
    }
}
