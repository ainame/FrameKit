import SwiftUI

public struct Configuration {
    let outputPath: String
    let keyword: String
    let title: String
    let backgroundImage: String?
    let screenshots: [String]
    let deviceFrame: String
    let layoutDirection: LayoutDirection

    public init(
        outputPath: String,
        keyword: String,
        title: String,
        backgroundImage: String?,
        screenshots: [String],
        deviceFrame: String,
        layoutDirection: LayoutDirection
    ) {
        self.outputPath = outputPath
        self.keyword = keyword
        self.title = title
        self.backgroundImage = backgroundImage
        self.screenshots = screenshots
        self.deviceFrame = deviceFrame
        self.layoutDirection = layoutDirection
    }
}
