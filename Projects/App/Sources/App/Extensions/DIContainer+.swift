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
        registerSplashCoordinator()
        registerSignInCoordinator()
    }
    
    func registerRootNavigation() {
        container.register(RootNavigation.self) { _ in
            RootNavigation()
        }.inObjectScope(.container)
    }
    
    func registerRootCoordinator() {
        container.register(RootCoordinator.self) { resolver in
            RootCoordinator(navigation: resolver.resolve())
        }.inObjectScope(.container)
    }
    
    func registerSplashCoordinator() {
        container.register(SplashCoordinator.self) { resolver in
            guard let coordinator = resolver.resolve(RootCoordinator.self) else {
                fatalError("DI Error: SplashCoordinator not registered")
            }
            return coordinator
        }
    }
    
    func registerSignInCoordinator() {
        container.register(SignInCoordinator.self) { resolver in
            guard let coordinator = resolver.resolve(RootCoordinator.self) else {
                fatalError("DI Error: SignInCoordinator not registered")
            }
            return coordinator
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
