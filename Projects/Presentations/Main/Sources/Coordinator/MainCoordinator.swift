//
//  MainCoordinator.swift
//  Main
//
//  Created by 김동준 on 11/27/25
//

import Home
import MyPage
import EditProfile
import TermsOfService
import Domain
import Base

final public class MainCoordinator {
    private var navigation: MainNavigation
    
    public init(navigation: MainNavigation) {
        self.navigation = navigation
    }
}

extension MainCoordinator: HomeCoordinator {
    
}

extension MainCoordinator: MyPageCoordinator {
    public func navigateToEditProfile() {
        navigation.mainPath.append(.editProfile)
    }
    
    public func navigateToTermsOfService(model: TempPassModel) {
        navigation.mainPath.append(.termsOfService(model))
    }
}

extension MainCoordinator: BaseMainCoordinator {
    public func navigateToBack() {
        navigation.mainPath.removeLast()
    }
}

extension MainCoordinator: EditProfileCoordinator {
}

extension MainCoordinator: TermsOfServiceCoordinator{
}
