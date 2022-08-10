import SwiftUI
import FrameKit

extension DefaultLayout {
    func layout(with newSize: CGSize) -> LayoutProvider {
        DefaultLayout(
            size: newSize,
            deviceFrameOffset: deviceFrameOffset,
            textInsets: textInsets,
            imageInsets: imageInsets,
            keywordFontSize: keywordFontSize,
            titleFontSize: titleFontSize,
            textGap: textGap,
            textColor: textColor,
            backgroundColor: backgroundColor
        )
    }
}

extension DefaultLayout {
    public static let iPhone65Landscape = iPhone65.layout(with: CGSize(width: iPhone65.size.height, height: iPhone65.size.width))

    public static let iPhone55Landscape = iPhone55.layout(with: CGSize(width: iPhone55.size.height, height: iPhone55.size.width))

    public static let iPadProLandscape = iPadPro.layout(with: CGSize(width: iPadPro.size.height, height: iPadPro.size.width))

    public static let iPadPro3rdGenLandscape = iPadPro3rdGen.layout(
        with: CGSize(width: iPadPro3rdGen.size.height, height: iPadPro3rdGen.size.width)
    )
}

extension DefaultLayout {
    public static let iPhone65HeroLandscape = iPhone65Hero.layout(
        with: CGSize(width: iPhone65Hero.size.height, height: iPhone65Hero.size.width)
    )

    public static let iPhone55HeroLandscape = iPhone55Hero.layout(
        with: CGSize(width: iPhone55Hero.size.height, height: iPhone55Hero.size.width)
    )

    public static let iPadProHeroLandscape = iPadProHero.layout(
        with: CGSize(width: iPadProHero.size.height, height: iPadProHero.size.width)
    )

    public static let iPadPro3rdGenHeroLandscape = iPadPro3rdGenHero.layout(
        with: CGSize(width: iPadPro3rdGenHero.size.height, height: iPadPro3rdGenHero.size.width)
    )
}
