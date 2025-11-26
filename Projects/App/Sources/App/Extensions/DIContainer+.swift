//
//  DIContainer+.swift
//  VanillaSwiftUI
//
//  Created by 김동준 on 11/26/25
//

import DI
import Base

extension DIContainer {
    func register() {
        registerBaseNavigation()
    }
}

private extension DIContainer {
    func registerBaseNavigation() {
        container.register(BaseNavigation.self) { _ in
            BaseNavigation()
        }.inObjectScope(.container)
    }
}
