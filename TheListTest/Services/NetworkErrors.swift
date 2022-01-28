//
//  NetworkErrors.swift
//  TheListTest
//
//  Created by Mohsen on 1/26/22.
//

import Foundation


enum NetworkErrors: Error {
    case notFound
    case internalServerError
    case nilUrl
    case endOfChain
    case convertToModelError(data: String?)
    case unknownError(errorDescription: String?)
    
}

extension NetworkErrors: LocalizedError {
    var errorDescription: String? {
        switch self {

        case .notFound: return "URL Not found"

        case .internalServerError: return "An error accures on the server"
    
        case .nilUrl: return "Url was received nil"
            
        case .endOfChain: return "Undifined error"
        
        case .convertToModelError(let data): return "convert data to model failed for \(data != nil ? data! : "")"
            
        case .unknownError(let errorDescription): return "new error was occured in line \(#line) , Network->\(#function): \(String(describing: errorDescription))"
            

        }
    }
}
