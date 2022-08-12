import SwiftUI

public protocol StoreScreenshotView: View {
    associatedtype Layout: LayoutProvider
    associatedtype Content

    var layout: Layout { get }
    var content: Content { get }
    static func makeView(layout: Layout, content: Content) -> Self
}
