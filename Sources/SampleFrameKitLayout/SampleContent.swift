import AppKit

public struct SampleContent {
    public let locale: Locale
    public let keyword: String
    public let title: String
    public let backgroundImage: NSImage?
    public let framedScreenshots: [NSImage]

    public init(locale: Locale, keyword: String, title: String, backgroundImage: NSImage? = nil, framedScreenshots: [NSImage]) {
        self.locale = locale
        self.keyword = keyword
        self.title = title
        self.backgroundImage = backgroundImage
        self.framedScreenshots = framedScreenshots
    }
}
