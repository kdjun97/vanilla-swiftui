//
//  HomeViewModel.swift
//  Home
//
//  Created by 김동준 on 11/28/25
//

import Combine

final public class HomeViewModel: ObservableObject {
    private let coordinator: HomeCoordinator
    private var cancellables = Set<AnyCancellable>()

    public init(coordinator: HomeCoordinator) {
        self.coordinator = coordinator
        bindingEvent()
    }
    
    private func bindingEvent() {
        coordinator.homeEventPublisher
            .sink { [weak self] event in
                guard let self = self else { return }
                self.handleEvent(event)
            }
            .store(in: &cancellables)
    }
    
    @Published var count = 0
    @Published var isSheetPresented: Bool = false
    
    public enum Action {
        case onAppear
        case countButtonTapped
        case sheetButtonTapped
        case setCount(Int)
        case dismissSheet
    }
    
    func send(_ action: Action) {
        switch action {
        case .onAppear:
            break
        case .countButtonTapped:
            count+=1
        case .sheetButtonTapped:
            isSheetPresented = true
        case .setCount, .dismissSheet: break
        }
    }
}

private extension HomeViewModel {
    func handleEvent(_ event: HomeViewModel.Action) {
        switch event {
        case .setCount(let value):
            count = value
        case .dismissSheet:
            isSheetPresented = false
        default:
            break
        }
    }
}
