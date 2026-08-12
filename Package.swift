// swift-tools-version:5.9.0

import PackageDescription
import Foundation

let package = Package(
    name: "privacy-dashboard",
    platforms: [.iOS("14.0"), .macOS("10.15")],
    products: [
        .library(
            name: "PrivacyDashboardResources",
            targets: ["PrivacyDashboardResources_PrecompiledProduct"]
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
            url: "https://github.com/swift-precompiled/privacy-dashboard/releases/download/9.10.2/PrivacyDashboardResources-9de87ea228a2e7a2edeb934826b9fa0721688863f2fcdd1d0b992fdbd943dd17.xcframework.zip",
            checksum: "9de87ea228a2e7a2edeb934826b9fa0721688863f2fcdd1d0b992fdbd943dd17"
        ),
        .target(
            name: "PrivacyDashboard-resources_Aggregation",
            dependencies: ["PrivacyDashboard-resources"],
            swiftSettings: [.define("SCIPIO_PRECOMPILED_BINARY_WRAPPER")]
        ),
        .binaryTarget(
            name: "PrivacyDashboard-resources",
            url: "https://github.com/swift-precompiled/privacy-dashboard/releases/download/9.10.2/PrivacyDashboard_resources-534268397f35a3dcbc03a79bd01bcc393a1c10e2fc85dbcf41ecaecf3b9ad585.xcframework.zip",
            checksum: "534268397f35a3dcbc03a79bd01bcc393a1c10e2fc85dbcf41ecaecf3b9ad585"
        ),
        .target(
            name: "PrivacyDashboardResources_PrecompiledProduct",
            dependencies: ["PrivacyDashboardResources_Aggregation", "PrivacyDashboard-resources_Aggregation"]
        )
    ]
)