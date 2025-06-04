// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Claireity-SSIAM",
    targets: [
        .executableTarget(name: "Claireity-SSIAM"),
        .testTarget(
            name: "ClaireitySSIAMTests",
            dependencies: ["Claireity-SSIAM"])
    ]
)
