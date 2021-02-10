//
//  File.swift
//  
//
//  Created by Guerson on 2020-09-07.
//

import Foundation

extension Encodable {
//    func pathComponent<Req: Encodable>(req: Req?) -> String {
//        var path = simplePathComponent
//        guard let req = req, req.simplePathComponent != path else {
//            return path
//        }
//        path += req.simplePathComponent
//        return path
//    }
    
    var simplePathComponent: String {
        return "/" + self.pathname
    }
}
