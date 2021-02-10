//
//  File.swift
//  
//
//  Created by Ita on 7/7/20.
//

import Foundation

public extension Array where Element: Codable {
    /**
     Creates request using element type as Req and Response type.
     - Parameters:
        - scheme: scheme URL subcomponent
        - host: host URL subcomponent
        - path: path subcomponent. Self simplepathName is appended to the pathname passed.
        - heads: optional dictionary containing the headers of the request.
     - returns: Request created with the parameters.
     - note: This method uses default JSONEncoder and default JSONDecoder; as well as self codable type for req object and Resp type.
     */
    func envelopRequest(scheme: String?,
                 host: String?,
                 path: String?,
                 method: HTTPMethod,
                 heads: [String: String]? = nil) -> Request<Self, Self> {
        self.inclusiveRequest(scheme: scheme,
                              host: host,
                              path: path,
                              method: method,
                              res: Self.self,
                              heads: heads)
    }
    
    func envelopeAPIGet(scheme: String?,
                        host: String?,
                        path: String? = nil,
                        heads: [String: String]? = nil) -> Request<Self, Self> {
        envelopRequest(scheme: scheme,
                       host: host,
                       path: path,
                       method: .get,
                       heads: heads)
    }
    
    func envelopeAPIPost(scheme: String?,
                        host: String?,
                        path: String? = nil,
                        heads: [String: String]? = nil) -> Request<Self, Self> {
        envelopRequest(scheme: scheme,
                       host: host,
                       path: path,
                       method: .post,
                       heads: heads)
    }
    
    func envelopeAPIPut(scheme: String?,
                        host: String?,
                        path: String? = nil,
                        heads: [String: String]? = nil) -> Request<Self, Self> {
        envelopRequest(scheme: scheme,
                       host: host,
                       path: path,
                       method: .put,
                       heads: heads)
    }
    
    func envelopeAPIDelete(scheme: String?,
                        host: String?,
                        path: String? = nil,
                        heads: [String: String]? = nil) -> Request<Self, Self> {
        envelopRequest(scheme: scheme,
                       host: host,
                       path: path,
                       method: .delete,
                       heads: heads)
    }
}
