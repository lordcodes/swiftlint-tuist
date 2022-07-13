// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "tuist-swiftlint",
    platforms: [.macOS(.v11)],
    products: [
        .executable(
            name: "tuist-swiftlint",
            targets: ["SwiftLintTuistPlugin"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/realm/SwiftLint", exact: "0.47.1"),
    ],
    targets: [
        .executableTarget(
            name: "SwiftLintTuistPlugin",
            dependencies: [
                .product(name: "SwiftLint", package: "SwiftLintFramework"),
            ]
        ),
    ]
)
