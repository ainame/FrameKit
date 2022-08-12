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
        .package(url: "https://github.com/apple/swift-argument-parser", from: "0.2.0"),
    ],
    targets: [
        .target(
            name: "FrameKit"
        ),
        .executableTarget(
            name: "FrameKitCLI",
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
