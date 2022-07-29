//
//  SingleUseCase.swift
//  MoveeWebService
//
//  Created by Oguz Tandogan on 13.12.2020.
//

import Foundation
import RxSwift

public class SingleUseCase<Request, Response, Repository>: BaseUseCase<Request, Single<Response>, Repository> {
    
    public func execute(useCaseCallBack: UseCaseCallback<Response>, params: Request, pathParameter: String? = "") {
        onPreExecute()
        addDisposable(disposable: self.generateUseCase(parameter: params, pathParameter: pathParameter)?.subscribe(onSuccess: { (response) in
            self.onPostExecute()
            useCaseCallBack.onSuccess(response: response)
        }, onFailure: { (error) in
            self.onPostExecute()
            self.onErrorCondition(useCaseCallBack: useCaseCallBack, error: error)
        }))
    }
    
    private func onErrorCondition(useCaseCallBack: UseCaseCallback<Response>, error: Error) {
        guard let error = error as? BaseErrorResponse else { return }
        useCaseCallBack.onError(error: error)
    }
    
}
