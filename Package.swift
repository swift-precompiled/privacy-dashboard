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
            swiftSettings: [.define("SCIPIO_PRECOMPILED_BINARY_WRAPPER")]
        ),
        .binaryTarget(
            name: "PrivacyDashboardResources",
            url: "https://github.com/swift-precompiled/privacy-dashboard/releases/download/9.10.2/PrivacyDashboardResources-7523f8a077bc7fc601bb8e077af0f5c6ec03b622ede3faaaf7a1c7ff92a73b8a.xcframework.zip",
            checksum: "7523f8a077bc7fc601bb8e077af0f5c6ec03b622ede3faaaf7a1c7ff92a73b8a"
        ),
        .target(
            name: "PrivacyDashboard-resources_Aggregation",
            dependencies: ["PrivacyDashboard-resources"],
            swiftSettings: [.define("SCIPIO_PRECOMPILED_BINARY_WRAPPER")]
        ),
        .binaryTarget(
            name: "PrivacyDashboard-resources",
            url: "https://github.com/swift-precompiled/privacy-dashboard/releases/download/9.10.2/PrivacyDashboard_resources-71b736be99feb0b7c7c0c70f755667be5dd8f4e8375d6e6d21ee154a266b4f96.xcframework.zip",
            checksum: "71b736be99feb0b7c7c0c70f755667be5dd8f4e8375d6e6d21ee154a266b4f96"
        ),
        .target(
            name: "PrivacyDashboardResources_PrecompiledProduct",
            dependencies: ["PrivacyDashboardResources_Aggregation", "PrivacyDashboard-resources_Aggregation"]
        )
    ]
)