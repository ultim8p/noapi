//
//  File.swift
//  
//
//  Created by Guerson on 2020-09-06.
//

import Foundation

public extension Array where Element: Codable {
    func apiGet(scheme: String?,
             host: String?,
             heads: [String: String]? = nil,
             encoder: JSONEncoder? = nil,
             decoder: JSONDecoder? = nil) -> Request<Self, Self> {
        return self.request(method: .get, scheme: scheme, host: host, heads: heads, encoder: encoder, decoder: decoder)
    }
    
    func apiPut(scheme: String?,
                host: String?,
                heads: [String: String]? = nil,
                encoder: JSONEncoder? = nil,
                decoder: JSONDecoder? = nil) -> Request<Self, Self> {
        return self.request(method: .put, scheme: scheme, host: host, heads: heads, encoder: encoder, decoder: decoder)
    }
    
    func apiPost(scheme: String?,
                 host: String?,
                 heads: [String: String]? = nil,
             encoder: JSONEncoder? = nil,
             decoder: JSONDecoder? = nil) -> Request<Self, Self> {
        return self.request(method: .post, scheme: scheme, host: host, heads: heads, encoder: encoder, decoder: decoder)
    }
    
    func apiDelete(scheme: String?,
                   host: String?,
                   heads: [String: String]? = nil,
             encoder: JSONEncoder? = nil,
             decoder: JSONDecoder? = nil) -> Request<Self, Self> {
        return self.request(method: .delete, scheme: scheme, host: host, heads: heads, encoder: encoder, decoder: decoder)
    }
}
