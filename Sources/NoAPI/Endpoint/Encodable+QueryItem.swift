//
//  Encodable+QueryItem.swift
//  NoApi
//
//  Created by Guerson on 2020-07-05.
//  Copyright © 2020 rise. All rights reserved.
//

import Foundation

extension Encodable {
    func toUrlQueryItems() -> [URLQueryItem] {
        let paramsDict = self.toDictionary()
        var items: [URLQueryItem] = []
        for (key, val) in paramsDict {
            if let valString = val as? String {
                let item = URLQueryItem(name: key, value: valString)
                items.append(item)
            }
        }
        return items
    }
}
