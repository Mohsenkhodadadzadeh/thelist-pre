//
//  HomeVC.swift
//  TheListTest
//
//  Created by Mohsen on 1/26/22.
//

import UIKit
import Glideshow

class HomeVC: UIViewController {

    var presenter: AnyPresenter?
    
    @IBOutlet weak var barsResturantView: CustomHomeCategoryView!
    
    @IBOutlet weak var liveShowView: CustomHomeCategoryView!
    
    @IBOutlet weak var beachBarView: CustomHomeCategoryView!
    @IBOutlet weak var sliderContentView: UIView!
    @IBOutlet weak var sliderPageControl: UIPageControl!
    @IBOutlet weak var clubView: CustomHomeCategoryView!
    let glideshow = Glideshow()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        BannerRouter.start(self)

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setUpUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        glideshow.frame = CGRect(x: 0, y: 0, width: sliderContentView.frame.width, height: sliderContentView.frame.height - 10)
    }
    
    @objc func barResturantButtonPress(sender: UIButton) {
        let alert = UIAlertController(title: "Alert", message: "ResturantBar Clicked", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "dismiss", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func liveShowButtonPress(sender: UIButton) {
        let alert = UIAlertController(title: "Alert", message: "LiveShow Clicked", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "dismiss", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    @objc func clubButtonPress(sender: UIButton) {
        let alert = UIAlertController(title: "Alert", message: "Club Clicked", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "dismiss", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    @objc func beachBarButtonPress(sender: UIButton) {
        let alert = UIAlertController(title: "Alert", message: "BeachBar Clicked", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "dismiss", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
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
