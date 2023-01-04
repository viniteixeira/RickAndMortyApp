// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Core",
    products: [
        .library(
            name: "Core",
            targets: ["Core"]),
        .library(name: "CoreUI",
                 targets: ["CoreUI"])
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Core",
            dependencies: []),
        .target(
            name: "CoreUI",
            dependencies: []),
        .testTarget(
            name: "CoreTests",
            dependencies: ["Core"]),
    ]
)
