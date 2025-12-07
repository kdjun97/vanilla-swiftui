//
//  MyPageCoordinator.swift
//  MyPage
//
//  Created by 김동준 on 11/28/25
//

import Domain
import Combine

public protocol MyPageCoordinator {
    func navigateToEditProfile()
    func navigateToTermsOfService(model: TempPassModel)
    
    var myPageEventPublisher: PassthroughSubject<MyPageViewModel.Action, Never> { get }
}

public protocol MyPageRootCoordinator {
    func logout()
}
