import AppKit
import FrameKit
import SwiftUI

public struct DefaultHeroStoreScreenshotView: StoreScreenshotView {
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
            // Background Colour
            layout.backgroundColor

            // Background Image
            content.backgroundImage.map { backgroundImage in
                Image(nsImage: backgroundImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }

            // Images
            GeometryReader() { geometry in
                ZStack {
                    HStack(alignment: .center, spacing: 10) {
                        Image(nsImage: content.framedScreenshots[1])
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geometry.size.width / 2.6)

                        Spacer()

                        Image(nsImage: content.framedScreenshots[2])
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geometry.size.width / 2.6)
                    }

                    Image(nsImage: content.framedScreenshots[0])
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geometry.size.width / 2.2, alignment: .center)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(self.layout.imageInsets)
            }

            // Text
            HStack {
                Text(content.keyword)
                    .font(keywordFont)
                    .foregroundColor(self.layout.textColor)
                    .multilineTextAlignment(.leading)
                    .lineLimit(nil)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            .padding(self.layout.textInsets)
        }
    }
}
