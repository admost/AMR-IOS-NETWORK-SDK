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
        .package(url: "https://github.com/admost/AMR-IOS-SDK.git", from: "1.5.91")
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
            url: "https://github.com/admost/AMR-IOS-NETWORK-SDK/releases/download/1.0.0/AMRNetworkSDK.xcframework.zip",
            checksum: "393fd6fca537f6c01f4b06e890e7a31e87f598be3ced4671eeddfeb4f50ea375"
        )
    ]
)
