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
    
    @Published var count = 0
    
    enum Action {
        case onAppear
        case countButtonTapped
    }
    
    func send(_ action: Action) {
        switch action {
        case .onAppear:
            break
        case .countButtonTapped:
            count+=1
        }
    }
}
