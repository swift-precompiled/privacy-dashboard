// swift-tools-version:5.9.0

import PackageDescription
import Foundation

let package = Package(
    name: "privacy-dashboard",
    platforms: [.iOS("14.0"), .macOS("10.15")],
    products: [
        .library(
            name: "PrivacyDashboardResources",
            targets: [
                "PrivacyDashboardResources",
                "PrivacyDashboard-resources",
                "PrivacyDashboardResources_PrecompiledProduct"
            ]
        )
    ],
    targets: [
        .target(
            name: "PrivacyDashboardResources_Aggregation",
            dependencies: ["PrivacyDashboardResources"],
            packageAccess: false,
            swiftSettings: [.define("SCIPIO_PRECOMPILED_BINARY_WRAPPER")]
        ),
        .binaryTarget(
            name: "PrivacyDashboardResources",
            url: "https://github.com/swift-precompiled/privacy-dashboard/releases/download/9.10.2/PrivacyDashboardResources-db0d9a82ae8901e9cb7c46e20b5b76cacfb13f752a1dbb2e677c7b55080bb1a8.xcframework.zip",
            checksum: "db0d9a82ae8901e9cb7c46e20b5b76cacfb13f752a1dbb2e677c7b55080bb1a8"
        ),
        .target(
            name: "PrivacyDashboard-resources_Aggregation",
            dependencies: ["PrivacyDashboard-resources"],
            resources: [
                .copy("app/html"),
                .copy("app/img"),
                .copy("app/public"),
                .copy("app/index.html")
            ],
            packageAccess: false,
            swiftSettings: [.define("SCIPIO_PRECOMPILED_BINARY_WRAPPER")]
        ),
        .binaryTarget(
            name: "PrivacyDashboard-resources",
            url: "https://github.com/swift-precompiled/privacy-dashboard/releases/download/9.10.2/PrivacyDashboard_resources-8f11d17e9e2cc948030cc4d67196260686bcc25a5efc257b213544a579325db7.xcframework.zip",
            checksum: "8f11d17e9e2cc948030cc4d67196260686bcc25a5efc257b213544a579325db7"
        ),
        .target(
            name: "PrivacyDashboardResources_PrecompiledProduct",
            dependencies: ["PrivacyDashboardResources_Aggregation", "PrivacyDashboard-resources_Aggregation"],
            packageAccess: false
        )
    ]
)