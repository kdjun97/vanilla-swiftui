//
//  MyPage+.swift
//  Main
//
//  Created by 김동준 on 12/6/25
//

import TermsOfService
import MyPage

extension MainCoordinator {
    func handleMyPageEvent(_ event: MyPageViewModel.Action) {
        switch event {
        case .timerTick:
            if let last = navigation.mainPath.last {
                if case .termsOfService = last {
                    let TermsOfServiceEvent = TermsOfServiceViewModel.Action.timerUpdated
                    termsOfServiceEventPublisher.send(TermsOfServiceEvent)
                }
            } else {
                myPageEventPublisher.send(.stopTimer)
            }
        default:
            break
        }
    }
}
