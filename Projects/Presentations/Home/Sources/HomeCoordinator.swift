//
//  HomeCoordinator.swift
//  Home
//
//  Created by 김동준 on 11/28/25
//

import Combine

public protocol HomeCoordinator {
    var homeEventPublisher: PassthroughSubject<HomeViewModel.Action, Never> { get }
}
