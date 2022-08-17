import AppKit
import SwiftUI

// Main function that supports both CLI and Swift Playground
public struct DeviceFrame {
    public enum Error: Swift.Error {
        case fileNotFound(String)
    }
    public static func makeImage(screenshot: String, deviceFrame: String, deviceFrameOffset: CGSize) throws -> NSImage? {
        guard let screenshotImage = NSImage(contentsOfFile: absolutePath(screenshot)) else {
            throw Error.fileNotFound("screenshot was not found at \(screenshot)")
        }

        guard let deviceFrameImage = NSImage(contentsOfFile: absolutePath(deviceFrame)) else {
            throw Error.fileNotFound("device frame was not found at \(deviceFrame)")
        }

        // Device frame's image needs to be generted separaratedly to make framing logic easy
        return makeDeviceFrameImage(
            screenshot: screenshotImage,
            deviceFrame: deviceFrameImage,
            deviceFrameOffset: deviceFrameOffset
        )
    }

    public static func makeDeviceFrameImage(screenshot: NSImage, deviceFrame: NSImage, deviceFrameOffset: CGSize) -> NSImage? {
        let pngData = makeDeviceFrameData(screenshot: screenshot, deviceFrame: deviceFrame, deviceFrameOffset: deviceFrameOffset)
        return pngData.flatMap { NSImage(data: $0) }
    }

    public static func makeDeviceFrameData(screenshot: NSImage, deviceFrame: NSImage, deviceFrameOffset: CGSize) -> Data? {
        let deviceFrameView = DeviceFrameView(
            deviceFrame: deviceFrame,
            screenshot: screenshot,
            offset: deviceFrameOffset
        )
        let view = NSHostingView(rootView: deviceFrameView)
        view.layer?.contentsScale = 1.0
        view.frame = CGRect(x: 0, y: 0, width: deviceFrame.size.width, height: deviceFrame.size.height)

        // Use png here to use alpha layer
        return convertToImage(view: view, format: .png)
    }
}
