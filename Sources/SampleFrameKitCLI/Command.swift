import ArgumentParser
import AppKit
import FrameKit
import SampleFrameKitLayout
import enum SwiftUI.LayoutDirection

@main
public struct Command: ParsableCommand {
    public static var configuration: CommandConfiguration {
        CommandConfiguration(commandName: "frameit")
    }

    @Option(name: [.customShort("L"), .customLong("layout")],
            help: "\(SampleLayoutOption.allCases.map({ "\"\($0.rawValue)\"" }).joined(separator: ", "))",
            completion: .list(SampleLayoutOption.allCases.map(\.rawValue)))
    var layout: SampleLayoutOption

    @Option(name: .shortAndLong, help: "A target locale's identifier to be used to adjust layout within view")
    var locale: String

    @Option(name: .shortAndLong, help: "A string to be shown with bold font")
    var keyword: String

    @Option(name: .shortAndLong, help: "A string to be shown with regular font")
    var title: String

    @Option(name: .shortAndLong,
            help: "An absolute or relative path to the image to be shown as background",
            completion: .file())
    var backgroundImage: String?


    @Option(name: .shortAndLong,
            help: """
An absolute or relative path to the image to be shown as the device frame. Download them by 'fastlane frameit download_frames')
""",
            completion: .file())
    var deviceFrame: String

    @Option(name: .shortAndLong, help: "An absolute or relative path to output", completion: .file())
    var output: String

    @Flag(name: .long,
          help: "To choose hero screenshot view pass this flag.")
    var isHero: Bool = false

    @Flag(name: .long, help: "If tehe target is RLT language, then add this")
    var isRTL: Bool = false

    @Option(name: .shortAndLong,
            help: "An absolute or relative path to the image to be shown as the embeded screenshot within a device frame",
            completion: .file())
    var screenshots: [String] = []

    public init() {}
}

extension Command {
    public mutating func run() throws {
        let layoutDirection: LayoutDirection = isRTL ? .rightToLeft : .leftToRight
        let layout = layout.value

        // Device frame's image needs to be generted separaratedly to make framing logic easy
        let framedScreenshots = try screenshots.compactMap({ screenshot in
            try DeviceFrame.makeImage(
                screenshot: absolutePath(screenshot),
                deviceFrame: absolutePath(deviceFrame),
                deviceFrameOffset: layout.deviceFrameOffset
            )
        })

        let content = SampleContent(
            locale: Locale(identifier: locale),
            keyword: keyword,
            title: title,
            backgroundImage: backgroundImage.flatMap({ NSImage(contentsOfFile: absolutePath($0)) }),
            framedScreenshots: framedScreenshots
        )

        let render = StoreScreenshotRenderer(outputPath: output, layoutDirection: layoutDirection)
        if isHero {
            try render(SampleHeroStoreScreenshotView.makeView(layout: layout, content: content))
        } else {
            try render(SampleStoreScreenshotView.makeView(layout: layout, content: content))
        }
    }
}
