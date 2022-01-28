//
//  BannerPresenters.swift
//  TheListTest
//
//  Created by Mohsen on 1/26/22.
//

import Foundation

class BannerPresenter: AnyPresenter {
    var router: AnyRouter?
    
    var interactor: AnyInteractor? {
        didSet {
            interactor?.getData()
        }
    }
    
    var view: AnyView?
    
    func interactorDidFetch(with result: Result<BaseModel<[BannerModel]>, Error>) {
        switch result {
        case .success(let banners):
            view?.update(with: banners)
        case .failure(let error):
            view?.update(with: error)
        }
    }
    
    
}
