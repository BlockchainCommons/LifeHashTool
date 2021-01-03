// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "LifeHashTool",
    platforms: [
        .macOS(.v11)
    ],
    dependencies: [
//        .package(path: "../LifeHash"),
        .package(url: "https://github.com/BlockchainCommons/LifeHash.git", from: "5.0.0"),
    ],
    targets: [
        .target(
            name: "LifeHashTool",
            dependencies: ["LifeHash"])
    ]
)
