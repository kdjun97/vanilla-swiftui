//
//  TermsOfServiceViewModel.swift
//  TermsOfService
//
//  Created by 김동준 on 12/5/25
//

import Foundation
import Domain

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
        }
    }
}
