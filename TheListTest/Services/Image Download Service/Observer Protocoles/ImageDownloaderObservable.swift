//
//  ImageDownloaderObservable.swift
//  TheListTest
//
//  Created by Mohsen on 1/28/22.
//

import Foundation
import UIKit
protocol ImageDownloaderObservable {
    func add(object: ImageDownloaderObserver)
    func remove(object: ImageDownloaderObserver)
    func update(id: Int, data: UIImage)
}

