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
                self.layout.backgroundColor

                self.content.backgroundImage.flatMap {
                    Image(nsImage: $0)
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
