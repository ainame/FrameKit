import SwiftUI
import FrameitLib

public struct Layout: LayoutConfigurationProvider {
    public let size: CGSize
    public let insetForText: EdgeInsets
    public let insetForImage: EdgeInsets
    public let screenshotScale: CGFloat
    public let fontSizeForKeyword: CGFloat
    public let fontSizeForTitle: CGFloat
    public let textColor: Color
    public let backgroundColor: Color

    public init(
        size: CGSize,
        insetForText: EdgeInsets,
        insetForImage: EdgeInsets,
        fontSizeForKeyword: CGFloat = pixel(86),
        fontSizeForTitle: CGFloat = pixel(54),
        textColor: Color = .white,
        backgroundColor: Color = Color(red: 255 / 255, green: 153 / 255, blue: 51 / 255),
        screenshotScale: CGFloat
    ) {
        self.size = size
        self.insetForText = insetForText
        self.insetForImage = insetForImage
        self.fontSizeForKeyword = fontSizeForKeyword
        self.fontSizeForTitle = fontSizeForTitle
        self.textColor = textColor
        self.backgroundColor = backgroundColor
        self.screenshotScale = screenshotScale
    }

    public static let iPhone65 = Self(
        size: CGSize(width: pixel(1242), height: pixel(2688)),
        insetForText: Self.insetForTextForiPhone,
        insetForImage: Self.insetForImageForiPhone,
        screenshotScale: 3.0
    )

    public static let iPhone65Hero = Self(
        size: CGSize(width: pixel(1242), height: pixel(2688)),
        insetForText: EdgeInsets(top: 0, leading: pixel(96), bottom: pixel(96), trailing: pixel(96)),
        insetForImage: EdgeInsets(top: 0, leading: pixel(84), bottom: pixel(128), trailing: pixel(84)),
        fontSizeForKeyword: pixel(72),
        screenshotScale: 3.0
    )

    public static let iPhone55 = Self(
        size: CGSize(width: pixel(1242), height: pixel(2208)),
        insetForText: Self.insetForTextForiPhone,
        insetForImage: Self.insetForImageForiPhone,
        screenshotScale: 3.0
    )

    public static let iPadPro = Self(
        size: CGSize(width: pixel(2048), height: pixel(2732)),
        insetForText: Self.insetForTextForiPad,
        insetForImage: Self.insetForImageForiPad,
        screenshotScale: 2.0
    )

    public static let iPadPro3rdGen = Self(
        size: CGSize(width: pixel(2048), height: pixel(2732)),
        insetForText: Self.insetForTextForiPad,
        insetForImage: Self.insetForImageForiPad,
        screenshotScale: 2.0
    )

    private static let insetForTextForiPhone = EdgeInsets(top: pixel(36), leading: pixel(96), bottom: pixel(48), trailing: pixel(96))
    private static let insetForImageForiPhone = EdgeInsets(top: 0, leading: pixel(84), bottom: pixel(48), trailing: pixel(84))
    private static let insetForTextForiPad = EdgeInsets(top: 0, leading: pixel(150), bottom: 0, trailing: pixel(150))
    private static let insetForImageForiPad = EdgeInsets(top: 0, leading: pixel(100), bottom: -pixel(200), trailing: pixel(100))
}
