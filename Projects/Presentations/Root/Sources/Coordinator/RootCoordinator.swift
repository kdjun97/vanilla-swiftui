//
//  RootCoordinator.swift
//  Root
//
//  Created by 김동준 on 11/27/25
//

import Splash

final public class RootCoordinator: SplashCoordinator {
    private var navigation: RootNavigation
    
    public init(navigation: RootNavigation) {
        self.navigation = navigation
    }
    
    public func navigateToSignIn() {
        navigation.rootPath = .signIn
    }
}
