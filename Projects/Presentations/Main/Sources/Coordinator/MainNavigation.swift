//
//  MainNavigation.swift
//  Main
//
//  Created by 김동준 on 11/27/25
//

import Foundation

final public class MainNavigation: ObservableObject {
    @Published var mainPath: [MainPath] = []
    
    public init() {}
}
