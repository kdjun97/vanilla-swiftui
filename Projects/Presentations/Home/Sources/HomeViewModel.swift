//
//  HomeViewModel.swift
//  Home
//
//  Created by 김동준 on 11/28/25
//

import Foundation

final public class HomeViewModel: ObservableObject {
    private let coordinator: HomeCoordinator
        
    public init(coordinator: HomeCoordinator) {
        self.coordinator = coordinator
    }
    
    enum Action {
        case onAppear
    }
    
    func send(_ action: Action) {
        switch action {
        case .onAppear:
            break
        }
    }
}
