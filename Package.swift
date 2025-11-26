// swift-tools-version: 6.0
import PackageDescription

#if TUIST
    import struct ProjectDescription.PackageSettings
    import ProjectDescriptionHelpers

    let packageSettings = PackageSettings(
        productTypes: [:]
    )
#endif

let package = Package(
    name: "VanillaSwiftUI",
    dependencies: [
        .package(url: "https://github.com/Swinject/Swinject.git", from: "2.9.1")
    ]
)
