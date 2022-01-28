//
//  HomeView.swift
//  TheListTest
//
//  Created by Mohsen on 1/26/22.
//

import Foundation

extension HomeVC: AnyView {
    
    func update<T>(with result: T) where T : Decodable, T : Encodable {
        if let obj = result as? BaseModel<[BannerModel]> {
            prepareBannerSlider(obj.data)
            if !obj.data.isEmpty {
                Storgage.shared.storeForWidget(obj.data[0])
            }
            print(obj.data)
        }
    }
    
    func update(with error: Error) {
        print(error.localizedDescription)
    }
    
    
    
    
}
