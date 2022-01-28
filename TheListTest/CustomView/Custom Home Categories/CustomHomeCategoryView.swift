//
//  CustomHomeCategoryView.swift
//  TheListTest
//
//  Created by Mohsen on 1/27/22.
//

import UIKit

class CustomHomeCategoryView: UIView {
    let kCONTENT_XIB_NAME = "CustomHomeCategory"
    @IBOutlet weak var categoryButton: CustomButton!
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var categoryTitle: UILabel!
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override init(frame: CGRect) {
            super.init(frame: frame)
            commonInit()
        }
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            commonInit()
        }
        
        func commonInit() {
            Bundle.main.loadNibNamed(kCONTENT_XIB_NAME, owner: self, options: nil)
            contentView.fixInView(self)
            categoryButton.cornerRadius = (contentView.frame.width * 0.6) / 2
            categoryButton.setTitle("", for: .normal)
           
        }

}
