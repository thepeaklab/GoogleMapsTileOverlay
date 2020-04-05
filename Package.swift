// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GoogleMapsTileOverlay",
    platforms: [
      .macOS("10.13"),
      .iOS("8.4"),
      .tvOS("9.2")
    ],
    products: [
        .library(
            name: "GoogleMapsTileOverlay",
            targets: ["GoogleMapsTileOverlay"]),
    ],
    targets: [
        .target(
            name: "GoogleMapsTileOverlay",
            dependencies: []),
        .testTarget(
            name: "GoogleMapsTileOverlayTests",
            dependencies: ["GoogleMapsTileOverlay"]),
    ],
    swiftLanguageVersions: [.v5]
)
