//
//  BannerInteractor.swift
//  TheListTest
//
//  Created by Mohsen on 1/26/22.
//

import Foundation
import UIKit

class BannerInteractor: AnyInteractor {
    var presenter: AnyPresenter?
    
    func getData() {
        
        Network.shared.getData(command: "data.json") { [weak self] (result: BaseModel<[BannerModel]>) in
            (self?.presenter as? BannerPresenter)?.interactorDidFetch(with: .success(result))
        } failure: { [weak self] error in
            let retObj: Result<BaseModel<[BannerModel]>, Error>
            (self?.presenter as? BannerPresenter)?.interactorDidFetch(with: .failure(error))
        }

    }
    
    
}
