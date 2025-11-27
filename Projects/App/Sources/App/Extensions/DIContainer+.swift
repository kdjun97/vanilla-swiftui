//
//  DIContainer+.swift
//  VanillaSwiftUI
//
//  Created by 김동준 on 11/26/25
//

import DI
import Splash
import Root

extension DIContainer {
    func register() {
        registerCoordinator()
        registerViewModel()
    }
}

private extension DIContainer {
    func registerCoordinator() {
        registerRootNavigation()
        registerAppCoordinator()
        registerSplashCoordinator()
    }
    
    func registerRootNavigation() {
        container.register(RootNavigation.self) { _ in
            RootNavigation()
        }.inObjectScope(.container)
    }
    
    func registerAppCoordinator() {
        container.register(AppCoordinator.self) { resolver in
            AppCoordinator(navigation: resolver.resolve())
        }.inObjectScope(.container)
    }
    
    func registerSplashCoordinator() {
        container.register(SplashCoordinator.self) { resolver in
            guard let coordinator = resolver.resolve(AppCoordinator.self) else {
                fatalError("DI Error: SplashCoordinator not registered")
            }
            return coordinator
        }
    }
}

private extension DIContainer {
    func registerViewModel() {
        registerSplashViewModel()
    }
    
    func registerSplashViewModel() {
        container.register(SplashViewModel.self) { resolver in
            SplashViewModel(coordinator: resolver.resolve())
        }
    }
}
