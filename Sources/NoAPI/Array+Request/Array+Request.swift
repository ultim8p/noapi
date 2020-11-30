//
//  File.swift
//  
//
//  Created by Ita on 7/7/20.
//

import Foundation

public extension Array where Element: Codable {
    func request(method: HTTPMethod,
                 scheme: String?,
                 host: String?,
                 heads: [String: String]? = nil,
                 encoder: JSONEncoder? = nil,
                 decoder: JSONDecoder? = nil) -> Request<Self, Self> {
        let path = self.pathComponent()
        return self.makeRequest(scheme: scheme, host: host, path: path, method: method, res: Self.self, req: self, heads: heads, encoder: encoder, decoder: decoder)
    }
}
