//
//  BannerModel.swift
//  TheListTest
//
//  Created by Mohsen on 1/26/22.
//

import Foundation

struct BannerModel: Codable, Identifiable, Equatable {
    let id: Int
    let title: String
    let expensiveLevel: Int
    let imageAddressString: String
    var imageLink: URL? {
        URL(string: imageAddressString)
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case expensiveLevel = "exp_level"
        case imageAddressString = "image"
    }
    
    
}
