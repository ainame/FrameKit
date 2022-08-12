import ArgumentParser
import SampleFrameKitLayout
import Foundation
import FrameKit

public enum SampleLayoutOption: String, RawRepresentable, ExpressibleByArgument, LayoutProviderOption {
    case iPhone65 = "iphone_65"
    case iPhone55 = "iphone_55"
    case iPadPro = "ipad_pro"
    case iPadPro3rdGen = "ipad_pro_3rd_gen"
    case iPhone65Hero = "iphone_65_hero"
    case iPhone55Hero = "iphone_55_hero"
    case iPadProHero = "ipad_pro_hero"
    case iPadPro3rdGenHero = "ipad_pro_3rd_gen_hero"

    case iPhone65Landscape = "iphone_65_landscape"
    case iPhone55Landscape = "iphone_55_landscape"
    case iPadProLandscape = "ipad_pro_landscape"
    case iPadPro3rdGenLandscape = "ipad_pro_3rd_gen_landscape"
    case iPhone65HeroLandscape = "iphone_65_hero_landscape"
    case iPhone55HeroLandscape = "iphone_55_hero_landscape"
    case iPadProHeroLandscape = "ipad_pro_hero_landscape"
    case iPadPro3rdGenHeroLandscape = "ipad_pro_3rd_gen_hero_landscape"

    public init?(argument: String) {
        self.init(rawValue: argument)
    }

    public var value: SampleLayout {
        switch self {
        case .iPadPro: return .iPadPro
        case .iPadPro3rdGen: return .iPadPro3rdGen
        case .iPhone55: return .iPhone55
        case .iPhone65: return .iPhone65
        case .iPhone65Hero: return .iPhone65Hero
        case .iPadPro3rdGenHero: return .iPadPro3rdGenHero
        case .iPadProHero: return .iPadProHero
        case .iPhone55Hero: return .iPhone55Hero
        case .iPadProLandscape: return .iPadProLandscape
        case .iPadPro3rdGenLandscape: return .iPadPro3rdGenLandscape
        case .iPhone55Landscape: return .iPhone55Landscape
        case .iPhone65Landscape: return .iPhone65Landscape
        case .iPhone65HeroLandscape: return .iPhone65HeroLandscape
        case .iPadPro3rdGenHeroLandscape: return .iPadPro3rdGenHeroLandscape
        case .iPadProHeroLandscape: return .iPadProHeroLandscape
        case .iPhone55HeroLandscape: return .iPhone55HeroLandscape
        }
    }
}

