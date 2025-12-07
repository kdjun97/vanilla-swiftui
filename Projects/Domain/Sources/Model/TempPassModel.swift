//
//  TempPassModel.swift
//  Domain
//
//  Created by 김동준 on 12/5/25
//

public struct TempPassModel: Hashable {
    public let value: String
    
    public init(value: String) {
        self.value = value
    }
}
