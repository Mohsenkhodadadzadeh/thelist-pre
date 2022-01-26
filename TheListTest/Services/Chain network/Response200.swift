//
//  Response200.swift
//  TheListTest
//
//  Created by Mohsen on 1/26/22.
//

import Foundation

class Response200: NetworkChainProtocol {
    func calculate<T: Codable>(_ unserilized: Data, status: Int) throws -> T {

        if status == 200 {
            let retObj = try! JSONDecoder().decode(T.self, from: unserilized)
            return retObj
        } else {
            if next != nil {
                return try next!.calculate(unserilized, status: status)
            }
            throw(NetworkErrors.endOfChain)
        }
    }
    var next: NetworkChainProtocol?
}
