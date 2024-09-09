// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "swifty",
    platforms: [.macOS(.v14)],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser.git", from: "1.2.0"),
        .package(url: "https://github.com/JohnSundell/ShellOut.git", from: "2.0.0"),
        .package(url: "https://github.com/JohnSundell/Files", from: "4.2.0"),
    ],
    targets: [
        .executableTarget(
            name: "swifty",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                .product(name: "ShellOut", package: "shellout"),
                .product(name: "Files", package: "files"),
            ]
        ),
    ]
)
