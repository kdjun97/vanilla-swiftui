//
//  ApiService.swift
//  Data
//
//  Created by 김동준 on 11/29/25
//

import Foundation

public final class ApiService {
    public init() {}
    // MARK: API 통신 함수, 이번 프로젝트에서는 구현하지 않음.
    func call() async throws {
        try await Task.sleep(for: .seconds(1))
        
        let random = Int.random(in: 0...1)

        if random == 0 {
            throw NSError(domain: "TempError", code: -1)
        }
        
        // MARK: 50% 확률 에러, 그 외 정상으로 간주
    }
}
