import AppKit
import FrameitLib
import SwiftUI

public struct DefaultAppScreenshotView: AppScreenshotView {
    public let layout: LayoutConfigurationProvider
    public let content: ContentProvider

    public static func makeView(layout: LayoutConfigurationProvider, content: ContentProvider) -> DefaultAppScreenshotView {
        Self(layout: layout, content: content)
    }

    public init(
        layout: LayoutConfigurationProvider,
        content: ContentProvider
    ) {
        self.layout = layout
        self.content = content
    }

    public var body: some View {
        ZStack {
            // Background Color
            self.layout.backgroundColor

            // Main
            VStack {
                VStack(alignment: .leading, spacing: pixel(24)) {
                    Text(self.content.keyword)
                        .font(self.fontForKeyword)
                        .foregroundColor(self.layout.textColor)
                        .multilineTextAlignment(.leading)
                        .lineLimit(nil)

                    Text(self.content.title)
                        .font(self.fontForTitle)
                        .foregroundColor(self.layout.textColor)
                        .multilineTextAlignment(.leading)
                        .lineLimit(nil)
                }
                .padding(self.layout.insetForText)

                Spacer()

                HStack(alignment: .center) {
                    Image(nsImage: self.content.framedScreenshots[0])
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                .padding(self.layout.insetForImage)
            }
        }
    }
}
