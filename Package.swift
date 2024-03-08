// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CVulkan",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "CVulkan",
            targets: ["CVulkan"]
        ),
        .executable(name: "VulkanDemo", targets: ["VulkanDemo"])
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .systemLibrary(
            name: "CVulkan"
        ),
        .executableTarget(
            name: "VulkanDemo",
            dependencies: ["CVulkan"],
            cSettings: [
                .unsafeFlags(["-I", "C:\\VulkanSDK\\1.3.211.0\\Include"], .when(platforms: [.windows]))
            ],
            linkerSettings: [
                .unsafeFlags(["-Xlinker", "-rpath", "-Xlinker", "/usr/local/lib"], .when(platforms: [.macOS])),
                .unsafeFlags(["-L", "C:\\VulkanSDK\\1.3.211.0\\Lib"], .when(platforms: [.windows]))
            ]
        )
    ]
)
