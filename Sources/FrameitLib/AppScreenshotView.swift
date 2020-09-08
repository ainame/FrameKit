import SwiftUI

public protocol AppScreenshotView: View {
    var layout: LayoutConfigurationProvider { get }
    var content: ContentProvider { get }
    static func makeView(layout: LayoutConfigurationProvider, content: ContentProvider) -> Self
}

extension AppScreenshotView {
    public var keywordFont: Font { Font.system(size: layout.keywordFontSize, weight: .bold, design: .default) }
    public var titleFont: Font { Font.system(size: layout.titleFontSize, weight: .regular, design: .default) }
}
