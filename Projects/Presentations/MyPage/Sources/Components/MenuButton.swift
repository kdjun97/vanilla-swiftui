//
//  MenuButton.swift
//  MyPage
//
//  Created by 김동준 on 11/28/25
//

import SwiftUI
import DesignSystem

struct MenuButtonView<MenuItem>: View where MenuItem: RawRepresentable, MenuItem.RawValue == String {
    let type: MenuItem
    let buttonAction: () -> Void
    
    init(
        type: MenuItem,
        buttonAction: @escaping () -> Void
    ) {
        self.type = type
        self.buttonAction = buttonAction
    }
    
    var body: some View {
        Button {
            buttonAction()
        } label: {
            HStack(spacing: 0) {
                Spacer().width(20)
                Text(type.rawValue)
                    .font(.system(size: 16))
                    .foregroundStyle(.black)
                    .vPadding(16)
                Spacer()
                VImages.icArrowRight.swiftUIImage
                    .padding(.trailing, 22)
            }
            .hPadding(8)
            .greedyWidth()
        }
    }
}
