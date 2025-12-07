//
//  AccountRepository.swift
//  Data
//
//  Created by 김동준 on 11/29/25
//

import Domain

public struct AccountRepository: AccountRepositoryProtocol {
    private let apiService: ApiService
    
    public init(apiService: ApiService) {
        self.apiService = apiService
    }
    
    public func updateUserProfile() async throws {
        do {
            try await apiService.call()
        } catch {
            throw error
        }
    }
}
