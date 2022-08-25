import Foundation
import AppKit
import SwiftUI

public struct StoreScreenshotRenderer {
    public enum Error: Swift.Error {
        case imageOperationFailure(String)
        case fileSavingFailure(String)
    }

    private let outputPath: String
    private let imageFormat: NSBitmapImageRep.FileType
    private let layoutDirection: LayoutDirection

    public init(outputPath: String, imageFormat: NSBitmapImageRep.FileType, layoutDirection: LayoutDirection) {
        self.outputPath = outputPath
        self.imageFormat = imageFormat
        self.layoutDirection = layoutDirection
    }

    public func callAsFunction<View: StoreScreenshotView>(_ storeScreenshotView: View) throws {
        let view = NSHostingView(rootView: storeScreenshotView.environment(\.layoutDirection, layoutDirection))
        view.frame = CGRect(
            x: 0,
            y: 0,
            width: storeScreenshotView.layout.size.width,
            height: storeScreenshotView.layout.size.height
        )
        view.layer?.contentsScale = 1.0

        // Output image to specified outputPath
        guard let data = convertToImage(view: view, format: imageFormat) else {
            throw Error.imageOperationFailure("Error: can't generate image from view")
        }

        let result = FileManager.default.createFile(atPath: outputPath, contents: data, attributes: nil)
        guard result else {
            throw Error.fileSavingFailure("Error: can't save generated image at \(String(describing: outputPath))")
        }
    }
}
