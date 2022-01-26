//
//  HomeVC.swift
//  TheListTest
//
//  Created by Mohsen on 1/26/22.
//

import UIKit

class HomeVC: UIViewController {

    var presenter: AnyPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        BannerRouter.start(self)

        // Do any additional setup after loading the view.
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
