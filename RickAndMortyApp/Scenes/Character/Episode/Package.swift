// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Episode",
    platforms: [.iOS(.v11)],
    products: [
        .library(
            name: "Episode",
            targets: ["Episode"]),
    ],
    dependencies: [
        .package(path: "../../Core"),
        .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.6.1"))
    ],
    targets: [
        .target(
            name: "Episode",
            dependencies: ["Core",
                           "Alamofire"]),
        .testTarget(
            name: "EpisodeTests",
            dependencies: ["Episode"]),
    ]
)
