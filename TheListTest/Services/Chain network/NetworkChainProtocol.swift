//
//  NetworkChainProtocol.swift
//  TheListTest
//
//  Created by Mohsen on 1/26/22.
//

import Foundation
protocol NetworkChainProtocol {

    func calculate <T: Codable>(_ unserilized: Data, status: Int) throws -> T
    var next: NetworkChainProtocol? { get set}
}
