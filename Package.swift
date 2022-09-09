// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "tuist-swiftlint",
    platforms: [.macOS(.v12)],
    products: [
        .executable(
            name: "tuist-swiftlint",
            targets: [
                "SwiftLintPlugin",
            ]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/realm/SwiftLint", revision: "57dc1c9"), // v0.49.1
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.0.0"),
        .package(url: "https://github.com/scottrhoyt/SwiftyTextTable", from: "0.9.0"),
        .package(url: "https://github.com/JohnSundell/CollectionConcurrencyKit", from: "0.2.0"),
    ],
    targets: [
        .executableTarget(
            name: "SwiftLintPlugin",
            dependencies: [
                "SwiftLintPluginKit",
            ]
        ),
        .target(
            name: "SwiftLintPluginKit",
            dependencies: [
                "SwiftLintWrapper",
            ]
        ),
        .target(
            name: "SwiftLintWrapper",
            dependencies: [
                .product(name: "SwiftLintFramework", package: "SwiftLint"),
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                .product(name: "CollectionConcurrencyKit", package: "CollectionConcurrencyKit"),
                .product(name: "SwiftyTextTable", package: "SwiftyTextTable"),
            ]
        ),
        .testTarget(
            name: "SwiftLintPluginKitTests",
            dependencies: [
                "SwiftLintPluginKit",
            ]
        ),
    ]
)
