//
//  SignInViewModel.swift
//  SignIn
//
//  Created by 김동준 on 11/27/25
//

import Foundation

public class SignInViewModel: ObservableObject {
    private let coordinator: SignInCoordinator
        
    public init(coordinator: SignInCoordinator) {
        self.coordinator = coordinator
    }
    
    enum Action {
        case onAppear
        case kakaoButtonTapped
        case appleButtonTapped
    }
    
    func send(_ action: Action) {
        switch action {
        case .onAppear:
            break
        case .kakaoButtonTapped:
            coordinator.navigateToMain()
        case .appleButtonTapped:
            break
        }
    }
}
