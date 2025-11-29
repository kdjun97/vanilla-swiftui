//
//  View+UI.swift
//  DesignSystem
//
//  Created by 김동준 on 11/29/25
//

import SwiftUI

public extension View {
    func vLoading(isPresent: Bool) -> some View {
        modifier(LoadingModifier(isPresent: isPresent))
    }
}
