import Foundation
import CoreText

public class CustomFontLoader {
    public static func registerFont(at url: URL) throws {
        var error: Unmanaged<CFError>?

        CTFontManagerRegisterFontsForURL(url as CFURL, .process, &error)

        if let error = error?.takeRetainedValue() {
            throw error
        }
    }
}
