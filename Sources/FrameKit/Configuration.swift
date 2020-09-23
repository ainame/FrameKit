import Foundation
import SwiftUI

public struct Configuration {
    let locale: Locale
    let outputPath: String
    let keyword: String
    let title: String
    let backgroundImage: String?
    let screenshots: [String]
    let deviceFrame: String
    let layoutDirection: LayoutDirection

    public init(
        locale: Locale,
        outputPath: String,
        keyword: String,
        title: String,
        backgroundImage: String?,
        screenshots: [String],
        deviceFrame: String,
        layoutDirection: LayoutDirection
    ) {
        self.locale = locale
        self.outputPath = outputPath
        self.keyword = keyword
        self.title = title
        self.backgroundImage = backgroundImage
        self.screenshots = screenshots
        self.deviceFrame = deviceFrame
        self.layoutDirection = layoutDirection
    }
}
