import AppKit
import FrameitLib
import SwiftUI

public struct DefaultHeroAppScreenshotView: AppScreenshotView {
    public let layout: LayoutConfigurationProvider
    public let content: ContentProvider

    public static func makeView(layout: LayoutConfigurationProvider, content: ContentProvider) -> Self {
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
        GeometryReader() { geometry in
            ZStack {
                // Background Colour
                self.layout.backgroundColor

                // Background Image
                if let backgoundImage = self.content.backgroundImage {
                    Image(nsImage: backgoundImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }

                VStack(alignment: .leading) {
                    ZStack {
                        HStack(alignment: .center, spacing: 10) {
                            Image(nsImage: self.content.framedScreenshots[1])
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: geometry.size.width / 2.6)

                            Spacer()

                            Image(nsImage: self.content.framedScreenshots[2])
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: geometry.size.width / 2.6)
                        }

                        Image(nsImage: self.content.framedScreenshots[0])
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geometry.size.width / 2.2, alignment: .center)
                    }
                    .padding(self.layout.insetForImage)
                }

                VStack(alignment: .leading) {
                    Spacer()

                    Text(self.content.keyword)
                        .font(self.fontForKeyword)
                        .foregroundColor(self.layout.textColor)
                        .multilineTextAlignment(.leading)
                        .lineLimit(nil)
                }
                .padding(self.layout.insetForText)
            }
        }
    }
}

struct DefaultHeroAppScreenshotView_Previews: PreviewProvider {
    static var previews: some View {
        DefaultHeroAppScreenshotView(
            layout: Layout.iPhone65,
            content: Content(
                keyword: "Make your beautiful screenshots",
                title: "",
                framedScreenshots: [
                    NSImage(), NSImage(), NSImage()
                ]
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
