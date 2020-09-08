import SwiftUI
import FrameitLib

public struct Layout: LayoutConfigurationProvider {
    public let size: CGSize
    public let textInsets: EdgeInsets
    public let imageInsets: EdgeInsets
    public let screenshotScale: CGFloat
    public let keywordFontSize: CGFloat
    public let titleFontSize: CGFloat
    public let textColor: Color
    public let backgroundColor: Color

    public init(
        size: CGSize,
        textInsets: EdgeInsets,
        imageInsets: EdgeInsets,
        keywordFontSize: CGFloat,
        titleFontSize: CGFloat,
        textColor: Color,
        backgroundColor: Color,
        screenshotScale: CGFloat
    ) {
        self.size = size
        self.textInsets = textInsets
        self.imageInsets = imageInsets
        self.keywordFontSize = keywordFontSize
        self.titleFontSize = titleFontSize
        self.textColor = textColor
        self.backgroundColor = backgroundColor
        self.screenshotScale = screenshotScale
    }
}

extension Layout {
    public static let defaultBackgroundColor = Color(red: 255 / 255, green: 153 / 255, blue: 51 / 255)

    public static let iPhone65 = Self(
        size: CGSize(width: pixel(1242), height: pixel(2688)),
        textInsets: EdgeInsets(top: pixel(72), leading: pixel(120), bottom: pixel(96), trailing: pixel(120)),
        imageInsets: EdgeInsets(top: 0, leading: 0, bottom: pixel(96), trailing: 0),
        keywordFontSize: pixel(148),
        titleFontSize: pixel(72),
        textColor: .white,
        backgroundColor: defaultBackgroundColor,
        screenshotScale: 3.0
    )

    public static let iPhone55 = Self(
        size: CGSize(width: pixel(1242), height: pixel(2208)),
        textInsets: EdgeInsets(top: pixel(36), leading: pixel(96), bottom: pixel(48), trailing: pixel(96)),
        imageInsets: EdgeInsets(top: 0, leading: pixel(84), bottom: -pixel(400), trailing: pixel(84)),
        keywordFontSize: pixel(148),
        titleFontSize: pixel(72),
        textColor: .white,
        backgroundColor: defaultBackgroundColor,
        screenshotScale: 3.0
    )

    public static let iPadPro = Self(
        size: CGSize(width: pixel(2048), height: pixel(2732)),
        textInsets: EdgeInsets(top: pixel(48), leading: pixel(96), bottom: pixel(48), trailing: pixel(96)),
        imageInsets: EdgeInsets(top: 0, leading: pixel(150), bottom: -pixel(200), trailing: pixel(150)),
        keywordFontSize: pixel(148),
        titleFontSize: pixel(72),
        textColor: .white,
        backgroundColor: defaultBackgroundColor,
        screenshotScale: 2.0
    )

    public static let iPadPro3rdGen = Self(
        size: CGSize(width: pixel(2048), height: pixel(2732)),
        textInsets: EdgeInsets(top: pixel(48), leading: pixel(96), bottom: pixel(48), trailing: pixel(96)),
        imageInsets: EdgeInsets(top: 0, leading: pixel(96), bottom: -pixel(200), trailing: pixel(96)),
        keywordFontSize: pixel(148),
        titleFontSize: pixel(72),
        textColor: .white,
        backgroundColor: defaultBackgroundColor,
        screenshotScale: 2.0
    )
}

extension Layout {
    public static let iPhone65Hero = Self(
        size: CGSize(width: pixel(1242), height: pixel(2688)),
        textInsets: EdgeInsets(top: 0, leading: pixel(96), bottom: pixel(240), trailing: pixel(96)),
        imageInsets: EdgeInsets(top: 0, leading: pixel(84), bottom: pixel(96), trailing: pixel(84)),
        keywordFontSize: 54,
        titleFontSize: 86,
        textColor: .white,
        backgroundColor: defaultBackgroundColor,
        screenshotScale: 3.0
    )

    public static let iPhone55Hero = Self(
        size: CGSize(width: pixel(1242), height: pixel(2688)),
        textInsets: EdgeInsets(top: 0, leading: pixel(96), bottom: pixel(240), trailing: pixel(96)),
        imageInsets: EdgeInsets(top: 0, leading: pixel(84), bottom: pixel(96), trailing: pixel(84)),
        keywordFontSize: 54,
        titleFontSize: 86,
        textColor: .white,
        backgroundColor: defaultBackgroundColor,
        screenshotScale: 3.0
    )

    public static let iPadProHero = Self(
        size: CGSize(width: pixel(2048), height: pixel(2732)),
        textInsets: EdgeInsets(top: pixel(48), leading: pixel(96), bottom: pixel(240), trailing: pixel(96)),
        imageInsets: EdgeInsets(top: 0, leading: pixel(150), bottom: pixel(148), trailing: pixel(150)),
        keywordFontSize: 54,
        titleFontSize: 54,
        textColor: .white,
        backgroundColor: defaultBackgroundColor,
        screenshotScale: 2.0
    )

    public static let iPadPro3rdGenHero = Self(
        size: CGSize(width: pixel(2048), height: pixel(2732)),
        textInsets: EdgeInsets(top: pixel(48), leading: pixel(96), bottom: pixel(240), trailing: pixel(96)),
        imageInsets: EdgeInsets(top: 0, leading: pixel(96), bottom: pixel(148), trailing: pixel(96)),
        keywordFontSize: 54,
        titleFontSize: 54,
        textColor: .white,
        backgroundColor: defaultBackgroundColor,
        screenshotScale: 2.0
    )
}
