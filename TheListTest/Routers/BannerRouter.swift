//
//  BannerRouter.swift
//  TheListTest
//
//  Created by Mohsen on 1/26/22.
//

import Foundation
import UIKit

class BannerRouter: AnyRouter {
    
    
    var view: EntryPoint?
    
    static func start() -> AnyRouter {
        
        let router = BannerRouter()
        
        var view: AnyView = HomeVC()
        var presenter: AnyPresenter = BannerPresenter()
        var interactor: AnyInteractor = BannerInteractor()
        
        view.presenter = presenter
        
        interactor.presenter = presenter
        
        presenter.router = router
        presenter.view = view
        presenter.interactor = interactor
        
        router.view = view as? EntryPoint
        
        return router
    }
    
    @discardableResult
    static func start(_ view: EntryPoint) -> AnyRouter {
        let router = BannerRouter()
        
        var _view: AnyView = view
        var presenter: AnyPresenter = BannerPresenter()
        var interactor: AnyInteractor = BannerInteractor()
        
        _view.presenter = presenter
        
        interactor.presenter = presenter
        
        presenter.router = router
        presenter.view = _view
        presenter.interactor = interactor
        
        router.view = view as? EntryPoint
        
        return router
    }
    
    @discardableResult
    static func start(_ view: AnyView) -> AnyRouter {
        let router = BannerRouter()
        
        var _view: AnyView = view
        var presenter: AnyPresenter = BannerPresenter()
        var interactor: AnyInteractor = BannerInteractor()
        
        _view.presenter = presenter
        
        interactor.presenter = presenter
        
        presenter.router = router
        presenter.view = _view
        presenter.interactor = interactor
        
        router.view = view as? EntryPoint
        
        return router
    }
    
}
