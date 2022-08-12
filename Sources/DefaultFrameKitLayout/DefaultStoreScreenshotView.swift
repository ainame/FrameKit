import AppKit
import FrameKit
import SwiftUI

public struct DefaultStoreScreenshotView: StoreScreenshotView {
    public let layout: DefaultLayout
    public let content: DefaultContent

    public static func makeView(layout: DefaultLayout, content: DefaultContent) -> Self {
        Self(layout: layout, content: content)
    }

    public init(
        layout: DefaultLayout,
        content: DefaultContent
    ) {
        self.layout = layout
        self.content = content
    }

    public var body: some View {
        ZStack {
            // Background Color
            layout.backgroundColor

            // Background Image
            content.backgroundImage.map { backgroundImage in
                Image(nsImage: backgroundImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }

            // Image
            HStack(alignment: .bottom) {
                Image(nsImage: content.framedScreenshots[0])
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            .padding(layout.imageInsets)

            // Text
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: layout.textGap) {
                    Text(content.keyword)
                        .font(keywordFont)
                        .foregroundColor(layout.textColor)
                        .multilineTextAlignment(.leading)
                        .lineLimit(nil)

                    Text(content.title)
                        .font(titleFont)
                        .foregroundColor(layout.textColor)
                        .multilineTextAlignment(.leading)
                        .lineLimit(nil)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .padding(self.layout.textInsets)
            }
        }
    }
}
