//
//  SignInView.swift
//  SignIn
//
//  Created by 김동준 on 11/26/25
//

import SwiftUI
import DI

public struct SignInView: View  {
    @StateObject private var viewModel: SignInViewModel

    public init() {
        let viewModel: SignInViewModel = DIContainer.shared.resolve()
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    public var body: some View {
        signInBody
    }
    
    private var signInBody: some View {
        VStack(spacing: 0) {
            Text("Vanilla")
                .font(.system(size: 54, weight: .bold))
                .padding(.top, 200)
            Spacer()
            
            socialLoginView
                .padding(.bottom, 24)
            
            emailLoginView
                .padding(.bottom, 48)
        }
    }
    
    private var socialLoginView: some View {
        HStack(spacing: 32) {
            Button {
                viewModel.send(.kakaoButtonTapped)
            } label: {
                Circle()
                    .foregroundStyle(.black)
                    .frame(width: 48, height: 48)
            }
            Button {
                viewModel.send(.appleButtonTapped)
            } label: {
                Circle()
                    .foregroundStyle(.gray)
                    .frame(width: 48, height: 48)
            }
        }
    }
    
    private var emailLoginView: some View {
        HStack(spacing: 16) {
            Text("이미 가입하셨나요?")
                .font(.system(size: 16, weight: .regular))
            
            Button {
                
            } label: {
                Text("로그인")
                    .font(.system(size: 16, weight: .regular))
                    .foregroundStyle(.gray)
            }
        }
    }
}
