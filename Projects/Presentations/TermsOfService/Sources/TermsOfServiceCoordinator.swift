//
//  TermsOfServiceCoordinator.swift
//  TermsOfService
//
//  Created by 김동준 on 12/5/25
//

import Base
import Combine

public protocol TermsOfServiceCoordinator: BaseMainCoordinator {
    var termsOfServiceEventPublisher: PassthroughSubject<TermsOfServiceViewModel.Action, Never> { get }
}
