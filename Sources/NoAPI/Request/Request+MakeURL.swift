//
//  File.swift
//  
//
//  Created by Guerson on 2020-09-07.
//

import Foundation

extension Request {
    func makeUrl () -> URL? {
        return endpoint?.url(params: method?.isQueryParams() ?? false ? params : nil)
    }
}

extension Request {
    func makeUrlRequest() throws -> URLRequest {
        guard let url = makeUrl() else {
            throw APIError.invalidUrl
        }
        var urlRequest = URLRequest(url: url)
        if method?.isQueryParams() == false {
            try urlRequest.setBody(from: self)
        }
        for (key, val) in heads ?? [:] {
            urlRequest.addValue(val, forHTTPHeaderField: key)
        }
        urlRequest.httpMethod = (method ?? .get).rawValue.uppercased()
        return urlRequest
    }
}
