import Foundation
import AppKit
import SwiftUI

public struct StoreScreenshotRenderer {
    public enum Error: Swift.Error {
        case imageOperationFailure(String)
        case fileSavingFailure(String)
    }

    private let layoutDirection: LayoutDirection
    private let outputPath: String

    public init(outputPath: String, layoutDirection: LayoutDirection) {
        self.outputPath = outputPath
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

        // Output jpeg image to specified outputPath
        guard let jpegData = convertToImage(view: view, format: .jpeg) else {
            throw Error.imageOperationFailure("Error: can't generate image from view")
        }

        let result = FileManager.default.createFile(atPath: outputPath, contents: jpegData, attributes: nil)
        guard result else {
            throw Error.fileSavingFailure("Error: can't save generated image at \(String(describing: outputPath))")
        }
    }
}
