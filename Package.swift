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
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "CVulkan",
            publicHeadersPath: ".",
            linkerSettings: [
                .unsafeFlags(["-LSources/CVulkan/1.3.211/lib/win32", "-lvulkan-1"], .when(platforms: [.windows])),
                .unsafeFlags(["-Xlinker", "-rpath", "-Xlinker", "Sources/CVulkan/1.3.211/lib/macos", "-lvulkan"], .when(platforms: [.macOS]))
            ]
        ),
        .testTarget(
            name: "CVulkanTests",
            dependencies: ["CVulkan"]
        )
    ]
)
