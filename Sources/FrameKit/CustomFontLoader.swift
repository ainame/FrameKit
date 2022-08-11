import Foundation
import CoreText

public class CustomFontLoader {
    public static var shared = CustomFontLoader()

    private var registeredUrls: Set<URL> = []

    public func registerFont(at url: URL) throws {
        guard registeredUrls.contains(url) else {
            return
        }

        var error: Unmanaged<CFError>?

        CTFontManagerRegisterFontsForURL(url as CFURL, .process, &error)

        if let error = error?.takeRetainedValue() {
            throw error
        }

        registeredUrls.insert(url)
    }
}
