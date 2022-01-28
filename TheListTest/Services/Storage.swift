//
//  Storage.swift
//  TheListTest
//
//  Created by Mohsen on 1/28/22.
//

import Foundation
import UIKit

public final class Storgage {
    private let groupDefault = UserDefaults(suiteName: "group.com.mohsen.TheListTest")
    private var barData: Data = Data()
    
    var id: Int? = 0
    var imageAddress: String = ""
    private var barItem: WidgetModel?
    private var ItemForSave: BannerModel?
    let observable: ImageDownloaderObservable = ImageDownloader()
    private var lockForGettingImage: Bool = false
    public static let shared: Storgage = Storgage()
    
    var itemForWidget: WidgetModel? {
        return barItem
    }
    init() {
        self.barItem = self.getStorage()
        
    }
    
    func storeForWidget(_ data: BannerModel) {
        ItemForSave = data
        imageAddress = data.imageAddressString
        if !lockForGettingImage {
            observable.add(object: self)
            lockForGettingImage.toggle()
        }
        
    }
    private func getStorage() -> WidgetModel? {
        
        if let obj = groupDefault?.object(forKey: "popularwidget") as? Data {
            let decoder = PropertyListDecoder()
            do {
            let loaded = try decoder.decode(WidgetModel.self, from: obj)
                return loaded
            } catch let error {
            
                print(error)
            }
        }
        return nil
    }
    
    private func saveData (_ data: WidgetModel) {
        let encoder = PropertyListEncoder()
        if let encoded = try? encoder.encode(data) {
            groupDefault?.set(encoded, forKey: "popularwidget")
        }
    }
    
}


extension Storgage: ImageDownloaderObserver {
    
    func update(image: UIImage) {
        lockForGettingImage.toggle()
        if let item = ItemForSave, let data = image.jpegData(compressionQuality: 1) {
            saveData(WidgetModel(id: item.id, barName: item.title, barImageData: data , barExpensiveLevel: item.expensiveLevel))
        }
    }
}
