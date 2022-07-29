//
//  UseCaseCallbackInteractor.swift
//  MoveeWebService
//
//  Created by Oguz Tandogan on 13.12.2020.
//

import Foundation

protocol UseCaseCallbackInteractor {
    
    associatedtype Response
    
    var onSuccessCompletion: ((Response) -> Void)? { get }
    
    func onSuccess(response: Response)
    func onError(error: BaseErrorResponse)
    
    func onSuccess(completion: @escaping (Response) -> Void)
    func onError(completion: @escaping (BaseErrorResponse) -> Void)
    func commonResult(completion: @escaping (Result<Response, BaseErrorResponse>) -> Void)
    
}
