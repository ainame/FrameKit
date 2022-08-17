import SwiftUI

public struct DeviceFrameView: View {
    public let deviceFrame: NSImage
    public let screenshot: NSImage
    public let offset: CGSize

    public init(deviceFrame: NSImage, screenshot: NSImage, offset: CGSize = .zero) {
        self.deviceFrame = deviceFrame
        self.screenshot = screenshot
        self.offset = offset
    }

    // Currently this view layout relies on the fact that iPhone's vessel size match other side of it.
    // So that we can simply put a screenshot image onto the center of a device frame image! Thanks, Steve.
    // If we need to deal with asymmetry devices or images (e.g. iPhone 5c having lock button on its top),
    // we need to adjust the position of screenshot with offset to account of buttons.
    public var body: some View {
        // Two images are combined by overlapping each other on ZStack
        ZStack {
            Image(nsImage: screenshot)
                .resizable()
                .frame(width: screenshot.size.width, height: screenshot.size.height)
                .offset(self.offset)
            Image(nsImage: deviceFrame)
                .resizable()
                .frame(width: deviceFrame.size.width, height: deviceFrame.size.height)
        }
    }
}
