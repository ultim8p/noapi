//
//  File.swift
//
//
//  Created by Ita on 7/6/20.
//

import Foundation
import Mergeable
import CodableUtils

public extension Encodable {
    
    @discardableResult
    func request<Res: Decodable>(scheme: String?,
                                 host: String?,
                                 method: HTTPMethod,
                                 res: Res.Type,
                                 heads: [String: String]? = nil,
                                 encoder: JSONEncoder? = nil,
                                 decoder: JSONDecoder? = nil) -> Request<Self, Res> {
        let path = self.pathComponent()
        return self.makeRequest(scheme: scheme, host: host, path: path, method: method, res: res, req: self, heads: heads, encoder: encoder, decoder: decoder)
    }
    
    @discardableResult
    func request<Req: Encodable, Res: Decodable>(scheme: String?,
                                                 host: String?,
                                                 method: HTTPMethod,
                                                 res: Res.Type,
                                                 req: Req? = nil,
                                                 heads: [String: String]? = nil,
                                                 encoder: JSONEncoder? = nil,
                                                 decoder: JSONDecoder? = nil) -> Request<Req, Res> {
        let path = self.pathComponent(req: req)
        return self.makeRequest(scheme: scheme, host: host, path: path, method: method, res: res, req: req, heads: heads, encoder: encoder, decoder: decoder)
    }
    

    
    func makeRequest<Req: Encodable, Res: Decodable>(scheme: String?,
                                                     host: String?,
                                                     path: String,
                                                     method: HTTPMethod,
                                                     res: Res.Type,
                                                     req: Req?,
                                                     heads: [String: String]? = nil,
                                                     encoder: JSONEncoder? = nil,
                                                     decoder: JSONDecoder? = nil) -> Request<Req, Res> {
        let endpoint = Endpoint(scheme: scheme, host: host, path: path, params: req)

        let request: Request<Req, Res> = Request()
        request.endpoint = endpoint
        request.heads = heads
        request.encoder = encoder
        request.decoder = decoder
        request.responseType = res
        
        let urlTest = request.makeUrl()
        print("Endpoint created \(urlTest?.absoluteString)")

        return request.performRequest()
    }
}
