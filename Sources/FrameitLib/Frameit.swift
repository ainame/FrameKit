import AppKit
import SwiftUI

// Main function that supports both CLI and Swift Playground
public class Frameit {
    public static func run<View: AppScreenshotView>(
        viewType: View.Type,
        layout: LayoutConfigurationProvider,
        with configuration: Configuration
    ) {
        // Device frame's image needs to be generted separaratedly to make framing logic easy
        let framedScreenshots = configuration.screenshots.compactMap({ screenshot in
            DeviceFrame.makeImage(
                screenshot: absolutePath(screenshot),
                deviceFrame: absolutePath(configuration.deviceFrame),
                screenshotScale: layout.screenshotScale
            )
        })

        let content = Content(
            keyword: configuration.keyword,
            title: configuration.title,
            backgroundImage: configuration.backgroundImage.flatMap({ NSImage(contentsOfFile: absolutePath($0)) }),
            framedScreenshots: framedScreenshots
        )

        let appScreenshot = viewType.makeView(layout: layout, content: content)
            .environment(\.layoutDirection, configuration.layoutDirection)

        let view = NSHostingView(rootView: appScreenshot)
        view.frame = CGRect(x: 0, y: 0, width: layout.size.width, height: layout.size.height)

        // Output jpeg image to specified outputPath
        guard let jpegData = convertToImage(view: view, format: .jpeg) else {
            logError("Error: can't generate image from view")
            exit(1)
        }

        let result = FileManager.default.createFile(atPath: configuration.outputPath, contents: jpegData, attributes: nil)
        guard result else {
            logError("Error: can't save generated image at \(String(describing: configuration.outputPath))")
            exit(1)
        }
    }
}
