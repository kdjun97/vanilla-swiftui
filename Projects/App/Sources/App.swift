//
//  App.swift
//  VanillaSwiftUI
//
//  Created by 김동준 on 9/7/25
//

import SwiftUI
import Root

@main
struct VanillaSwiftUIApp: App {
    @UIApplicationDelegateAdaptor var delegate: AppDelegate

    init() {}
    
    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}
