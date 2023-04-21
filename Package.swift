// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FutureFlow",
    platforms: [
        .iOS(.v14),
        .macOS(.v11),
        .tvOS(.v14),
        .watchOS(.v7)
    ],
    products: [
        .library(
            name: "FutureFlow",
            targets: ["FutureFlow"]),
    ],
    targets: [
        .target(
            name: "FutureFlow",
            dependencies: [],
            path: "Sources"),
//        .target(name: "ContentView")
        .testTarget(
            name: "FutureFlowTests",
            dependencies: ["FutureFlow"],
            path: "Tests/FutureFlowTests"),
    ],
    swiftLanguageVersions: [.v5]
)
