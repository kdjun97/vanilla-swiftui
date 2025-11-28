//
//  MyPageView.swift
//  MyPage
//
//  Created by 김동준 on 11/28/25
//

import SwiftUI
import DI
import DesignSystem

public struct MyPageView: View  {
    @StateObject private var viewModel: MyPageViewModel
    private let avatarSize: CGFloat = 60

    public init() {
        let viewModel: MyPageViewModel = DIContainer.shared.resolve()
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    public var body: some View {
        VStack(spacing: 0) {
            Text("내 정보")
                .vPadding(12)
            
            ColorDivider(height: 1, color: .gray.opacity(0.2))
            profileBodyView
            
//            Button {
//                viewModel.send(.logoutButtonTapped)
//            } label: {
//                Text("로그아웃")
//                    .frame(width: 96, height: 48)
//                    .padding()
//                    .background(.green.opacity(0.4))
//            }
        }
        .onAppear {
            viewModel.send(.onAppear)
        }
    }
}

private extension MyPageView {
    var profileBodyView: some View {
        ScrollView {
            VStack(spacing: 0) {
                Spacer().height(avatarSize/2)
                
                myProfileView
                    .padding(.top, 20)
                
                ColorDivider(height: 1, color: .gray.opacity(0.2))
                    .hPadding(20)
                    .padding(.top, 20)
                
                ForEach(0..<viewModel.menuList.count, id: \.self) { index in
                    MenuButtonView(
                        type: viewModel.menuList[index],
                        buttonAction: {
                            viewModel.send(.menuButtonTapped(viewModel.menuList[index]))
                        }
                    )
                    
                    if index < viewModel.menuList.count-1 {
                        ColorDivider(height: 1, color: .gray.opacity(0.2))
                            .hPadding(20)
                    }
                }
            }
        }
    }
}

private extension MyPageView {
    var myProfileView: some View {
        ZStack(alignment: .top) {
            VStack(spacing: 0) {
                Spacer().height(avatarSize/2)
                Text("동준")
                    .font(.system(size: 20, weight: .bold))
                    .padding(.top, 8)
                
                Text("테스트중")
                    .font(.system(size: 16, weight: .medium))
                    .padding(.bottom, 20)
            }
            .greedyWidth()
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(.gray.opacity(0.3), lineWidth: 1.0)
            ).hPadding(20)
            circleAvatarView
        }
    }
    
    var circleAvatarView: some View {
        Circle()
            .frame(avatarSize, avatarSize)
            .offset(y: -(avatarSize/2))
    }
}
