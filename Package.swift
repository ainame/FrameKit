// swift-tools-version:5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FrameKit",
    platforms: [
        .macOS(.v10_15)
    ],
    products: [
        .executable(name: "framekit", targets: ["FrameKitCLI"]),
        .executable(name: "framekit-template", targets: ["FrameKitTemplateCLI"]),
        .library(name: "DefaultFrameKitLayout", targets: ["DefaultFrameKitLayout"]),
        .library(name: "FrameKit", targets: ["FrameKit"]),
        .library(name: "FrameKitCLILib", targets: ["FrameKitCLILib"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/apple/swift-argument-parser", from: "0.2.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "FrameKitCLI",
            dependencies: [
                .target(name: "FrameKit"),
                .target(name: "FrameKitCLILib"),
                .target(name: "DefaultFrameKitLayout"),
            ]
        ),
        .target(
            name: "FrameKitCLILib",
            dependencies: [
                .target(name: "FrameKit"),
                .target(name: "DefaultFrameKitLayout"),
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
            ]
        ),
        .target(
            name: "FrameKitTemplateCLI",
            dependencies: [
                .target(name: "FrameKit"),
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
            ]
        ),
        .target(
            name: "DefaultFrameKitLayout",
            dependencies: [
                .target(name: "FrameKit"),
            ]
        ),
        .target(
            name: "FrameKit",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
            ]
        ),
        .testTarget(
            name: "FrameKitCLITests",
            dependencies: [
                .target(name: "FrameKitCLI")
            ]
        ),
    ]
)
