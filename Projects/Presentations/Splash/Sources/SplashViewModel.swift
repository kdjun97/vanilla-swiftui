//
//  SplashViewModel.swift
//  Splash
//
//  Created by 김동준 on 11/26/25
//

import Foundation

final public class SplashViewModel: ObservableObject {
    private let coordinator: SplashCoordinator
        
    public init(coordinator: SplashCoordinator) {
        self.coordinator = coordinator
    }
    
    enum Action {
        case onAppear
    }
    
    func send(_ action: Action) {
        switch action {
        case .onAppear:
            Task { @MainActor in
                try? await Task.sleep(for: .seconds(1.5))
                coordinator.navigateToSignIn()
            }
        }
    }
}
