//
//  RootView.swift
//  Root
//
//  Created by 김동준 on 11/26/25
//

import SwiftUI
import Base
import DI
import Splash
import SignIn
import Main

public struct RootView: View  {
    @StateObject private var navigation: BaseNavigation
    
    public init() {
        let navigation: BaseNavigation = DIContainer.shared.resolve()
        _navigation = StateObject(wrappedValue: navigation)
    }

    public var body: some View {
        switch navigation.rootPath {
        case .splash:
            SplashView()
        case .signIn:
            SignInView()
        case .main:
            MainView()
        }
    }
}
