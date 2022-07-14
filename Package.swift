// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "tuist-swiftlint",
    platforms: [.macOS(.v11)],
    products: [
        .executable(
            name: "tuist-swiftlint",
            targets: [
                "SwiftLintTuistPlugin",
            ]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/realm/SwiftLint", revision: "e497f1f"),
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.0.0"),
        .package(url: "https://github.com/scottrhoyt/SwiftyTextTable", from: "0.9.0"),
    ],
    targets: [
        .executableTarget(
            name: "SwiftLintTuistPlugin",
            dependencies: [
                .product(name: "SwiftLintFramework", package: "SwiftLint"),
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                .product(name: "SwiftyTextTable", package: "SwiftyTextTable"),
            ]
        ),
    ]
)
