//
//  URLResponse+Helper.swift
//  NoApi
//
//  Created by Guerson on 2020-07-05.
//  Copyright © 2020 rise. All rights reserved.
//

import Foundation

extension URLResponse {
    func isSuccess() -> Bool {
        if let code = self.statusCode() {
            if code < 400 {
                return true
            }
        }
        return false
    }
    func statusCode() -> Int? {
        if let httpResponse = self as? HTTPURLResponse {
            return httpResponse.statusCode
        }
        return nil
    }
}
