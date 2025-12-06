//
//  TermsOfService+.swift
//  Main
//
//  Created by 김동준 on 12/6/25
//

import TermsOfService
import MyPage

extension MainCoordinator {
    func handleTermsEvent(_ event: TermsOfServiceViewModel.Action) {
        switch event {
        case .transferData(let data):
            let myPageEvent = MyPageViewModel.Action.dataReceived(data)
            myPageEventPublisher.send(myPageEvent)
        default:
            break
        }
    }
}
