import AppKit
import SwiftUI

// Main function that supports both CLI and Swift Playground
public struct DeviceFrame {
    public static func makeImage(screenshot: String, deviceFrame: String, layout: LayoutProvider) -> NSImage? {
        guard let screenshotImage = NSImage(contentsOfFile: absolutePath(screenshot)) else {
            logError("screenshot was not found at \(screenshot)")
            return nil
        }

        guard let deviceFrameImage = NSImage(contentsOfFile: absolutePath(deviceFrame)) else {
            logError("device frame was not found at \(deviceFrame)")
            return nil
        }

        // Device frame's image needs to be generted separaratedly to make framing logic easy
        return makeDeviceFrameImage(screenshot: screenshotImage, deviceFrame: deviceFrameImage, layout: layout)
    }

    public static func makeDeviceFrameImage(screenshot: NSImage, deviceFrame: NSImage, layout: LayoutProvider) -> NSImage? {
        let deviceFrameView = DeviceFrameView(
            deviceFrame: deviceFrame,
            screenshot: screenshot,
            offset: layout.deviceFrameOffset
        )
        let view = NSHostingView(rootView: deviceFrameView)
        view.frame = CGRect(x: 0, y: 0, width: pixel(deviceFrame.size.width), height: pixel(deviceFrame.size.height))

        // Use png here to use alpha layer
        let pngData = convertToImage(view: view, format: .png)
        return pngData.flatMap { NSImage(data: $0) }
    }
}
