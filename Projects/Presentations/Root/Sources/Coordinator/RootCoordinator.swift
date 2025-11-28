//
//  RootCoordinator.swift
//  Root
//
//  Created by 김동준 on 11/27/25
//

import Splash
import SignIn
import MyPage

final public class RootCoordinator {
    private var navigation: RootNavigation
    
    public init(navigation: RootNavigation) {
        self.navigation = navigation
    }
}

extension RootCoordinator: SplashCoordinator {
    public func navigateToSignIn() {
        navigation.rootPath = .signIn
    }
}

extension RootCoordinator: SignInCoordinator {
    public func navigateToMain() {
        navigation.rootPath = .main
    }
}

extension RootCoordinator: MyPageRootCoordinator {
    public func logout() {
        navigation.rootPath = .signIn
    }
}
