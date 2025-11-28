//
//  App.swift
//  VanillaSwiftUI
//
//  Created by 김동준 on 9/7/25
//

import SwiftUI
import Root
import DI
import Main

@main
struct VanillaSwiftUIApp: App {
    @UIApplicationDelegateAdaptor var delegate: AppDelegate
    @StateObject private var rootNavigation: RootNavigation = DIContainer.shared.resolve()
    @StateObject private var mainNavigation: MainNavigation = DIContainer.shared.resolve()

    init() {}
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(rootNavigation)
                .environmentObject(mainNavigation)
        }
    }
}
