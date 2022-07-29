//
//  EncodableExtension.swift
//  MoveeWebService
//
//  Created by Oguz Tandogan on 13.12.2020.
//

import Foundation
import Alamofire

extension Encodable {
    func asDictionary() -> Parameters {
        do {
            let encoder = JSONEncoder()
            encoder.dateEncodingStrategy = .formatted(CodableDataFormatter.outgoingDateFormatter)
            let data = try encoder.encode(self)
            
            return try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] ?? [:]
        } catch {
            return [:]
        }
    }
    
    var jsonData: Data? {
        let encoder = JSONEncoder()
        return try? encoder.encode(self)
    }
    
    var jsonString: String? {
        guard let data = self.jsonData else { return nil }
        return String(data: data, encoding: .utf8)
    }
    
    func toJson() -> Data? {
        return try? JSONEncoder().encode(self)
    }
    
}

class CodableDataFormatter {
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        return formatter
    }()
    
    static let outgoingDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
}
