import SwiftUI
import FrameKit

extension SampleLayout {
    public static let defaultBackgroundColor = Color(red: 255 / 255, green: 153 / 255, blue: 51 / 255)

    public static let iPhone65 = Self(
        size: CGSize(width: pixel(1242), height: pixel(2688)),
        deviceFrameOffset: .zero,
        textInsets: EdgeInsets(top: pixel(72), leading: pixel(120), bottom: 0, trailing: pixel(120)),
        imageInsets: EdgeInsets(top: 0, leading: pixel(128), bottom: pixel(72), trailing: pixel(128)),
        keywordFontSize: pixel(148),
        titleFontSize: pixel(72),
        textGap: pixel(24),
        textColor: .white,
        backgroundColor: defaultBackgroundColor
    )

    public static let iPhone55 = Self(
        size: CGSize(width: pixel(1242), height: pixel(2208)),
        deviceFrameOffset: .zero,
        textInsets: EdgeInsets(top: pixel(36), leading: pixel(96), bottom: 0, trailing: pixel(96)),
        imageInsets: EdgeInsets(top: 0, leading: pixel(84), bottom: -pixel(500), trailing: pixel(84)),
        keywordFontSize: pixel(148),
        titleFontSize: pixel(72),
        textGap: pixel(24),
        textColor: .white,
        backgroundColor: defaultBackgroundColor
    )

    public static let iPadPro = Self(
        size: CGSize(width: pixel(2048), height: pixel(2732)),
        deviceFrameOffset: .zero,
        textInsets: EdgeInsets(top: pixel(48), leading: pixel(96), bottom: 0, trailing: pixel(96)),
        imageInsets: EdgeInsets(top: 0, leading: pixel(150), bottom: -pixel(200), trailing: pixel(150)),
        keywordFontSize: pixel(148),
        titleFontSize: pixel(72),
        textGap: pixel(24),
        textColor: .white,
        backgroundColor: defaultBackgroundColor
    )

    public static let iPadPro3rdGen = Self(
        size: CGSize(width: pixel(2048), height: pixel(2732)),
        deviceFrameOffset: CGSize(width: -1, height: 1),
        textInsets: EdgeInsets(top: pixel(48), leading: pixel(96), bottom: 0, trailing: pixel(96)),
        imageInsets: EdgeInsets(top: 0, leading: pixel(96), bottom: -pixel(200), trailing: pixel(96)),
        keywordFontSize: pixel(148),
        titleFontSize: pixel(72),
        textGap: pixel(24),
        textColor: .white,
        backgroundColor: defaultBackgroundColor
    )
}

extension SampleLayout {
    public static let iPhone65Hero = Self(
        size: CGSize(width: pixel(1242), height: pixel(2688)),
        deviceFrameOffset: .zero,
        textInsets: EdgeInsets(top: 0, leading: pixel(96), bottom: pixel(240), trailing: pixel(96)),
        imageInsets: EdgeInsets(top: 0, leading: pixel(84), bottom: pixel(96), trailing: pixel(84)),
        keywordFontSize: pixel(108),
        titleFontSize: 0,
        textGap: pixel(24),
        textColor: .white,
        backgroundColor: defaultBackgroundColor
    )

    public static let iPhone55Hero = Self(
        size: CGSize(width: pixel(1242), height: pixel(2208)),
        deviceFrameOffset: .zero,
        textInsets: EdgeInsets(top: 0, leading: pixel(96), bottom: pixel(240), trailing: pixel(96)),
        imageInsets: EdgeInsets(top: 0, leading: pixel(84), bottom: pixel(96), trailing: pixel(84)),
        keywordFontSize: pixel(108),
        titleFontSize: 0,
        textGap: pixel(24),
        textColor: .white,
        backgroundColor: defaultBackgroundColor
    )

    public static let iPadProHero = Self(
        size: CGSize(width: pixel(2048), height: pixel(2732)),
        deviceFrameOffset: .zero,
        textInsets: EdgeInsets(top: 0, leading: pixel(96), bottom: pixel(240), trailing: pixel(96)),
        imageInsets: EdgeInsets(top: 0, leading: pixel(150), bottom: pixel(148), trailing: pixel(150)),
        keywordFontSize: pixel(108),
        titleFontSize: 0,
        textGap: pixel(24),
        textColor: .white,
        backgroundColor: defaultBackgroundColor
    )

    public static let iPadPro3rdGenHero = Self(
        size: CGSize(width: pixel(2048), height: pixel(2732)),
        deviceFrameOffset: CGSize(width: -1, height: 1),
        textInsets: EdgeInsets(top: 0, leading: pixel(96), bottom: pixel(240), trailing: pixel(96)),
        imageInsets: EdgeInsets(top: 0, leading: pixel(96), bottom: pixel(148), trailing: pixel(96)),
        keywordFontSize: pixel(108),
        titleFontSize: 0,
        textGap: pixel(24),
        textColor: .white,
        backgroundColor: defaultBackgroundColor
    )
}
