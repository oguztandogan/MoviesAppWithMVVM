//
//  HttpClientInterface.swift
//  MoveeWebService
//
//  Created by Oguz Tandogan on 19.11.2020.
//

import Foundation
import RxSwift
import Alamofire

public protocol HttpClientInterface {
    
    // single threads functions
    func executeRequest<R: CodableDataProtocol>(urlRequestConvertible: URLRequestConvertible) -> Single<R>
    func responseParser<R: CodableDataProtocol>(alamofireResponseData: AFDataResponse<Data?>, single: Single<R>.SingleObserver)

}
