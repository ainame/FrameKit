import Foundation
import SwiftUI
import FrameitLib

extension AppScreenshotView where Self.Layout == DefaultLayout {
    var keywordFont: Font { Font.system(size: layout.keywordFontSize, weight: .bold, design: .default) }
    var titleFont: Font { Font.system(size: layout.titleFontSize, weight: .regular, design: .default) }
}
