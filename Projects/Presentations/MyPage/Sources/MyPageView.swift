//
//  MyPageView.swift
//  MyPage
//
//  Created by 김동준 on 11/28/25
//

import SwiftUI
import DI

public struct MyPageView: View  {
    @StateObject private var viewModel: MyPageViewModel

    public init() {
        let viewModel: MyPageViewModel = DIContainer.shared.resolve()
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    public var body: some View {
        VStack {
            Text("MyPage View!")
                .font(.system(size: 54, weight: .bold))
            
            Button {
                viewModel.send(.logoutButtonTapped)
            } label: {
                Text("로그아웃")
                    .frame(width: 96, height: 48)
                    .padding()
                    .background(.green.opacity(0.4))
            }
        }.onAppear {
            viewModel.send(.onAppear)
        }
    }
}
