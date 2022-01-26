//
//  AnyView.swift
//  TheListTest
//
//  Created by Mohsen on 1/26/22.
//

import Foundation

protocol AnyView {
    
    var presenter: AnyPresenter? { get set }
    
    func update<T: Codable>(with result: T)
    func update(with error: Error)
}
