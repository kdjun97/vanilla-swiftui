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
                .padding(.bottom, 48)
            editProfileButton
            Spacer()
        }
        .navigationBarBackButtonHidden()
        .vLoading(isPresent: viewModel.isLoading)
        .alert(item: $viewModel.alertCase) { alert in
            alertView(alert)
        }
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
    
    private var editProfileButton: some View {
        Button {
            viewModel.send(.editProfileButtonTapped)
        } label: {
            Text("프로필 수정 API 호출 버튼")
                .padding()
                .background(.orange.opacity(0.4))
        }
    }
}

private extension EditProfileView {
    func alertView(_ alertCase: EditProfileViewModel.AlertCase) -> Alert {
        var title: String {
            switch alertCase {
            case .success: "성공"
            case .failure: "오류"
            }
        }
        
        var message: String {
            switch alertCase {
            case .success: "프로필 업데이트 성공!"
            case .failure(let message): message
            }
        }
        
        return Alert(
            title: Text(title),
            message: Text(message),
            dismissButton: .default(Text("확인"))
        )
    }
}
