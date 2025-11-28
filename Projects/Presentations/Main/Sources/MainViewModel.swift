//
//  MainViewModel.swift
//  Main
//
//  Created by 김동준 on 11/27/25
//

import Foundation

final public class MainViewModel: ObservableObject {
    private let coordinator: MainCoordinator
        
    public init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
    
    @Published var selectedTab: TabCase = .home
    
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
