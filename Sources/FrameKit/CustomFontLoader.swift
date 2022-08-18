import Foundation
import CoreText

public class CustomFontLoader {
    public struct FontEntry: Hashable {
        let fileURL: URL
        let fontName: String
    }

    public static var shared = CustomFontLoader()

    private var registeredFonts: Set<FontEntry> = []

    public func registerFont(at url: URL, with fontName: String) throws {
        let entry = FontEntry(fileURL: url, fontName: fontName)
        if registeredFonts.contains(entry) {
            return
        }

        var error: Unmanaged<CFError>?

        CTFontManagerRegisterFontsForURL(entry.fileURL as CFURL, .process, &error)

        if let error = error?.takeRetainedValue() {
            throw error
        }

        registeredFonts.insert(entry)
    }
}
