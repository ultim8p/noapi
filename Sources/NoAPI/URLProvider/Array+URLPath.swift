//
//  File.swift
//  
//
//  Created by Guerson on 2020-09-07.
//

import Foundation

extension Array where Element: Codable {
    func pathComponent() -> String {
        return simplePathComponent
    }
    
    private var simplePathComponent: String {
        return "/" + self.pathname
    }
}
