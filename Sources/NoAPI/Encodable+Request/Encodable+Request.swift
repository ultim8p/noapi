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
    /**
     Creates request using self as request type
     - Parameters:
        - scheme: scheme URL subcomponent
        - host: host URL subcomponent
        - path: path subcomponent. Self simplepathName is added appended to the pathname passed.
        - res: Response type
        - heads: optional dictionary containing the headers of the request.
     - returns: Request created with the parameters.
     - note: This method uses default JSONEncoder and default JSONDecoder.
     */
    @discardableResult
    func inclusiveRequest<Res: Decodable>(scheme: String?,
                                 host: String?,
                                 path: String?,
                                 method: HTTPMethod,
                                 res: Res.Type,
                                 heads: [String: String]? = nil) -> Request<Self, Res> {
        var outrightPath = path ?? ""
        outrightPath += self.simplePathComponent
        return self.makeRequest(scheme: scheme, host: host, path: outrightPath, method: method, res: res, req: self, heads: heads)
    }
    
    /**
     Creates fully customizable request.
     - Parameters:
        - scheme: scheme URL subcomponent
        - host: host URL subcomponent
        - path: path subcomponent.
        - res: Response type
        - req: The codable object with whom body or query items will be built.
        - heads: optional dictionary containing the headers of the request.
     - returns: Request created with the parameters.
     */
    @discardableResult
    func request<Req: Encodable, Res: Decodable>(scheme: String?,
                                                 host: String?,
                                                 path: String?,
                                                 method: HTTPMethod,
                                                 res: Res.Type,
                                                 req: Req?,
                                                 heads: [String: String]? = nil,
                                                 encoder: JSONEncoder? = nil,
                                                 decoder: JSONDecoder? = nil) -> Request<Req, Res> {
        self.makeRequest(scheme: scheme,
                         host: host,
                         path: path,
                         method: method,
                         res: res,
                         req: req,
                         heads: heads,
                         encoder: encoder,
                         decoder: decoder)
    }
    

    
    internal func makeRequest<Req: Encodable, Res: Decodable>(scheme: String?,
                                                     host: String?,
                                                     path: String?,
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
