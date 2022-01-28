//
//  HomeVCPrepareUI.swift
//  TheListTest
//
//  Created by Mohsen on 1/27/22.
//

import UIKit
import CoreGraphics
import Glideshow

extension HomeVC {
    func setUpUI() {
        fillTopBar()
        resizeNavigationBar()
        addLogoToNavigation()
        setupCategory()
    }
    
    private func resizeNavigationBar () {
        let height: CGFloat = 100 //whatever height you want to add to the existing height
           let bounds = self.navigationController!.navigationBar.bounds
           self.navigationController?.navigationBar.frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height + height)
         
    }
    
    private func addLogoToNavigation () {
        let logoImage = UIImage.init(named: "logo")
        let logoImageView = UIImageView.init(image: logoImage)
        logoImageView.frame = CGRect(x: -40, y: 0, width: 150, height: 25)
        logoImageView.contentMode = .scaleAspectFit
        let imageItem = UIBarButtonItem.init(customView: logoImageView)
        let negativeSpacer = UIBarButtonItem.init(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        negativeSpacer.width = -25
        navigationItem.leftBarButtonItems = [negativeSpacer, imageItem]
    }
    
    private func fillTopBar() {
        let colouredTopView = UIView()
             view.addSubview(colouredTopView)
        colouredTopView.translatesAutoresizingMaskIntoConstraints = false
        colouredTopView.backgroundColor = UIColor(named: "navigation")

             NSLayoutConstraint.activate([
                colouredTopView.topAnchor.constraint(equalTo: view.topAnchor),
                colouredTopView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                colouredTopView.widthAnchor.constraint(equalTo: view.widthAnchor),
            ])
    }
    private func setupCategory() {
        setupCategoryActions()
        setupCategoryAppreance()
    }
    
    private func setupCategoryActions() {
        barsResturantView.categoryButton.addTarget(self, action: #selector(barResturantButtonPress(sender:)), for: .touchUpInside)
        liveShowView.categoryButton.addTarget(self, action: #selector(liveShowButtonPress(sender:)), for: .touchUpInside)
        clubView.categoryButton.addTarget(self, action: #selector(clubButtonPress(sender:)), for: .touchUpInside)
        beachBarView.categoryButton.addTarget(self, action: #selector(beachBarButtonPress(sender:)), for: .touchUpInside)
        
    }
    
    private func setupCategoryAppreance() {
        barsResturantView.categoryTitle.text = "Bars - Resturants"
        liveShowView.categoryTitle.text = "Live Shows"
        clubView.categoryTitle.text = "Clubs"
        beachBarView.categoryTitle.text = "Beach Bars"
        
        //barsResturantView.categoryButton.imageView?.image = UIImage(named: "rosette")
        barsResturantView.categoryButton.setImage(UIImage(systemName: "rosette"), for: .normal)
        liveShowView.categoryButton.setImage(UIImage(systemName: "music.mic"), for: .normal)
        clubView.categoryButton.setImage(UIImage(systemName: "suit.club.fill"), for: .normal)
        beachBarView.categoryButton.setImage(UIImage(systemName: "sunset.fill"), for: .normal)
        
        barsResturantView.categoryButton.shadowColorLayer = .black
        barsResturantView.categoryButton.shadowRadius = 20
        barsResturantView.categoryButton.shadowOffsetLayer = CGSize(width: 5, height: 9)
        barsResturantView.categoryButton.accessibilityIdentifier = "BarResturant"
        
        liveShowView.categoryButton.shadowColorLayer = .black
        liveShowView.categoryButton.shadowRadius = 20
        liveShowView.categoryButton.shadowOffsetLayer = CGSize(width: 5, height: 9)
        
        clubView.categoryButton.shadowColorLayer = .black
        clubView.categoryButton.shadowRadius = 20
        clubView.categoryButton.shadowOffsetLayer = CGSize(width: 5, height: 9)
        
        beachBarView.categoryButton.shadowColorLayer = .black
        beachBarView.categoryButton.shadowRadius = 20
        beachBarView.categoryButton.shadowOffsetLayer = CGSize(width: 5, height: 9)
    }
    
    
    func prepareBannerSlider(_ banners: [BannerModel]) {
        glideshow.items = []
        
        for item in banners {
            let obj = GlideItem(title: item.title , description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.", expensiveLevel: item.expensiveLevel, imageURL: item.imageAddressString)
            
            glideshow.items?.append(obj)
        }
        print("banners: \(banners.count)")
        
        glideshow.delegate = self
        glideshow.isCircular = false
        glideshow.gradientColor =
            UIColor.black.withAlphaComponent(0.7)
        glideshow.captionFont = UIFont.systemFont(ofSize: 16, weight: .light)
        glideshow.titleFont = UIFont.systemFont(ofSize: 23, weight: .black)
        glideshow.gradientHeightFactor = 0.9
        glideshow.pageIndicator = sliderPageControl
        sliderPageControl.numberOfPages = banners.count
        
        glideshow.interval = 8
        
        sliderContentView.addSubview(glideshow)
    }
    
  
}
