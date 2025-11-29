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
        case editProfileButtonTapped
    }
    
    enum AlertCase: Identifiable {
        case success
        case failure(String)
        
        var id: String {
            switch self {
            case .success: "success"
            case .failure: "failure"
            }
        }
    }
    
    @Published var isLoading: Bool = false
    @Published var alertCase: AlertCase?
    
    func send(_ action: Action) {
        switch action {
        case .onAppear:
            break
        case .backButtonTapped:
            coordinator.navigateToBack()
        case .editProfileButtonTapped:
            isLoading = true
            Task { @MainActor in
                await updateProfile()
                isLoading = false
                alertCase = .success
            }
        }
    }
}

private extension EditProfileViewModel {
    func updateProfile() async {
        // TODO: Usecase 작업
        try? await Task.sleep(for: .seconds(1))
    }
}
