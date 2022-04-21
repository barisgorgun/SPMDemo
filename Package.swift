// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MobileSDK",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(
            name: "MobileSDK",
            targets: ["WebRTCA","Dependencies","MobileSDK"]),
    ],
    dependencies: [
        .package(url: "https://github.com/barisgorgun/SPMWebRTC.git", branch: "packageFile"),
    ],
    targets: [
        .target(name: "WebRTCA",
                dependencies: [.product(name: "WebRTC", package: "SPMWebRTC")]),
        
            .target(
                name: "Dependencies",
                cSettings: [
                    .define("OTHER_LDFLAGS",to: "-ObjC"),
                    .define("ENABLE_BITCODE", to: "NO")
                ],
                linkerSettings: [
                    .linkedFramework("AudioToolbox"),
                    .linkedFramework("VideoToolbox"),
                    .linkedFramework("SystemConfiguration"),
                    .linkedFramework("AVFoundation"),
                    .linkedFramework("GLKit"),
                    .linkedFramework("PushKit"),
                    .linkedLibrary("c++"),
                    .linkedLibrary("z"),
                    .linkedLibrary("icucore"),
                ]
            ),
        
            .binaryTarget(name: "MobileSDK",
                          path: "MobileSDK.xcframework"),
        
    ]
)
