//
//  UseCaseCallback.swift
//  MoveeWebService
//
//  Created by Oguz Tandogan on 13.12.2020.
//

import Foundation

public class UseCaseCallback<T>: UseCaseCallbackInteractor {
    public typealias Response = T
    
    public var onSuccessCompletion: ((T) -> Void)?
    var onErrorCompletion: ((BaseErrorResponse) -> Void)?
    var onCallBackResultCompletion: ((Result<T, BaseErrorResponse>) -> Void)?
    
    public func onSuccess(response: T) {
        onSuccessCompletion?(response)
        onCallBackResultCompletion?(.success(response))
    }
    
    public func onError(error: BaseErrorResponse) {
        onErrorCompletion?(error)
        onCallBackResultCompletion?(.failure(error))
    }
    
    public func onSuccess(completion: @escaping (T) -> Void) {
        onSuccessCompletion = completion
    }
    
    public func onError(completion: @escaping (BaseErrorResponse) -> Void) {
        onErrorCompletion = completion
    }
    
    public func commonResult(completion: @escaping (Result<T, BaseErrorResponse>) -> Void) {
        onCallBackResultCompletion = completion
    }
    
}
