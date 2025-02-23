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
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .binaryTarget(
            name: "TXLiteAVSDK_Live",
            url: "https://liteav.sdk.qcloud.com/download/spm/12.3/live/TXLiteAVSDK_Live.xcframework.zip",
            checksum: "873fe34490f9d02540d25abc7b6de646888e3af369c7d608fbff5b1d47debf8f"
        ),
        .binaryTarget(
            name: "TXFFmpeg",
            url: "https://liteav.sdk.qcloud.com/download/spm/12.3/live/TXFFmpeg.xcframework.zip",
            checksum: "8ea98c5bda7f745c7da93bb9378b5b163170b9eb436452151c5bab4e9ec6230c"
        ),
        .binaryTarget(
            name: "TXSoundTouch",
            url: "https://liteav.sdk.qcloud.com/download/spm/12.3/live/TXSoundTouch.xcframework.zip",
            checksum: "7d2840f8d332af3b2ceab4ac0776256e7c50264a13a910e08376ed580bf6db68"
        ),.target(
            name: "Live_SwiftPM",
            dependencies: [
                .target(name: "TXLiteAVSDK_Live"),
                .target(name: "TXFFmpeg"),
                .target(name: "TXSoundTouch")
            ],
            sources: ["Live_SwiftPM.swift"],
            linkerSettings: [
                .linkedFramework("AVKit"),
                .linkedFramework("GLKit"),
                .linkedFramework("AssetsLibrary"),
                .linkedFramework("SystemConfiguration"),
                .linkedFramework("CoreTelephony"),
                .linkedFramework("AVFoundation"),
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
        )
    ]
)

