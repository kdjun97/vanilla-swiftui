//
//  HomeView.swift
//  Home
//
//  Created by 김동준 on 11/28/25
//

import SwiftUI
import DI

public struct HomeView: View  {
    @ObservedObject private var viewModel: HomeViewModel

    public init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }

    public var body: some View {
        VStack(spacing: 0) {
            Text("Home View!")
                .font(.system(size: 54, weight: .bold))
            
            Text("count:\(viewModel.count)")
            
            Button {
                viewModel.send(.countButtonTapped)
            } label: {
                Text("Count 증가")
                    .padding()
                    .background(.purple.opacity(0.3))
            }
            Spacer()
        }.onAppear {
            viewModel.send(.onAppear)
        }
    }
}
