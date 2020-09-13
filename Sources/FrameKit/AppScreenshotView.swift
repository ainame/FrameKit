import SwiftUI

public protocol AppScreenshotView: View {
    associatedtype Layout: LayoutProvider
    
    var layout: Layout { get }
    var content: ContentProvider { get }
    static func makeView(layout: Layout, content: ContentProvider) -> Self
}
