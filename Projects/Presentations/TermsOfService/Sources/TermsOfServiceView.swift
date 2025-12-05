//
//  TermsOfServiceView.swift
//  TermsOfService
//
//  Created by 김동준 on 12/5/25
//

import SwiftUI
import DI
import DesignSystem
import Domain

public struct TermsOfServiceView: View  {
    @StateObject private var viewModel: TermsOfServiceViewModel

    public init(tempModel: TempPassModel) {
        let coordinator: TermsOfServiceCoordinator = DIContainer.shared.resolve()
        _viewModel = StateObject(
            wrappedValue: TermsOfServiceViewModel(
                coordinator: coordinator,
                passModel: tempModel
            )
        )
    }

    public var body: some View {
        VStack(spacing: 0) {
            navigationBar
            Text("내 정보")
                .vPadding(12)
            Text("model: \(viewModel.passModel.value)")
            Spacer()
        }
        .navigationBarBackButtonHidden()
    }

    private var navigationBar: some View {
        Button {
            viewModel.send(.backButtonTapped)
        } label: {
            HStack(spacing: 0) {
                VImages.icArrowLeft.swiftUIImage
                    .padding(.leading, 12)
                Spacer()
            }.vPadding(12)
        }
    }
}
