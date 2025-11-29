//
//  EditProfileView.swift
//  EditProfile
//
//  Created by 김동준 on 11/28/25
//

import SwiftUI
import DI
import DesignSystem

public struct EditProfileView: View {
    @StateObject private var viewModel: EditProfileViewModel

    public init() {
        let viewModel: EditProfileViewModel = DIContainer.shared.resolve()
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            navigationBar
            Text("Edit Profile View")
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
