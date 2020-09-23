import Foundation
import AppKit

public protocol ContentProvider {
    var locale: Locale { get }
    var keyword: String { get }
    var title: String { get }
    var backgroundImage: NSImage? { get }
    var framedScreenshots: [NSImage] { get }
}

