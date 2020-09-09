import ArgumentParser
import DefaultFrameitLayout
import Foundation
import FrameitLib

enum DefaultLayoutOption: String, RawRepresentable, ExpressibleByArgument, LayoutProviderOption {
    case iPhone65 = "iphone_65"
    case iPhone65Hero = "iphone_65_hero"
    case iPhone55 = "iphone_55"
    case iPadPro = "ipad_pro"
    case iPadPro3rdGen = "ipad_pro_3rd_gen"

    public init?(argument: String) {
        self.init(rawValue: argument)
    }

    public var value: DefaultLayout {
        switch self {
        case .iPadPro: return DefaultLayout.iPadPro
        case .iPadPro3rdGen: return DefaultLayout.iPadPro3rdGen
        case .iPhone55: return DefaultLayout.iPhone55
        case .iPhone65: return DefaultLayout.iPhone65
        case .iPhone65Hero: return DefaultLayout.iPhone65Hero
        }
    }
}

