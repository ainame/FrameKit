import AppKit

// To expand a file path written as relative path
public func absolutePath(_ relativePath: String) -> String {
    URL(fileURLWithPath: NSString(string: relativePath).expandingTildeInPath).path
}

// Helper to work out numbers in `point` unit from numbers in `pixel`
@available(*, deprecated, message: "Just remove this helper. Now FrameKit use point unit that matches pixel.")
public func pixel(_ point: CGFloat, scale: CGFloat = 1.0) -> CGFloat {
    point / scale
}

func logError(_ message: String) {
    print(message)
}

func convertToImage(view: NSView, format: NSBitmapImageRep.FileType) -> Data? {
    guard let bitmapRepresentation = view.bitmapImageRepForCachingDisplay(in: view.frame) else {
        return nil
    }
    bitmapRepresentation.size = view.frame.size
    view.cacheDisplay(in: view.frame, to: bitmapRepresentation)
    return bitmapRepresentation.representation(using: format, properties: [:])
}
