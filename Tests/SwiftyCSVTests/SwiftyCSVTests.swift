import XCTest
@testable import SwiftyCSV

final class SwiftyCSVTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(SwiftyCSV().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
