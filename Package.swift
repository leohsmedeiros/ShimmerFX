// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ShimmerFX",
    platforms: [
        .macOS(.v14),
        .iOS(.v14),
        .watchOS(.v10),
        .tvOS(.v17)
    ],
    products: [
        .library(name: "ShimmerFX", targets: ["ShimmerFX"])
    ],
    targets: [
        .target(name: "ShimmerFX")
    ]
)
