//
//  HTTPMethod.swift
//  NoApi
//
//  Created by Guerson on 2020-07-05.
//  Copyright © 2020 rise. All rights reserved.
//

import Foundation

public enum HTTPMethod: String {
    case get
    case post
    case put
    case delete
}

extension HTTPMethod {
    func isQueryParams() -> Bool {
        switch self {
        case .get:
            return true
        case .post, .put, .delete:
            return false
        }
    }
}
