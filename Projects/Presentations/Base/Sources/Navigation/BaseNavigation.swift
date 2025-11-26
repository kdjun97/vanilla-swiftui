//
//  BaseNavigation.swift
//  Base
//
//  Created by 김동준 on 11/26/25
//

import Foundation

public class BaseNavigation: ObservableObject {
    @Published public var rootPath: RootPath = .splash
    
    public init() {}
}

public enum RootPath {
    case splash
    case signIn
    case main
}
