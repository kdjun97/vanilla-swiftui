//
//  RootNavigation.swift
//  Root
//
//  Created by 김동준 on 11/27/25
//

import Foundation

final public class RootNavigation: ObservableObject {
    @Published var rootPath: RootPath = .splash
    
    public init() {}
}
