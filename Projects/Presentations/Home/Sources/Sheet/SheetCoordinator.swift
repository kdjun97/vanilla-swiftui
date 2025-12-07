//
//  SheetCoordinator.swift
//  Home
//
//  Created by 김동준 on 12/7/25
//

import Combine

public protocol SheetCoordinator {
    var sheetEventPublisher: PassthroughSubject<SheetViewModel.Action, Never> { get }
}
