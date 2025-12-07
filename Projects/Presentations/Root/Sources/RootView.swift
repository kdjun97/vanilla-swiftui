//
//  RootView.swift
//  Root
//
//  Created by 김동준 on 11/26/25
//

import SwiftUI
import Splash
import SignIn
import Main

public struct RootView: View  {
    @EnvironmentObject private var rootNavigation: RootNavigation

    public init() {}

    public var body: some View {
        switch rootNavigation.rootPath {
        case .splash:
            SplashView()
        case .signIn:
            SignInView()
        case .main:
            MainView()
        }
    }
}
