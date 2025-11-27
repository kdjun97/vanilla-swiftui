//
//  DIContainer+.swift
//  VanillaSwiftUI
//
//  Created by 김동준 on 11/26/25
//

import DI
import Splash
import Root
import SignIn

extension DIContainer {
    func register() {
        registerCoordinator()
        registerViewModel()
    }
}

private extension DIContainer {
    func registerCoordinator() {
        registerRootNavigation()
        registerRootCoordinator()
        registerTargetToDependency(SplashCoordinator.self, to: RootCoordinator.self)
        registerTargetToDependency(SignInCoordinator.self, to: RootCoordinator.self)
    }
    
    func registerRootNavigation() {
        container.register(RootNavigation.self) { _ in
            RootNavigation()
        }.inObjectScope(.container)
    }
    
    func registerRootCoordinator() {
        container.register(RootCoordinator.self) { resolver in
            RootCoordinator(navigation: resolver.resolve())
        }
    }
}

private extension DIContainer {
    func registerViewModel() {
        registerSplashViewModel()
        registerSignInViewModel()
    }
    
    func registerSplashViewModel() {
        container.register(SplashViewModel.self) { resolver in
            SplashViewModel(coordinator: resolver.resolve())
        }
    }
    
    func registerSignInViewModel() {
        container.register(SignInViewModel.self) { resolver in
            SignInViewModel(coordinator: resolver.resolve())
        }
    }
}

private extension DIContainer {
    func registerTargetToDependency<Target, Dependency>(
        _ target: Target.Type,
        to dependency: Dependency.Type
    ) {
        container.register(target) { resolver in
            guard let resolved = resolver.resolve(dependency) as? Target else {
                fatalError("DI Error: \(target) resolution failed")
            }
            return resolved
        }
    }
}
