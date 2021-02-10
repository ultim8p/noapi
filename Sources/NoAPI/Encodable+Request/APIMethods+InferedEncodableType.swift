//
//  File.swift
//  
//
//  Created by Guerson on 2020-09-06.
//

import Foundation

//MARK: Inclusive self encodable
public extension Encodable {
    /**
     Creates inclusive request with GET httpMethod.
     - Parameters:
        - scheme: scheme URL subcomponent
        - host: host URL subcomponent
        - path: path subcomponent.
        - res: Response type
        - heads: optional dictionary containing the headers of the request.
     - returns: Request created with the parameters.
     - note: This method uses inclusive request method.
     */
    func apiGet<Res: Decodable>(scheme: String?,
                                host: String?,
                                path: String? = nil,
                                res: Res.Type,
                                heads: [String: String]? = nil) -> Request<Self, Res> {
        self.inclusiveRequest(scheme: scheme,
                              host: host,
                              path: path,
                              method: .get,
                              res: res,
                              heads: heads)
    }
    
    /**
     Creates inclusive request with POST httpMethod.
     - Parameters:
        - scheme: scheme URL subcomponent
        - host: host URL subcomponent
        - path: path subcomponent.
        - res: Response type
        - heads: optional dictionary containing the headers of the request.
     - returns: Request created with the parameters.
     - note: This method uses inclusive request method.
     */
    func apiPost<Res: Decodable>(scheme: String?,
                                host: String?,
                                path: String? = nil,
                                res: Res.Type,
                                heads: [String: String]? = nil) -> Request<Self, Res> {
        self.inclusiveRequest(scheme: scheme,
                              host: host,
                              path: path,
                              method: .post,
                              res: res,
                              heads: heads)
    }
    
    /**
     Creates inclusive request with PUT httpMethod.
     - Parameters:
        - scheme: scheme URL subcomponent
        - host: host URL subcomponent
        - path: path subcomponent.
        - res: Response type
        - heads: optional dictionary containing the headers of the request.
     - returns: Request created with the parameters.
     - note: This method uses inclusive request method.
     */
    func apiPut<Res: Decodable>(scheme: String?,
                                host: String?,
                                path: String? = nil,
                                res: Res.Type,
                                heads: [String: String]? = nil) -> Request<Self, Res> {
        self.inclusiveRequest(scheme: scheme,
                              host: host,
                              path: path,
                              method: .put,
                              res: res,
                              heads: heads)
    }
    
    /**
     Creates inclusive request with DELETE httpMethod.
     - Parameters:
        - scheme: scheme URL subcomponent
        - host: host URL subcomponent
        - path: path subcomponent.
        - res: Response type
        - heads: optional dictionary containing the headers of the request.
     - returns: Request created with the parameters.
     - note: This method uses inclusive request method.
     */
    func apiDelete<Res: Decodable>(scheme: String?,
                                host: String?,
                                path: String? = nil,
                                res: Res.Type,
                                heads: [String: String]? = nil) -> Request<Self, Res> {
        self.inclusiveRequest(scheme: scheme,
                              host: host,
                              path: path,
                              method: .delete,
                              res: res,
                              heads: heads)
    }
}
