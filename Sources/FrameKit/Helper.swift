import AppKit

// To expand a file path written as relative path
public func absolutePath(_ relativePath: String) -> String {
    URL(fileURLWithPath: NSString(string: relativePath).expandingTildeInPath).path
}

func convertToImage(view: NSView, format: NSBitmapImageRep.FileType) -> Data? {
    guard let bitmapRepresentation = view.bitmapImageRepForCachingDisplay(in: view.frame) else {
        return nil
    }
    bitmapRepresentation.pixelsHigh = Int(view.frame.size.height)
    bitmapRepresentation.pixelsWide = Int(view.frame.size.width)
    bitmapRepresentation.size = view.frame.size
    view.cacheDisplay(in: view.frame, to: bitmapRepresentation)
    return bitmapRepresentation.representation(using: format, properties: [:])
}
