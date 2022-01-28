//
//  AnyInteractor.swift
//  TheListTest
//
//  Created by Mohsen on 1/26/22.
//

import Foundation

protocol AnyInteractor {
    
    var presenter: AnyPresenter? { get set }
    
    func getData()
}
