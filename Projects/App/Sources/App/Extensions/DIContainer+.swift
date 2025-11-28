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
import Main
import Home
import MyPage

extension DIContainer {
    func register() {
        registerCoordinator()
        registerViewModel()
    }
}

private extension DIContainer {
    func registerCoordinator() {
        registerNavigation()
        registerNavigationCoordinator()
        registerTargetToDependency(SplashCoordinator.self, to: RootCoordinator.self)
        registerTargetToDependency(SignInCoordinator.self, to: RootCoordinator.self)
        registerTargetToDependency(HomeCoordinator.self, to: MainCoordinator.self)
        registerTargetToDependency(MyPageCoordinator.self, to: MainCoordinator.self)
        registerTargetToDependency(MyPageRootCoordinator.self, to: RootCoordinator.self)
    }
    
    func registerNavigation() {
        container.register(RootNavigation.self) { _ in
            RootNavigation()
        }.inObjectScope(.container)
        
        container.register(MainNavigation.self) { _ in
            MainNavigation()
        }.inObjectScope(.container)
    }
    
    func registerNavigationCoordinator() {
        container.register(RootCoordinator.self) { resolver in
            RootCoordinator(navigation: resolver.resolve())
        }
        
        container.register(MainCoordinator.self) { resolver in
            MainCoordinator(navigation: resolver.resolve())
        }
    }
}

private extension DIContainer {
    func registerViewModel() {
        registerSplashViewModel()
        registerSignInViewModel()
        registerMainViewModel()
        registerHomeViewModel()
        registerMyPageViewModel()
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
    
    func registerMainViewModel() {
        container.register(MainViewModel.self) { resolver in
            MainViewModel(coordinator: resolver.resolve())
        }
    }
    
    func registerHomeViewModel() {
        container.register(HomeViewModel.self) { resolver in
            HomeViewModel(coordinator: resolver.resolve())
        }
    }
    
    func registerMyPageViewModel() {
        container.register(MyPageViewModel.self) { resolver in
            MyPageViewModel(
                coordinator: resolver.resolve(),
                rootCoordinator: resolver.resolve()
            )
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
