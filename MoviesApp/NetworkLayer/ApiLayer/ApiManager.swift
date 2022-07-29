//
//  ApiManager.swift
//  MoveeWebService
//
//  Created by Oguz Tandogan on 19.11.2020.
//

import Foundation
import Alamofire
import RxSwift

public class ApiManager: HttpClientInterface {
    
    // MARK: - To manage Alamofire requests -
    private var session = Session()
    
    let dispatchQueue = DispatchQueue(label: "QueueIdentification", qos: .background)
    
    // MARK: - To decode JSON response -
    private var jsonDecoder = JSONDecoder()
    
    public init() {

            let configuration = URLSessionConfiguration.ephemeral
            configuration.timeoutIntervalForRequest = 60
            configuration.requestCachePolicy = .reloadIgnoringCacheData

            session = Session(configuration: configuration, startRequestsImmediately: true)

        }
    
    // MARK: - Single Stream Methods -
    public func executeRequest<R>(urlRequestConvertible: URLRequestConvertible) -> Single<R> where R: CodableDataProtocol{
        
        return Single.create { [weak self] (single) -> Disposable in
            self?.dispatchQueue.async {
                self?.session.request(urlRequestConvertible).validate().response(completionHandler: { (alamofireResponseData) in
                    self?.responseParser(alamofireResponseData: alamofireResponseData, single: single)
                })
            }

            
            return Disposables.create()
        }
    }
    
    public func responseParser<R>(alamofireResponseData: AFDataResponse<Data?>, single: (SingleEvent<R>) -> Void) where R: CodableDataProtocol {
        
        switch alamofireResponseData.result {
        case .failure(let error):
            single(.failure(GenericErrorResponseModule(errorResponse: BaseErrorResponse(errorCode: returnErrorCode(error: error), errorMessage: error.localizedDescription, success: false), apiConnectionErrorType: .serverError(returnErrorCode(error: error)))))
            
        case .success(let data):
            if let data = data {
                
                do {
                    let dataDecoded = try jsonDecoder.decode(R.self, from: data)
                    single(.success(dataDecoded))
                } catch let error {
                    print("error : \(error)")
                }
            }
        }
    }

    
    private func returnErrorCode(error: AFError) -> Int {
        guard let underlyingError = error.underlyingError else { return NSURLErrorUnknown }
        return underlyingError._code
    }
}
