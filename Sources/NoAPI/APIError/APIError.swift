//
//  APIError.swift
//  NoApi
//
//  Created by Guerson on 2020-07-05.
//  Copyright © 2020 rise. All rights reserved.
//

import Foundation

enum APIError: Error {
    case invalidUrl
    case invalidResponseType
    case status(code: APIStatusCode)
}
