//
//  SplashView.swift
//  Splash
//
//  Created by 김동준 on 11/26/25
//

import SwiftUI
import DI

public struct SplashView: View  {
    @StateObject private var viewModel: SplashViewModel

    public init() {
        let viewModel: SplashViewModel = DIContainer.shared.resolve()
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    public var body: some View {
        ZStack {
            Text("바닐라 스유!")
                .font(.system(size: 54, weight: .bold))
        }.onAppear {
            viewModel.send(.onAppear)
        }
    }
}
