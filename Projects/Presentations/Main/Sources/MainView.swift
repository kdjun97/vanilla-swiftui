//
//  MainView.swift
//  Main
//
//  Created by 김동준 on 11/26/25
//

import SwiftUI
import DI
import Home
import MyPage

public struct MainView: View  {
    @EnvironmentObject private var navigation: MainNavigation
    @StateObject private var viewModel: MainViewModel

    public init() {
        let viewModel: MainViewModel = DIContainer.shared.resolve()
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    public var body: some View {
        NavigationStack(path: $navigation.mainPath) {
            mainBodyView
                .navigationDestination(for: MainPath.self) { path in
                    destinationView(path: path)
                }
        }
    }
    
    private func destinationView(path: MainPath) -> some View {
        ZStack {
            switch path {
            case .editProfile:
                EditProfileView()
            }
        }
    }
}

private extension MainView {
    var mainBodyView: some View {
        TabView(selection: $viewModel.selectedTab) {
            HomeView()
                .tabItem {
                    Label("홈", systemImage: "house.fill")
                }
                .tag(TabCase.home)
            MyPageView()
                .tabItem {
                    Label("내정보", systemImage: "person.crop.circle")
                }
                .tag(TabCase.myPage)
        }
    }
}

// TODO: EditProfile View
private struct EditProfileView: View {
    var body: some View {
        Text("Edit Profile View")
    }
}

enum TabCase {
    case home
    case myPage
}
