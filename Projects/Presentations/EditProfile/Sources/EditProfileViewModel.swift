//
//  EditProfileViewModel.swift
//  EditProfile
//
//  Created by 김동준 on 11/28/25
//

import Foundation
import Domain

final public class EditProfileViewModel: ObservableObject {
    private let coordinator: EditProfileCoordinator
    private let accountUseCase: AccountUseCase
        
    public init(
        coordinator: EditProfileCoordinator,
        accountUseCase: AccountUseCase
    ) {
        self.coordinator = coordinator
        self.accountUseCase = accountUseCase
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
                defer { isLoading = false }
                do {
                    try await updateProfile()
                    alertCase = .success
                } catch {
                    alertCase = .failure("요청에 실패하였습니다.")
                }
            }
        }
    }
}

private extension EditProfileViewModel {
    func updateProfile() async throws {
        do {
            try await accountUseCase.updateUserProfile()
        } catch {
            throw error
        }
    }
}
