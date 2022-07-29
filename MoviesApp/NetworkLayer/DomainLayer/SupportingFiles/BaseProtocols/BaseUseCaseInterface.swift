//
//  BaseUseCaseInterface.swift
//  MoveeWebService
//
//  Created by Oguz Tandogan on 13.12.2020.
//

import Foundation

protocol  BaseUseCaseInterface {
    
    var useCaseListener: UseCaseListener? { get }
    
    associatedtype Parameters
    associatedtype Responses
    
    func generateUseCase(parameter: Parameters, pathParameter: String?) -> Responses?
    
    func onPreExecute()
    func onPostExecute()
}
