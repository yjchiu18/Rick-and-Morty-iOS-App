import XCTest

class TestCaseObserver: NSObject, XCTestObservation {
    
    override init() {
        super.init()
        XCTestObservationCenter.shared.addTestObserver(self)
    }
    
    
    public func testCase(_ testCase: XCTestCase, didRecord issue: XCTIssue) {
        // Handle failed case
        print("\(testCase) Failed. Issue: \(issue.description)")
        
        if let filePath = issue.sourceCodeContext.location?.fileURL {
            print("failure at file path: \(filePath)")
        }
        if let lineNumber = issue.sourceCodeContext.location?.lineNumber {
            print("failure at line: \(lineNumber)")
        }
    }
    
    func testSuiteWillStart(_ testSuite: XCTestSuite) {}
    
    func testCaseWillStart(_ testCase: XCTestCase) {}
    
    func testCaseDidFinish(_ testCase: XCTestCase) {
        //Implement code while the test case that finished executing
        // For example: post test result to test management software
    }
    
    func testBundleDidFinish(_ testBundle: Bundle) {
        XCTestObservationCenter.shared.removeTestObserver(self)
    }
}
