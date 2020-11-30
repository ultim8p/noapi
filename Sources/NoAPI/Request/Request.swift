//
//  RIRequest.swift
//  RiseFit
//
//  Created by Guerson Perez Yañez on 2016-11-14.
//  Copyright © 2016 Rise. All rights reserved.
//

//@available (macOS)
import Foundation
//import UIKit
import Mergeable

public class Request<T: Encodable, R: Decodable> {
    
    public typealias RequestSuccessHandler = (_ obj: R?) -> Void
    public typealias RequestErrorHandler = (_ err: Error) -> Void
    public typealias RequestFinishHandler = () -> Void
    
    var method: HTTPMethod?
    var heads: [String: String]?
    var encoder: JSONEncoder?
    var decoder: JSONDecoder?
    var params: T?
    var responseType: R.Type?
    var endpoint: Endpoint<T>?
    var task: URLSessionDataTask?
    
    private var successHandlers: [RequestSuccessHandler]?
    private var errorHandlers: [RequestErrorHandler]?
    private var finishHandlers: [RequestFinishHandler]?
    
    fileprivate func notifySuccess(_ obj: R?) {
        for handler in successHandlers ?? [] {
            handler(obj)
        }
    }
    fileprivate func notifyError(_ err: Error) {
        for handler in errorHandlers ?? [] {
            handler(err)
        }
    }
    fileprivate func notifyFinish() {
        for handler in finishHandlers ?? [] {
            handler()
        }
     }
    
    public func onSuccess(_ handler: RequestSuccessHandler?) -> Self {
        guard let handler = handler else { return self }
        var handlers = self.successHandlers ?? []
        handlers.append(handler)
        self.successHandlers = handlers
        return self
    }
    public func onError(_ handler: RequestErrorHandler?) -> Self {
        guard let handler = handler else { return self }
        var handlers = self.errorHandlers ?? []
        handlers.append(handler)
        self.errorHandlers = handlers
        return self
    }
    public func onFinished(_ handler: RequestFinishHandler?) -> Self {
        guard let handler = handler else { return self }
        var handlers = self.finishHandlers ?? []
        handlers.append(handler)
        self.finishHandlers = handlers
        return self
    }
    
    init() {
        
    }
    
    public func cancel() -> Self {
        task?.cancel()
        return self
    }
    
}

extension Request {
    func responseModel(for data: Data) throws -> R? {
        let decoder = self.decoder ?? JSONDecoder()
        let obj = try decoder.decode(R.self, from: data)
        return obj
    }
}

extension URLRequest {
    mutating func setBody<T: Encodable, R: Decodable>(from request: Request<T, R>) throws {
        if let params = request.params {
            let encoder = request.encoder ?? JSONEncoder()
            let body = try encoder.encode(params)
            self.httpBody = body
        }
    }
}

//MARK: Perform Request
extension Request {
    func performRequest() -> Request {
        do {
            let urlRequest = try self.makeUrlRequest()
            let config = URLSessionConfiguration.default
            let session = URLSession(configuration: config)
            let task = session.dataTask(with: urlRequest) { (data, urlResponse, apiError) in
                DispatchQueue.main.async {
                    do {
                        if urlResponse?.isSuccess() ?? false {
                            if let respData = data {
                                let respModel = try self.responseModel(for: respData)
                                self.notifySuccess(respModel)
                            } else {
                                self.notifySuccess(nil)
                            }
                        } else {
                            let code = urlResponse?.statusCode() ?? 0
                            let errorCode = APIStatusCode(rawValue: code) ?? .none
                            throw APIError.status(code: errorCode)
                        }
                    } catch {
                        self.notifyError(apiError ?? error)
                    }
                    self.notifyFinish()
                }
            }
            task.resume()
            self.task = task
        } catch {
            self.notifyError(error)
        }
        return self
    }
    
}
