// swift-tools-version:5.3

import PackageDescription

let package = Package(
  name: "StringSize",
  platforms: [
    .iOS(.v10)
  ],
  products: [
    .library(name: "StringSize", targets: ["StringSize"]),
  ],
  dependencies: [
  ],
  targets: [
    .target(
      name: "StringSize",
      dependencies: [
      ]
    )
  ],
  swiftLanguageVersions: [.v5]
)
