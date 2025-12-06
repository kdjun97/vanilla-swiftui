//
//  MyPageViewModel.swift
//  MyPage
//
//  Created by 김동준 on 11/28/25
//

import Combine
import Domain

final public class MyPageViewModel: ObservableObject {
    private let coordinator: MyPageCoordinator
    private let rootCoordinator: MyPageRootCoordinator
    private var cancellables = Set<AnyCancellable>()

    public init(
        coordinator: MyPageCoordinator,
        rootCoordinator: MyPageRootCoordinator
    ) {
        self.coordinator = coordinator
        self.rootCoordinator = rootCoordinator
        bindingEvent()
    }
    
    private func bindingEvent() {
        coordinator.myPageEventPublisher
            .sink { [weak self] event in
                guard let self = self else { return }
                self.handleEvent(event)
            }
            .store(in: &cancellables)
    }
    
    public enum MenuType: String, CaseIterable {
        case termsOfService = "이용약관"
        case privacyPolicy = "개인정보 처리방침"
        case openSourceLibrary = "오픈소스 라이브러리"
        case editProfile = "프로필 수정"
        case logout = "로그아웃"
    }

    enum AlertCase: Identifiable {
        case success
        case failure(String)
        
        var id: String {
            switch self {
            case .success: "success"
            case .failure: "failure"
            }
        }
    }
    
    @Published var alertCase: AlertCase?
    var menuList: [MenuType] = MenuType.allCases
}

extension MyPageViewModel {
    public enum Action {
        case onAppear
        case logoutButtonTapped
        case menuButtonTapped(MenuType)
        case dataReceived(String)
    }
    
    func send(_ action: Action) {
        switch action {
        case .onAppear:
            break
        case .logoutButtonTapped:
            rootCoordinator.logout()
        case .menuButtonTapped(let item):
            switch item {
            case .termsOfService:
                coordinator.navigateToTermsOfService(
                    model: TempPassModel(value: "1111123123")
                )
            case .logout:
                send(.logoutButtonTapped)
            case .editProfile:
                coordinator.navigateToEditProfile()
            default:
                break
            }
        case .dataReceived:
            break
        }
    }
}

private extension MyPageViewModel {
    func handleEvent(_ event: MyPageViewModel.Action) {
        switch event {
        case .dataReceived(let info):
            alertCase = .failure(info)
        default:
            break
        }
    }
}
