//
//  DependencyInfo.swift
//  BaseTemplateManifests
//
//  Created by 김동준 on 9/7/25
//

public struct DependencyInfo: @unchecked Sendable {
    let moduleDependencies: [ModuleType: [ModuleType]]
}

public let dependencyInfo: DependencyInfo = DependencyInfo(
    moduleDependencies: [
        .App: [.Presentations(.Root), .DI],
        .Domain: [.DI],
        .Presentations(.Base): [.Domain, .DesignSystem],
        .Presentations(.Root): [
            .Presentations(.Splash),
            .Presentations(.SignIn),
            .Presentations(.Main)
        ],
        .Presentations(.Splash): [.Presentations(.Base)],
        .Presentations(.SignIn): [.Presentations(.Base)],
        .Presentations(.Main): [.Presentations(.Base)],
        .DI: [.External(.Swinject)],
    ]
)
