//
//  AccountUseCase.swift
//  Domain
//
//  Created by 김동준 on 11/29/25
//

public struct AccountUseCase {
    private let repositoryProtocol: AccountRepositoryProtocol
    
    public init(repositoryProtocol: AccountRepositoryProtocol) {
        self.repositoryProtocol = repositoryProtocol
    }

    public func updateUserProfile() async throws {
        try await repositoryProtocol.updateUserProfile()
    }
}
