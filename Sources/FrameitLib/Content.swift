import AppKit

public struct Content: ContentProvider {
    public let keyword: String
    public let title: String
    public let backgroundImage: NSImage?
    public let framedScreenshots: [NSImage]

    public init(keyword: String, title: String, backgroundImage: NSImage? = nil, framedScreenshots: [NSImage]) {
        self.keyword = keyword
        self.title = title
        self.backgroundImage = backgroundImage
        self.framedScreenshots = framedScreenshots
    }
}
