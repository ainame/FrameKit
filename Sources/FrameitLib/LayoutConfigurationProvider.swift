import Foundation
import SwiftUI

public protocol LayoutConfigurationProvider {
    var size: CGSize { get }
    var insetForText: EdgeInsets { get }
    var insetForImage: EdgeInsets { get }
    var screenshotScale: CGFloat { get }
    var fontSizeForKeyword: CGFloat { get }
    var fontSizeForTitle: CGFloat { get }
    var textColor: Color { get }
    var backgroundColor: Color { get }
}
