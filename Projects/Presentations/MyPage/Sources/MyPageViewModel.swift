//
//  MyPageViewModel.swift
//  MyPage
//
//  Created by 김동준 on 11/28/25
//

import Foundation

final public class MyPageViewModel: ObservableObject {
    private let coordinator: MyPageCoordinator
    private let rootCoordinator: MyPageRootCoordinator
        
    public init(
        coordinator: MyPageCoordinator,
        rootCoordinator: MyPageRootCoordinator
    ) {
        self.coordinator = coordinator
        self.rootCoordinator = rootCoordinator
    }
    
    enum Action {
        case onAppear
        case logoutButtonTapped
    }
    
    func send(_ action: Action) {
        switch action {
        case .onAppear:
            break
        case .logoutButtonTapped:
            rootCoordinator.logout()
        }
    }
}
