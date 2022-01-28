//
//  MainTabBar.swift
//  TheListTest
//
//  Created by Mohsen on 1/26/22.
//

import UIKit

class MainTabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

  //      UITabBar.appearance().shadowImage = UIImage.colorForNavBar(color: .white)
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tabBar.layer.shadowOffset = CGSize(width: 0, height: 0)
        tabBar.layer.shadowRadius = 3
        tabBar.layer.shadowColor = UIColor.white.cgColor
        tabBar.layer.shadowOpacity = 0.4
        
           // disable full-screen button
           if  let NSApplication = NSClassFromString("NSApplication") as? NSObject.Type,
               let sharedApplication = NSApplication.value(forKeyPath: "sharedApplication") as? NSObject,
               let windows = sharedApplication.value(forKeyPath: "windows") as? [NSObject]
           {
               for window in windows {
                   let resizable = 3
                   property("styleMask", object: window, set: [], clear: [resizable])
                   let fullScreenPrimary = 7
                   let fullScreenAuxiliary = 8
                   let fullScreenNone = 9
                   property("collectionBehavior", object: window, set: [fullScreenNone], clear: [fullScreenPrimary, fullScreenAuxiliary])
               }
           }
    }
    
    func bitSet(_ bits: [Int]) -> UInt {
           return bits.reduce(0) { $0 | (1 << $1) }
       }

       func property(_ property: String, object: NSObject, set: [Int], clear: [Int]) {
           if let value = object.value(forKey: property) as? UInt {
               object.setValue((value & ~bitSet(clear)) | bitSet(set), forKey: property)
           }
       }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        if #available(macCatalyst 14, *) {
                    view.window?.windowScene?.sizeRestrictions?.minimumSize = CGSize(width: 500, height: 850)
                    view.window?.windowScene?.sizeRestrictions?.maximumSize = CGSize(width: 500, height: 850)
                }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
