// swift-tools-version: 5.8

import PackageDescription

let package = Package(
    name: "newPackage",
    products: [
        .library(
            name: "newPackage",
            targets: ["newPackage"]),
    ],
    dependencies: [
        .package(url: "https://github.com/scinfu/SwiftSoup", from: "2.0.0")
    ],
    targets: [
        .target(
            name: "newPackage",
            dependencies: ["SwiftSoup"]),
        .testTarget(
            name: "newPackageTests",
            dependencies: ["newPackage"]),
    ]
)
