// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "frameit",
    platforms: [
        .macOS(.v10_15)
    ],
    products: [
        .executable(name: "frameit", targets: ["FrameitCLI"]),
        .library(name: "DefaultFrameitLayout", targets: ["DefaultFrameitLayout"]),
        .library(name: "FrameitLib", targets: ["FrameitLib"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/apple/swift-argument-parser", from: "0.2.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "FrameitCLI",
            dependencies: [
                .target(name: "FrameitLib"),
                .target(name: "DefaultFrameitLayout"),
            ]
        ),
        .target(
            name: "DefaultFrameitLayout",
            dependencies: [
                .target(name: "FrameitLib"),
            ]
        ),
        .target(
            name: "FrameitLib",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
            ]
        ),
        .testTarget(
            name: "FrameitCLITests",
            dependencies: [
                .target(name: "FrameitCLI")
            ]
        ),
    ]
)
