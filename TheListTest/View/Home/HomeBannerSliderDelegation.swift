//
//  HomeBannerSliderDelegation.swift
//  TheListTest
//
//  Created by Mohsen on 1/27/22.
//

import UIKit
import Glideshow

extension HomeVC: GlideshowProtocol {
    func glideshowDidSelecteRowAt(indexPath: IndexPath, _ glideshow: Glideshow) {
        print("index: \(indexPath)")
    }
    
    func pageDidChange(_ glideshow: Glideshow, didChangePageTo page: Int) {
        print("page\(page)")
    }
}
