// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Character",
    platforms: [.iOS(.v11)],
    products: [
        .library(
            name: "Character",
            targets: ["Character"]),
    ],
    dependencies: [
        .package(path: "../../Core"),
        .package(path: "../Episode"),
        .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.6.1"))
    ],
    targets: [
        .target(
            name: "Character",
            dependencies: ["Core",
                           "Episode",
                           "Alamofire",
                           .product(name: "CoreUI", package: "Core")]),
        .testTarget(
            name: "CharacterTests",
            dependencies: ["Character",
                          "Core",
                          "Episode"],
            resources: [.process("Resources")]
        ),
    ]
)
