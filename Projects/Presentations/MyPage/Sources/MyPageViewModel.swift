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
    
    public enum MenuType: String, CaseIterable {
        case termsOfService = "이용약관"
        case privacyPolicy = "개인정보 처리방침"
        case openSourceLibrary = "오픈소스 라이브러리"
        case editProfile = "프로필 수정"
        case logout = "로그아웃"
    }
    
    var menuList: [MenuType] = MenuType.allCases
    
    enum Action {
        case onAppear
        case logoutButtonTapped
        case menuButtonTapped(MenuType)
    }
    
    func send(_ action: Action) {
        switch action {
        case .onAppear:
            break
        case .logoutButtonTapped:
            rootCoordinator.logout()
            break
        case .menuButtonTapped(let item):
            switch item {
            case .logout:
                send(.logoutButtonTapped)
                break
            case .editProfile:
                coordinator.navigateToEditProfile()
            default:
                break
            }
        }
    }
}
