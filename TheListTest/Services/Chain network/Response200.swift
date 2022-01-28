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
            do {
            let retObj = try JSONDecoder().decode(T.self, from: unserilized)
            return retObj
            } catch {
                throw(NetworkErrors.convertToModelError(data: String(data: unserilized, encoding: .utf8)))
            }
        } else {
            if next != nil {
                return try next!.calculate(unserilized, status: status)
            }
            throw(NetworkErrors.endOfChain)
        }
    }
    var next: NetworkChainProtocol?
}
