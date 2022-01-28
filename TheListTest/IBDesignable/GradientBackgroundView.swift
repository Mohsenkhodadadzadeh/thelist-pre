//
//  GradientBackgroundView.swift
//  TheListTest
//
//  Created by Mohsen on 1/27/22.
//

import UIKit

@IBDesignable class GradientBackgroundView: UIView {
    
    @IBInspectable var topColor: UIColor = UIColor.white
        @IBInspectable var bottomColor: UIColor = UIColor.black

        override class var layerClass: AnyClass {
            return CAGradientLayer.self
        }

        override func layoutSubviews() {
            (layer as! CAGradientLayer).colors = [topColor.cgColor, bottomColor.cgColor]
        }
    
    
}
