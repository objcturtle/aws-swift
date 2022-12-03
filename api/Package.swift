// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "api",
    platforms: [
        .macOS(.v12),
    ],
    products: [
      .executable(name: "api", targets: ["api"]),
    ],
    dependencies: [
        .package(url: "https://github.com/swift-server/swift-aws-lambda-runtime.git", .upToNextMajor(from:"0.5.0")),
    ],
    targets: [
        .executableTarget(
            name: "api",
            dependencies: [
                .product(name: "AWSLambdaRuntime", package: "swift-aws-lambda-runtime"),
                .product(name: "AWSLambdaEvents", package: "swift-aws-lambda-runtime"),
            ]),
        .testTarget(
            name: "apiTests",
            dependencies: ["api"]),
    ]
)
