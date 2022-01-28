//
//  ImageDownloaderObserver.swift
//  TheListTest
//
//  Created by Mohsen on 1/28/22.
//

import Foundation
import UIKit

protocol ImageDownloaderObserver {
    var id: Int? { get }
    var imageAddress: String {get}
    func update(image: UIImage)
}

