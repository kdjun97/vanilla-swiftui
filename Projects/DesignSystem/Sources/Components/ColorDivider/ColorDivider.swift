//
//  ColorDivider.swift
//  DesignSystem
//
//  Created by 김동준 on 11/28/25
//

import SwiftUI

public struct ColorDivider: View {
    private let height: CGFloat
    private let color: Color
    
    public init(height: CGFloat, color: Color) {
        self.height = height
        self.color = color
    }
    
    public var body: some View {
        Spacer()
            .height(height)
            .greedyWidth()
            .background(color)
    }
}
