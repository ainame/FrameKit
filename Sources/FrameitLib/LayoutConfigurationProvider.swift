import Foundation
import SwiftUI

public protocol LayoutConfigurationProvider {
    var size: CGSize { get }
    var textInsets: EdgeInsets { get }
    var imageInsets: EdgeInsets { get }
    var screenshotScale: CGFloat { get }
    var keywordFontSize: CGFloat { get }
    var titleFontSize: CGFloat { get }
    var textGap: CGFloat { get }
    var textColor: Color { get }
    var backgroundColor: Color { get }
}
