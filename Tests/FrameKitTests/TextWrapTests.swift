import XCTest
@testable import FrameKit

final class TextWrapTests: XCTestCase {
    func test_two_lines() throws {
        XCTAssertEqual(TextWrap.wrapTextEqually("Tu app de recetas de cocina", into: 2), "Tu app de\nrecetas de cocina")
    }
}
