//
//  EditProfileViewModel.swift
//  EditProfile
//
//  Created by 김동준 on 11/28/25
//

import Foundation

final public class EditProfileViewModel: ObservableObject {
    private let coordinator: EditProfileCoordinator
        
    public init(coordinator: EditProfileCoordinator) {
        self.coordinator = coordinator
    }
    
    enum Action {
        case onAppear
        case backButtonTapped
    }
    
    func send(_ action: Action) {
        switch action {
        case .onAppear:
            break
        case .backButtonTapped:
            coordinator.navigateToBack()
            break
        }
    }
}
