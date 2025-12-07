//
//  SheetView.swift
//  Home
//
//  Created by 김동준 on 12/7/25
//

import SwiftUI
import DI

public struct SheetView: View  {
    @StateObject private var viewModel: SheetViewModel

    public init() {
        let viewModel: SheetViewModel = DIContainer.shared.resolve()
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    public var body: some View {
        sheetBody
            .onAppear { viewModel.send(.onAppear) }
    }
    
    private var sheetBody: some View {
        VStack(spacing: 24) {
            Text("Sheet View !")
            Button {
                viewModel.send(.buttonTapped)
            } label: {
                Text("pop + count = 10000 초기화")
                    .padding()
                    .background(.black.opacity(0.2))
            }
        }
    }
}
