import Foundation

public protocol LayoutProviderOption: CaseIterable, RawRepresentable where RawValue == String {
    associatedtype Layout: LayoutProvider
    var value: Layout { get }
}
