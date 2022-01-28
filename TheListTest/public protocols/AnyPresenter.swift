//
//  AnyPresenter.swift
//  TheListTest
//
//  Created by Mohsen on 1/26/22.
//

import Foundation

protocol AnyPresenter {
    var router: AnyRouter? { get set }
    var interactor: AnyInteractor? { get set }
    var view: AnyView? { get set }
    
}
