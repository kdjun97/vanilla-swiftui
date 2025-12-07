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
import EditProfile
import TermsOfService
import Data
import Domain

extension DIContainer {
    func register() {
        registerNetworkDependency()
        registerCoordinator()
        registerViewModel()
    }
}

private extension DIContainer {
    func registerNetworkDependency() {
        registerApiServiceDependency()
        registerAccountDependency()
    }
    
    func registerApiServiceDependency() {
        container.register(ApiService.self) { resolver in
            return ApiService()
        }
    }
    
    func registerAccountDependency() {
        container.register(AccountRepositoryProtocol.self) { resolver in
            let apiService: ApiService = resolver.resolve()
            return AccountRepository(apiService: apiService)
        }
        
        container.register(AccountUseCase.self) { resolver in
            return AccountUseCase(repositoryProtocol: resolver.resolve())
        }
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
        registerTargetToDependency(EditProfileCoordinator.self, to: MainCoordinator.self)
        registerTargetToDependency(TermsOfServiceCoordinator.self, to: MainCoordinator.self)
        registerTargetToDependency(SheetCoordinator.self, to: MainCoordinator.self)
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
        }.inObjectScope(.container)
    }
}

private extension DIContainer {
    func registerViewModel() {
        registerSplashViewModel()
        registerSignInViewModel()
        registerMainViewModel()
        registerEditProfileViewModel()
        registerSheetViewModel()
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
        container.register(HomeViewModel.self) { resolver in
            HomeViewModel(coordinator: resolver.resolve())
        }
        container.register(MyPageViewModel.self) { resolver in
            MyPageViewModel(
                coordinator: resolver.resolve(),
                rootCoordinator: resolver.resolve()
            )
        }
    }
    
    func registerEditProfileViewModel() {
        container.register(EditProfileViewModel.self) { resolver in
            EditProfileViewModel(
                coordinator: resolver.resolve(),
                accountUseCase: resolver.resolve()
            )
        }
    }
    
    func registerSheetViewModel() {
        container.register(SheetViewModel.self) { resolver in
            SheetViewModel(
                coordinator: resolver.resolve()
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
