// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "AMRNetworkSDK",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "AMRNetworkSDK",
            targets: ["AMRNetworkSDK"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/admost/AMR-IOS-SDK.git", from: "1.5.92")
    ],
    targets: [
        .target(
            name: "AMRNetworkSDK",
            dependencies: [
                "AMRNetworkSDKLib",
                .product(name: "AMRSDK", package: "AMR-IOS-SDK")
            ],
            path: "AMRNetworkSDK",
            exclude: ["Libs"]
        ),
        .binaryTarget(
            name: "AMRNetworkSDKLib",
            url: "https://github.com/admost/AMR-IOS-NETWORK-SDK/releases/download/1.0.1/AMRNetworkSDK.xcframework.zip",
            checksum: "fe0ddfa95cbb1d9b31285f3348793cbbdf6ccf6339ce5ab2e74faab1af03bc14"
        )
    ]
)
