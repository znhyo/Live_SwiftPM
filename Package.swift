// swift-tools-version: 6.0.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Live_SwiftPM",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Live_SwiftPM",
            targets: ["Live_SwiftPM"]),
        .library(
            name: "TXLiteAVSDK_ReplayKit",
            targets: ["TXLiteAVSDK_ReplayKitExt"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .binaryTarget(
            name: "TXLiteAVSDK_Live",
            url: "https://liteav.sdk.qcloud.com/download/spm/12.3/live/TXLiteAVSDK_Live.xcframework.zip",
            checksum: "4b324e883520a7432bdad1b5dbec721e8b33c66cb4b4f03f82537412749b8c5f"
        ),
        .binaryTarget(
            name: "TXFFmpeg",
            url: "https://liteav.sdk.qcloud.com/download/spm/12.3/live/TXFFmpeg.xcframework.zip",
            checksum: "5ad545234a6d5c04033c31f0aa0081ca612ec9e884fb3c76d364932692aebe56"
        ),
        .binaryTarget(
            name: "TXLiteAVSDK_ReplayKitExt",
            url: "https://liteav.sdk.qcloud.com/download/spm/12.3/professional/TXLiteAVSDK_ReplayKitExt.xcframework.zip",
            checksum: "898f4af0c0298a451aaa1929f4e256496e55661539991c3c48c13379840d3b10"
        ),
        .binaryTarget(
            name: "TXSoundTouch",
            url: "https://liteav.sdk.qcloud.com/download/spm/12.3/live/TXSoundTouch.xcframework.zip",
            checksum: "3ede6eb249dc8e68ad62ff4a20dd90064c98beb077763d308dee3741641eedcf"
        ),.target(
            name: "Live_SwiftPM",
            dependencies: [
                .target(name: "TXLiteAVSDK_Live"),
                .target(name: "TXFFmpeg"),
                .target(name: "TXSoundTouch")
            ],
            sources: ["Live_SwiftPM.swift"],
            linkerSettings: [
                .linkedFramework("ReplayKit"),
                .linkedFramework("VideoToolbox"),
                .linkedFramework("AVKit"),
                .linkedFramework("GLKit"),
                .linkedFramework("AssetsLibrary"),
                .linkedFramework("SystemConfiguration"),
                .linkedFramework("CoreTelephony"),
                .linkedFramework("AVFoundation"),
                .linkedFramework("CoreMotion"),
                .linkedFramework("OpenGLES"),
                .linkedFramework("Accelerate"),
                .linkedFramework("MetalKit"),
                .linkedFramework("MobileCoreServices"),
                .linkedFramework("CoreMedia"),
                .linkedFramework("MetalPerformanceShaders"),
                .linkedLibrary("sqlite3.0"),
                .linkedLibrary("c++"),
                .linkedLibrary("resolv")
            ]
        ),.target(
            name: "TXLiteAVSDK_ReplayKit",
            dependencies: [
                .target(name: "TXLiteAVSDK_ReplayKitExt")
            ],
            sources: ["TXLiteAVSDK_ReplayKitExt.swift"]
        )
    ]
)

