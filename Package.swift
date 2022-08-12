// swift-tools-version:5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FrameKit",
    platforms: [
        .macOS(.v10_15)
    ],
    products: [
        .executable(name: "framekit", targets: ["FrameKitCLI"]),
        .library(name: "FrameKit", targets: ["FrameKit"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/apple/swift-argument-parser", from: "0.2.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .executableTarget(
            name: "FrameKitCLI",
            dependencies: [
                .target(name: "FrameKit"),
                .target(name: "FrameKitCLILib"),
                .target(name: "SampleFrameKitLayout"),
            ]
        ),
        .target(
            name: "FrameKitCLILib",
            dependencies: [
                .target(name: "FrameKit"),
                .target(name: "SampleFrameKitLayout"),
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
            ]
        ),
        .target(
            name: "SampleFrameKitLayout",
            dependencies: [
                .target(name: "FrameKit"),
            ]
        ),
        .target(
            name: "FrameKit"
        ),
        .testTarget(
            name: "FrameKitCLITests",
            dependencies: [
                .target(name: "FrameKitCLI")
            ]
        ),
    ],
    swiftLanguageVersions: [
        .version("5.7")
    ]
)
