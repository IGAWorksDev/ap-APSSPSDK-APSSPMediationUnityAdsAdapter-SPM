// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "APSSPMediationUnityAds",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(name: "APSSPMediationUnityAds", targets: ["APSSPMediationUnityAds"]),
    ],
    dependencies: [
        .package(url: "https://github.com/IGAWorksDev/ap-APSSPSDK-SPM.git", from: "3.4.0"),
        .package(url: "https://github.com/Unity-Technologies/Unity-Ads-Swift-Package.git", exact: "4.18.0"),
    ],
    targets: [
        .target(name: "APSSPMediationUnityAds",
                dependencies: [
                    .product(name: "APSSPSDK", package: "ap-APSSPSDK-SPM"),
                    .product(name: "UnityAds", package: "Unity-Ads-Swift-Package"),
                ],
                path: "Sources/MediationUnityAds"),
    ]
)
