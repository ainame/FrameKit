import SwiftUI

public protocol AppScreenshotView: View {
    var layout: LayoutConfigurationProvider { get }
    var content: ContentProvider { get }
    static func makeView(layout: LayoutConfigurationProvider, content: ContentProvider) -> Self
}

extension AppScreenshotView {
    public var fontForKeyword: Font { Font.system(size: layout.fontSizeForKeyword, weight: .bold, design: .default) }
    public var fontForTitle: Font { Font.system(size: layout.fontSizeForTitle, weight: .regular, design: .default) }
}
