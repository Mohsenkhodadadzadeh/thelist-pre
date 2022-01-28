//
//  WidgetModel.swift
//  TheListTest
//
//  Created by Mohsen on 1/28/22.
//

import Foundation


struct WidgetModel: Codable, Identifiable, Equatable {
    
    let id: Int
    let barName: String
    let barImageData: Data?
    let barExpensiveLevel: Int
}
