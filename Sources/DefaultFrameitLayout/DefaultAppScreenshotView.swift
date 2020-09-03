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

            // Background Image
            if let backgoundImage = self.content.backgroundImage {
                Image(nsImage: backgoundImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }

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

struct DefaultAppScreenshotView_Previews: PreviewProvider {
    static var previews: some View {
        DefaultAppScreenshotView(
            layout: Layout.iPhone65,
            content: Content(
                keyword: "Frame it",
                title: "Make your beautiful screenshots",
                framedScreenshots: [NSImage()]
            )
        )
        .previewLayout(
            .fixed(
                width: Layout.iPhone65.size.width,
                height: Layout.iPhone65.size.height
            )
        )
    }
}
