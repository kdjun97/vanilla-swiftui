//
//  Sheet+.swift
//  Main
//
//  Created by 김동준 on 12/7/25
//

import Home

extension MainCoordinator {
    func handleSheetEvent(_ event: SheetViewModel.Action) {
        switch event {
        case .resetCount:
            let setCountAction = HomeViewModel.Action.setCount(10000)
            let dismissSheetAction = HomeViewModel.Action.dismissSheet
            homeEventPublisher.send(dismissSheetAction)
            homeEventPublisher.send(setCountAction)
        default:
            break
        }
    }
}
