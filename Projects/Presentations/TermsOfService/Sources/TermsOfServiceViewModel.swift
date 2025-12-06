//
//  TermsOfServiceViewModel.swift
//  TermsOfService
//
//  Created by 김동준 on 12/5/25
//

import Domain
import Combine

final public class TermsOfServiceViewModel: ObservableObject {
    private let coordinator: TermsOfServiceCoordinator
    let passModel: TempPassModel
        
    public init(
        coordinator: TermsOfServiceCoordinator,
        passModel: TempPassModel
    ) {
        self.coordinator = coordinator
        self.passModel = passModel
    }
    
    public enum Action {
        case onAppear
        case backButtonTapped
        case dataTransferButtonTapped
        case transferData(String)
    }
    
    func send(_ action: Action) {
        switch action {
        case .onAppear:
            break
        case .backButtonTapped:
            coordinator.navigateToBack()
        case .dataTransferButtonTapped:
            coordinator.termsOfServiceEventPublisher.send(.transferData("약관에 동의하셨습니다."))
            coordinator.navigateToBack()
        case .transferData:
            break
        }
    }
}
