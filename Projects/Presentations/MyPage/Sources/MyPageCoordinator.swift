//
//  MyPageCoordinator.swift
//  MyPage
//
//  Created by 김동준 on 11/28/25
//

import Domain

public protocol MyPageCoordinator {
    func navigateToEditProfile()
    func navigateToTermsOfService(model: TempPassModel)
}

public protocol MyPageRootCoordinator {
    func logout()
}
