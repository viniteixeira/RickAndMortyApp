// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Character",
    products: [
        .library(
            name: "Character",
            targets: ["Character"]),
    ],
    dependencies: [
        .package(path: "../../Core")
    ],
    targets: [
        .target(
            name: "Character",
            dependencies: ["Core",
                          "CoreUI"]),
        .testTarget(
            name: "CharacterTests",
            dependencies: ["Character"]),
    ]
)
