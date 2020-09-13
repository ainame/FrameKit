import ArgumentParser
import DefaultFrameitLayout
import Foundation
import FrameitLib

enum DefaultLayoutOption: String, RawRepresentable, ExpressibleByArgument, LayoutProviderOption {
    case iPhone65 = "iphone_65"
    case iPhone55 = "iphone_55"
    case iPadPro = "ipad_pro"
    case iPadPro3rdGen = "ipad_pro_3rd_gen"
    case iPhone65Hero = "iphone_65_hero"
    case iPhone55Hero = "iphone_55_hero"
    case iPadProHero = "ipad_pro_hero"
    case iPadPro3rdGenHero = "ipad_pro_3rd_gen_hero"

    public init?(argument: String) {
        self.init(rawValue: argument)
    }

    public var value: DefaultLayout {
        switch self {
        case .iPadPro: return .iPadPro
        case .iPadPro3rdGen: return .iPadPro3rdGen
        case .iPhone55: return .iPhone55
        case .iPhone65: return .iPhone65
        case .iPhone65Hero: return .iPhone65Hero
        case .iPadPro3rdGenHero: return .iPadPro3rdGenHero
        case .iPadProHero: return .iPadProHero
        case .iPhone55Hero: return .iPhone55Hero
        }
    }
}

