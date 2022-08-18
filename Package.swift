// swift-tools-version:5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FrameKit",
    platforms: [
        .macOS(.v10_15)
    ],
    products: [
        .executable(name: "framekit", targets: ["SampleFrameKitCLI"]),
        .library(name: "FrameKit", targets: ["FrameKit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "0.5.0"),
        .package(url: "https://github.com/apple/swift-algorithms", from: "1.0.0")
    ],
    targets: [
        .target(
            name: "FrameKit",
            dependencies: [
                .product(name: "Algorithms", package: "swift-algorithms")
            ]
        ),
        .executableTarget(
            name: "SampleFrameKitCLI",
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
            name: "FrameKitTests",
            dependencies: [
                .target(name: "FrameKit")
            ]
        ),
    ]
)
