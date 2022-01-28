//
//  BaseModel.swift
//  TheListTest
//
//  Created by Mohsen on 1/26/22.
//

import Foundation

struct BaseModel<T: Codable & Equatable>: Codable, Equatable {
   
    let status: Int
    let message: String
    let data: T
}
