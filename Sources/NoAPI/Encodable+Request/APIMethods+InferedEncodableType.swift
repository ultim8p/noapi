//
//  File.swift
//  
//
//  Created by Guerson on 2020-09-06.
//

import Foundation

//MARK: Self is Encodable Request type
public extension Encodable {
    func apiGet<Res: Decodable>(res: Res.Type,
                                scheme: String?,
                                host: String?,
                                heads: [String: String]? = nil,
                                encoder: JSONEncoder? = nil,
                                decoder: JSONDecoder? = nil) -> Request<Self, Res> {
        return self.request(scheme: scheme, host: host, method: .get, res: res, heads: heads, encoder: encoder, decoder: decoder)
    }
    
    func apiPost<Res: Decodable>(res: Res.Type,
                                 scheme: String?,
                                 host: String?,
                                 heads: [String: String]? = nil,
                                 encoder: JSONEncoder? = nil,
                                 decoder: JSONDecoder? = nil) -> Request<Self, Res> {
        return self.request(scheme:scheme, host: host, method: .post, res: res, heads: heads, encoder: encoder, decoder: decoder)
    }
    
    func apiPut<Res: Decodable>(res: Res.Type,
                                scheme: String?,
                                host: String?,
                                heads: [String: String]? = nil,
                                encoder: JSONEncoder? = nil,
                                decoder: JSONDecoder? = nil) -> Request<Self, Res> {
        return self.request(scheme: scheme, host: host, method: .put, res: res, heads: heads, encoder: encoder, decoder: decoder)
    }
    
    func apiDelete<Res: Decodable>(res: Res.Type,
                                   scheme: String?,
                                   host: String?,
                                   heads: [String: String]? = nil,
                                   encoder: JSONEncoder? = nil,
                                   decoder: JSONDecoder? = nil) -> Request<Self, Res> {
        return self.request(scheme: scheme, host: host, method: .delete, res: res, heads: heads, encoder: encoder, decoder: decoder)
    }
}
