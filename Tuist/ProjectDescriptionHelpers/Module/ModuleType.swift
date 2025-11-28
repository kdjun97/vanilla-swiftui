//
//  ModuleType.swift
//  BaseTemplateManifests
//
//  Created by 김동준 on 9/7/25
//

public enum ModuleType: Hashable {
    case App
    case Domain
    case Presentations(PresentationModuleType)
    case DesignSystem
    case External(ExternalModuleType)
    case DI
}

public enum ExternalModuleType: String {
    case Swinject
}

public enum PresentationModuleType: String {
    case Root
    case Base
    case Splash
    case SignIn
    case Main
    case Home
    case MyPage
}
