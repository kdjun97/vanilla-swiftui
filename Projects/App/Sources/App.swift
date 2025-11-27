//
//  App.swift
//  VanillaSwiftUI
//
//  Created by 김동준 on 9/7/25
//

import SwiftUI
import Root
import DI

@main
struct VanillaSwiftUIApp: App {
    @UIApplicationDelegateAdaptor var delegate: AppDelegate
    @StateObject private var navigation: RootNavigation = DIContainer.shared.resolve()

    init() {}
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(navigation)
        }
    }
}
