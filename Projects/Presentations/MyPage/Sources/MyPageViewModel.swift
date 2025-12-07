//
//  MyPageViewModel.swift
//  MyPage
//
//  Created by 김동준 on 11/28/25
//

import Combine
import Domain
import Foundation

final public class MyPageViewModel: ObservableObject {
    private let coordinator: MyPageCoordinator
    private let rootCoordinator: MyPageRootCoordinator
    private var cancellables = Set<AnyCancellable>()
    private var timerCancellable: AnyCancellable?
    private var isTimerRunning: Bool = false

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
        case startTimerForTaskB
        case timerTick
        case stopTimer
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
            }
        case .dataReceived:
            break
        case .startTimerForTaskB:
            break
        case .timerTick:
            break
        case .stopTimer:
            break
        }
    }
}

private extension MyPageViewModel {
    func handleEvent(_ event: MyPageViewModel.Action) {
        switch event {
        case .dataReceived(let info):
            alertCase = .failure(info)
        case .startTimerForTaskB:
            if isTimerRunning { return }
            isTimerRunning = true
            
            timerCancellable = Timer.publish(every: 1.0, on: .main, in: .common)
                .autoconnect()
                .sink { [weak self] _ in
                    guard let self = self else { return }
                    self.coordinator.myPageEventPublisher.send(.timerTick)
                }
        case .stopTimer:
            isTimerRunning = false
            timerCancellable?.cancel()
        default:
            break
        }
    }
}
