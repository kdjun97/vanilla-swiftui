//
//  LoadingViewModifier.swift
//  DesignSystem
//
//  Created by 김동준 on 11/29/25
//

import SwiftUI

struct LoadingModifier: ViewModifier {
    private let isPresent: Bool
    
    init(isPresent: Bool) {
        self.isPresent = isPresent
    }
    
    func body(content: Content) -> some View {
        ZStack {
            content
            if (isPresent) {
                ZStack {
                    ProgressView().controlSize(.large)
                }.greedyFrame().background(.black.opacity(0.2))
            }
        }
    }
}
