import Foundation
import SwiftUI
import FrameKit

extension StoreScreenshotView where Self.Layout == SampleLayout {
    var keywordFont: Font { Font.system(size: layout.keywordFontSize, weight: .bold, design: .default) }
    var titleFont: Font { Font.system(size: layout.titleFontSize, weight: .regular, design: .default) }
}
