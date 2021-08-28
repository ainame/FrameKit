import Foundation
import SwiftUI

// This is the minimal requirement to be able to work with `Frameit.run`
public protocol LayoutProvider {
    var size: CGSize { get }
    var deviceFrameOffset: CGSize { get }
}
