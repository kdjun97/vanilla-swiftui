//
//  HomeView.swift
//  Home
//
//  Created by 김동준 on 11/28/25
//

import SwiftUI
import DI

public struct HomeView: View  {
    @StateObject private var viewModel: HomeViewModel

    public init() {
        let viewModel: HomeViewModel = DIContainer.shared.resolve()
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    public var body: some View {
        ZStack {
            Text("Home View!")
                .font(.system(size: 54, weight: .bold))
        }.onAppear {
            viewModel.send(.onAppear)
        }
    }
}
