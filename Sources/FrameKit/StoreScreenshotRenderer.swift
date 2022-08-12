import Foundation
import AppKit
import SwiftUI

public struct StoreScreenshotRenderer {
    private let layoutDirection: LayoutDirection
    private let outputPath: String

    public init(outputPath: String, layoutDirection: LayoutDirection) {
        self.outputPath = outputPath
        self.layoutDirection = layoutDirection
    }

    public func callAsFunction(_ storeScreenshotView: some StoreScreenshotView) {
        let view = NSHostingView(rootView: storeScreenshotView.environment(\.layoutDirection, layoutDirection))
        view.frame = CGRect(
            x: 0,
            y: 0,
            width: storeScreenshotView.layout.size.width,
            height: storeScreenshotView.layout.size.height
        )

        // Output jpeg image to specified outputPath
        guard let jpegData = convertToImage(view: view, format: .jpeg) else {
            logError("Error: can't generate image from view")
            exit(1)
        }

        let result = FileManager.default.createFile(atPath: outputPath, contents: jpegData, attributes: nil)
        guard result else {
            logError("Error: can't save generated image at \(String(describing: outputPath))")
            exit(1)
        }
    }
}
