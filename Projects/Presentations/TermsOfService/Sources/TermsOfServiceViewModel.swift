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
    private var cancellables = Set<AnyCancellable>()
    @Published var count: Int = 0
    private var isTimerRunning: Bool = false
        
    public init(
        coordinator: TermsOfServiceCoordinator,
        passModel: TempPassModel
    ) {
        self.coordinator = coordinator
        self.passModel = passModel
        bindingEvent()
    }
    
    private func bindingEvent() {
        coordinator.termsOfServiceEventPublisher
            .sink { [weak self] event in
                guard let self = self else { return }
                self.handleEvent(event)
            }
            .store(in: &cancellables)
    }
    
    public enum Action {
        case onAppear
        case backButtonTapped
        case dataTransferButtonTapped
        case transferData(String)
        case timerStartButtonTapped
        case startTimer
        case timerUpdated
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
        case .timerStartButtonTapped:
            if isTimerRunning { return }
            isTimerRunning = true
            send(.startTimer)
        case .startTimer:
            coordinator.termsOfServiceEventPublisher.send(.startTimer)
            break
        case .timerUpdated:
            break
        }
    }
}

private extension TermsOfServiceViewModel {
    func handleEvent(_ event: TermsOfServiceViewModel.Action) {
        switch event {
        case .timerUpdated:
            count += 1
        default:
            break
        }
    }
}
