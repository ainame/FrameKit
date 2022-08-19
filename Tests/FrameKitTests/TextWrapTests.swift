import XCTest
@testable import FrameKit

final class TextWrapTests: XCTestCase {
    func test_two_lines() throws {
        XCTAssertEqual(TextWrap.wrapTextEqually("Tu app de recetas de cocina", into: 2), "Tu app de\nrecetas de cocina")
    }

    func test_tokenize_sentenceIncludingPunctuation() throws {
        XCTAssertEqual(TextWrap.wrapTextEqually("私は、元気です", into: 2, using: ""), "私は、\n元気です")
    }
}
