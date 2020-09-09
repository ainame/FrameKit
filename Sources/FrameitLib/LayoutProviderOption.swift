import ArgumentParser
import Foundation

public protocol LayoutProviderOption: ExpressibleByArgument, CaseIterable, RawRepresentable where RawValue == String {
    associatedtype Layout: LayoutProvider
    var value: Layout { get }
}
