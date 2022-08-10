import ArgumentParser
import Foundation
import FrameKit
import enum SwiftUI.LayoutDirection

open class Command<HeroView: AppScreenshotView,
                     View: AppScreenshotView,
                     LayoutOption: LayoutProviderOption>: ParsableCommand where View.Layout == LayoutOption.Layout {

    public static var configuration: CommandConfiguration {
        CommandConfiguration(commandName: "frameit")
    }

    @Option(name: [.customShort("L"), .customLong("layout")],
            help: "\(LayoutOption.allCases.map({ "\"\($0.rawValue)\"" }).joined(separator: ", "))",
            completion: .list(LayoutOption.allCases.map(\.rawValue)))
    open var layout: LayoutOption

    @Option(name: .shortAndLong, help: "A target locale's identifier to be used to adjust layout within view")
    open var locale: String

    @Option(name: .shortAndLong, help: "A string to be shown with bold font")
    open var keyword: String

    @Option(name: .shortAndLong, help: "A string to be shown with regular font")
    open var title: String

    @Option(name: .shortAndLong,
            help: "An absolute or relative path to the image to be shown as background",
            completion: .file())
    open var backgroundImage: String?


    @Option(name: .shortAndLong,
            help: """
An absolute or relative path to the image to be shown as the device frame. Download them by 'fastlane frameit download_frames')
""",
            completion: .file())
    open var deviceFrame: String

    @Option(name: .shortAndLong, help: "An absolute or relative path to output", completion: .file())
    open var output: String

    @Flag(name: .long,
          help: "To choose hero screenshot view pass this flag.")
    open var isHero: Bool = false

    @Flag(name: .long, help: "If tehe target is RLT language, then add this")
    open var isRTL: Bool = false

    @Option(name: .shortAndLong,
            help: "An absolute or relative path to the image to be shown as the embeded screenshot within a device frame",
            completion: .file())
    open var screenshots: [String] = []

    required public init() {}

    open func run() throws {
        let configuraion = Configuration(
            locale: Locale(identifier: locale),
            outputPath: output,
            keyword: keyword,
            title: title,
            backgroundImage: backgroundImage,
            screenshots: screenshots,
            deviceFrame: deviceFrame,
            layoutDirection: isRTL ? .rightToLeft : .leftToRight
        )

        FrameKit.run(
            viewType: isHero ? HeroView.self as! View.Type : View.self,
            layout: layout.value,
            with: configuraion
        )
    }
}
