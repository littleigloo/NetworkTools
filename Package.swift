// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NetworkTools",
    platforms: [.macOS(.v10_12),
                .iOS(.v10),
                .tvOS(.v10),
                .watchOS(.v3)],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "NetworkTools",
            targets: ["NetworkTools"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/tristanhimmelman/ObjectMapper.git", .exact("4.1.0")),
        .package(url: "https://github.com/Alamofire/Alamofire.git", .exact("5.2.0"))
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "NetworkTools",
            dependencies: ["ObjectMapper", "Alamofire"]),
        .testTarget(
            name: "NetworkToolsTests",
            dependencies: ["NetworkTools"]),
    ]
)
