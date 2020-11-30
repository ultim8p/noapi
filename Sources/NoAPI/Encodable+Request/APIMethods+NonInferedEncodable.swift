//
//  File.swift
//  
//
//  Created by Ita on 7/6/20.
//

import Foundation

//MARK: Request Encodable Type required
public extension Encodable {
    
    func apiGet<Req: Encodable, Res: Decodable>(res: Res.Type,
                                             req: Req,
                                             scheme: String?,
                                             host: String?,
                                             heads: [String: String]? = nil,
                                             encoder: JSONEncoder? = nil,
                                             decoder: JSONDecoder? = nil) -> Request<Req, Res> {
        return self.request(scheme: scheme, host: host, method: .get, res: res, req: req, heads: heads, encoder: encoder, decoder: decoder)
    }
    
    func apiPost<Req: Encodable, Res: Decodable>(res: Res.Type,
                                                 req: Req,
                                                 scheme: String?,
                                                 host: String?,
                                                 heads: [String: String]? = nil,
                                                 encoder: JSONEncoder? = nil,
                                                 decoder: JSONDecoder? = nil) -> Request<Req, Res> {
        return self.request(scheme: scheme, host: host, method: .post, res: res, req: req, heads: heads, encoder: encoder, decoder: decoder)
    }
    
    func apiPut<Req: Encodable, Res: Decodable>(res: Res.Type,
                                             req: Req,
                                             scheme: String?,
                                             host: String?,
                                             heads: [String: String]? = nil,
                                             encoder: JSONEncoder? = nil,
                                             decoder: JSONDecoder? = nil) -> Request<Req, Res> {
        return self.request(scheme: scheme, host: host, method: .put, res: res, req: req, heads: heads, encoder: encoder, decoder: decoder)
    }
    
    func apiDelete<Req: Encodable, Res: Decodable>(res: Res.Type,
                                                req: Req,
                                                scheme: String?,
                                                host: String?,
                                                heads: [String: String]? = nil,
                                                encoder: JSONEncoder? = nil,
                                                decoder: JSONDecoder? = nil) -> Request<Req, Res> {
        return self.request(scheme: scheme, host: host, method: .delete, res: res, req: req, heads: heads, encoder: encoder, decoder: decoder)
    }
    


}
