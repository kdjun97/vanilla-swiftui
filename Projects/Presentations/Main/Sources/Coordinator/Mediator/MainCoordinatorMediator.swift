//
//  MainCoordinatorMediator.swift
//  Main
//
//  Created by 김동준 on 12/6/25
//

extension MainCoordinator {
    func bindingEventMediation() {
        termsOfServiceEventPublisher
            .sink { [weak self] termsEvent in
                guard let self = self else { return }
                self.handleTermsEvent(termsEvent)
            }
            .store(in: &cancellables)
    }
}
