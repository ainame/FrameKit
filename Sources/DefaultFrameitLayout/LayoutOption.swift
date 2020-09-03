import ArgumentParser
import FrameitLib
import Foundation

public enum LayoutOption: String, RawRepresentable, ExpressibleByArgument, LayoutConfigurationProviderOption {
    case iPhone65 = "iphone_65"
    case iPhone65Hero = "iphone_65_hero"
    case iPhone55 = "iphone_55"
    case iPadPro = "ipad_pro"
    case iPadPro3rdGen = "ipad_pro_3rd_gen"

    public init?(argument: String) {
        self.init(rawValue: argument)
    }

    public var value: LayoutConfigurationProvider {
        switch self {
        case .iPadPro: return Layout.iPadPro
        case .iPadPro3rdGen: return Layout.iPadPro3rdGen
        case .iPhone55: return Layout.iPhone55
        case .iPhone65: return Layout.iPhone65
        case .iPhone65Hero: return Layout.iPhone65Hero
        }
    }
}

