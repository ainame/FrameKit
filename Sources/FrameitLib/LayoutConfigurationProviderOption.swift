import ArgumentParser
import Foundation

public protocol LayoutConfigurationProviderOption: ExpressibleByArgument, CaseIterable, RawRepresentable where RawValue == String {
    var value: LayoutConfigurationProvider { get }
}
