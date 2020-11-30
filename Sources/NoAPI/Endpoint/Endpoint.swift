//
//  Endpoint.swift
//  NoApi
//
//  Created by Guerson on 2020-07-05.
//  Copyright © 2020 rise. All rights reserved.
//

import Foundation

public struct Endpoint<T: Encodable> {
    var scheme: String? //      https
    var host: String? //        domain.com
    var path: String? //        /path/path
    var params: T?
}

extension Endpoint {
    func url<T: Encodable>(params: T?) -> URL? {
        var components = URLComponents()
        components.scheme = self.scheme
        components.host = self.host
        components.path = self.path ?? ""
        components.queryItems = params?.toUrlQueryItems()
        return components.url
    }
}
