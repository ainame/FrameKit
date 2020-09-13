import SwiftUI

public struct DeviceFrameView: View {
    public let deviceFrame: NSImage
    public let screenshot: NSImage
    // Assume that given screenshot was sized within iOS simulator in point unit so in order to work with AppKit's screen scale,
    // that size has to be converted to pixel by multiple original scale.
    public let screenshotScale: CGFloat
    public let offset: CGSize

    public init(deviceFrame: NSImage, screenshot: NSImage, screenshotScale: CGFloat, offset: CGSize = .zero) {
        self.deviceFrame = deviceFrame
        self.screenshot = screenshot
        self.screenshotScale = screenshotScale
        self.offset = offset
    }

    // Currently this view layout relies on the fact that iPhone's vessel size match other side of it.
    // So that we can simply put a screenshot image onto the center of a device frame image! Thanks, Steve.
    // If we need to deal with asymmetry devices or images (e.g. iPhone 5c having lock button on its top),
    // we need to adjust the position of screenshot with offset to account of buttons.
    public var body: some View {
        // Two images are combined by overlapping each other on ZStack
        ZStack {
            Image(nsImage: self.screenshot)
                .resizable()
                .frame(width: pixel(self.screenshot.size.width * self.screenshotScale),
                       height: pixel(self.screenshot.size.height * self.screenshotScale))
                .offset(self.offset)
            Image(nsImage: self.deviceFrame)
                .resizable()
                .frame(width: pixel(self.deviceFrame.size.width), height: pixel(self.deviceFrame.size.height))
        }
    }
}
