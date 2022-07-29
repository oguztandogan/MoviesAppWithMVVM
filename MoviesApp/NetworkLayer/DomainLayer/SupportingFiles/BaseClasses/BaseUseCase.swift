//
//  BaseUseCase.swift
//  MoveeWebService
//
//  Created by Oguz Tandogan on 13.12.2020.
//

import Foundation
import RxSwift

public class BaseUseCase<P, T, R>: BaseUseCaseInterface {
    
    private let disposeBag = DisposeBag()
    
    var repository: R
    var useCaseListener: UseCaseListener?
    
    typealias Parameters = P
    typealias Responses = T
    
    public init(repository: R,
                useCaseListener: UseCaseListener?) {
        self.repository = repository
        self.useCaseListener = useCaseListener
    }
    
    func generateUseCase(parameter: P, pathParameter: String? = "") -> T? {
        return nil
    }
    
    func onPreExecute() {
        useCaseListener?.onPreExecute()
    }
    
    func onPostExecute() {
        useCaseListener?.onPostExecute()
    }
    
    func addDisposable(disposable: Disposable?) {
        guard disposable != nil else {
            return
        }
        disposeBag.insert(disposable!)

    }
    
}
