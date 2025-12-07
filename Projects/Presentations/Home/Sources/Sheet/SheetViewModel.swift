//
//  SheetViewModel.swift
//  Home
//
//  Created by 김동준 on 12/7/25
//

import Foundation

final public class SheetViewModel: ObservableObject {
    private let coordinator: SheetCoordinator
        
    public init(coordinator: SheetCoordinator) {
        self.coordinator = coordinator
    }
        
    public enum Action {
        case onAppear
        case buttonTapped
        case resetCount
    }
    
    func send(_ action: Action) {
        switch action {
        case .onAppear:
            break
        case .buttonTapped:
            send(.resetCount)
        case .resetCount:
            coordinator.sheetEventPublisher.send(.resetCount)
        }
    }
}
