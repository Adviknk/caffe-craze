//
//  ViewController.swift
//  Caffe Craze
//
//  Created by Advik Nakirikanti on 5/30/20.
//  Copyright © 2020 Advik Nakirikanti. All rights reserved.
//

import UIKit
import SquareInAppPaymentsSDK

class ViewController: UIViewController
{


    var mainView = UIView()
    var dashboard = UIView()
    
    var home = UIView()
    
    var menu = UIScrollView()
    var categories = UIView()
    var hotMenu = UIScrollView()
    var coldMenu = UIScrollView()
    var bakeMenu = UIScrollView()
    var bottleMenu = UIScrollView()
    var addMenu = UIScrollView()
    var hotMenuItems = ["Hot Tea 12 oz.", "Hot Tea 16 oz.", "Hot Tea 20 oz.","Coffee 12 oz.", "Coffee 16 oz.", "Coffee 20 oz.","Latte & Cappuccino 12 oz.", "Latte & Cappuccino 16 oz.", "Latte & Cappuccino 20 oz.","Caffe Ole/Americano 12 oz.", "Caffe Ole/Americano 16 oz.", "Caffe Ole/Americano 20 oz.","Mocha/Flavored Latte 12 oz.", "Mocha/Flavored Latte 16 oz.", "Mocha/Flavored Latte 20 oz.","Chai Latte 12 oz.", "Chai Latte 16 oz.", "Chai Latte 20 oz.","Spiced Cider 12 oz.", "Spiced Cider 16 oz.", "Spiced Cider 20 oz.","Spiced Cocoa 12 oz.", "Spiced Cocoa 16 oz.", "Spiced Cocoa 20 oz.","Hot Chocolate Kids", "Hot Chocolate 12 oz.", "Hot Chocolate 16 oz.", "Hot Chocolate 20 oz.","Tea Latte 12 oz.", "Tea Latte 16 oz.", "Tea Latte 20 oz.","Espresso in ceramic cup 16 oz.", "Espresso in ceramic cup 20 oz.", "Espresso in paper cup 16 oz.", "Espresso in paper cup 20 oz."]
    var hotMenuPrices = [2.25, 2.35, 2.49, 1.93, 2.22, 2.49, 2.50, 2.75, 3.75, 3.48, 3.95, 4.48, 3.95, 4.48, 4.95, 3.40, 3.85, 4.30, 3.40, 3.85, 4.30, 3.90, 4.35, 4.80, 2.00, 2.95, 3.40, 3.91, 3.50, 3.75, 4.00, 1.95, 2.50, 1.95, 2.50]
    var coldMenuItems = ["Iced Tea", "Cold Brew/Iced Americano", "Latte/Cappuccino", "Mocha/Flavored Latte", "Iced Chai Latte", "Fruit Smoothie", "Caffe Frappe w. espresso", "Vanilla Chai Frappe"]
    var coldMenuPrices = [2.70, 3.50, 4.15, 4.65, 3.95, 5.95, 4.60, 4.30]
    var bakeMenuItems = ["Bagel + Cr. Cheese/Butter", "Butter Croissant", "Good Morn. Oats", "Breakfast Sandwich", "Fruit and Yogurt Parfait", "Frittata Bites", "Trail Mix", "Candy", "Muffin", "Cake", "Cookie", "Hot Oatmeal", "Oatmeal Topping", "Orbit Gum", "Biscotti"]
    var bakeMenuPrices = [2.75, 2.75, 3.75, 4.25, 3.75, 5.45, 2.00, 2.00, 2.75, 2.75, 2.75, 2.25, 0.60, 1.75, 1.80]
    var bottleMenuItems = ["Nantucket Nectar Juice", "Bottled Spring Water", "Sparkling Water"]
    var bottleMenuPrices = [2.55, 2.25, 2.25]
    var addMenuItems = ["Almond Milk", "Espresso Shot", "Flavored Syrup Pump", "Additional Tea Bag", "Cup of Hot Water, lid", "Cup of Cold Water, lid", "Breve Latte", "Hershey Chocolate"]
    var addMenuPrices = [0.30, 0.80, 0.20, 1.25, 1.25, 1.25, 1.00, 0.80]
    
    var cart = UIScrollView()
    var cartItems: NSArray!
    var cartPrices: NSArray!
    
    var total = 0.00
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        cartItems = [""]
        cartPrices = [0]
        
        mainView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        mainView.backgroundColor = UIColor.white
        view.addSubview(mainView)
        
        dashboard.frame = CGRect(x: 0, y: mainView.bounds.height - 88, width: mainView.bounds.width, height: 88)
        dashboard.backgroundColor = UIColor.red
        mainView.addSubview(dashboard)
        
        
        let cartBtn = UIButton()
        cartBtn.setImage(UIImage(named: "Cart"), for: .normal)
        cartBtn.translatesAutoresizingMaskIntoConstraints = false
        cartBtn.addTarget(self, action: #selector(cartBtnPressed), for: .touchUpInside)
        dashboard.addSubview(cartBtn)
        let cartBtnX = NSLayoutConstraint(item: cartBtn, attribute: .left, relatedBy: .equal, toItem: dashboard, attribute: .centerX, multiplier: 3/2, constant: 0)
        let cartBtnY = NSLayoutConstraint(item: cartBtn, attribute: .centerY, relatedBy: .equal, toItem: dashboard, attribute: .centerY, multiplier: 1, constant: -12)
        dashboard.addConstraints([cartBtnX, cartBtnY])
        
        let cartLbl = CustomLabelCC()
        cartLbl.main(title: "Cart", txtColor: UIColor.white)
        cartLbl.font = UIFont(name: "Copperplate", size: 17)
        dashboard.addSubview(cartLbl)
        let cartLblX = NSLayoutConstraint(item: cartLbl, attribute: .centerX, relatedBy: .equal, toItem: cartBtn, attribute: .centerX, multiplier: 1, constant: 0)
        let cartLblY = NSLayoutConstraint(item: cartLbl, attribute: .top, relatedBy: .equal, toItem: cartBtn, attribute: .bottom, multiplier: 1, constant: 0)
        dashboard.addConstraints([cartLblX, cartLblY])
        
        let menuBtn = UIButton()
        menuBtn.setImage(UIImage(named: "Menu"), for: .normal)
        menuBtn.translatesAutoresizingMaskIntoConstraints = false
        menuBtn.addTarget(self, action: #selector(menuBtnPressed), for: .touchUpInside)
        dashboard.addSubview(menuBtn)
        let menuBtnX = NSLayoutConstraint(item: menuBtn, attribute: .centerX, relatedBy: .equal, toItem: dashboard, attribute: .centerX, multiplier: 1, constant: 0)
        let menuBtnY = NSLayoutConstraint(item: menuBtn, attribute: .centerY, relatedBy: .equal, toItem: dashboard, attribute: .centerY, multiplier: 1, constant: -12)
        dashboard.addConstraints([menuBtnX, menuBtnY])
        let menuLbl = CustomLabelCC()
        menuLbl.main(title: "Menu", txtColor: UIColor.white)
        menuLbl.font = UIFont(name: "Copperplate", size: 17)
        dashboard.addSubview(menuLbl)
        let menuLblX = NSLayoutConstraint(item: menuLbl, attribute: .centerX, relatedBy: .equal, toItem: menuBtn, attribute: .centerX, multiplier: 1, constant: 0)
        let menuLblY = NSLayoutConstraint(item: menuLbl, attribute: .top, relatedBy: .equal, toItem: menuBtn, attribute: .bottom, multiplier: 1, constant: 0)
        dashboard.addConstraints([menuLblX, menuLblY])
        
        let homeBtn = UIButton()
        homeBtn.setImage(UIImage(named: "Home"), for: .normal)
        homeBtn.translatesAutoresizingMaskIntoConstraints = false
        homeBtn.addTarget(self, action: #selector(homeBtnPressed), for: .touchUpInside)
        dashboard.addSubview(homeBtn)
        let homeBtnX = NSLayoutConstraint(item: homeBtn, attribute: .right, relatedBy: .equal, toItem: dashboard, attribute: .centerX, multiplier: 1/2, constant: 0)
        let homeBtnY = NSLayoutConstraint(item: homeBtn, attribute: .centerY, relatedBy: .equal, toItem: dashboard, attribute: .centerY, multiplier: 1, constant: -12)
        dashboard.addConstraints([homeBtnX, homeBtnY])
        let homeLbl = CustomLabelCC()
        homeLbl.main(title: "Home", txtColor: UIColor.white)
        homeLbl.font = UIFont(name: "Copperplate", size: 17)
        dashboard.addSubview(homeLbl)
        let homeLblX = NSLayoutConstraint(item: homeLbl, attribute: .centerX, relatedBy: .equal, toItem: homeBtn, attribute: .centerX, multiplier: 1, constant: 0)
        let homeLblY = NSLayoutConstraint(item: homeLbl, attribute: .top, relatedBy: .equal, toItem: homeBtn, attribute: .bottom, multiplier: 1, constant: 0)
        dashboard.addConstraints([homeLblX, homeLblY])
        
        home.isHidden = false
        home.frame = CGRect(x: 0, y: 0, width: mainView.bounds.width, height: mainView.bounds.height - 88)
        home.backgroundColor = UIColor.white
        mainView.addSubview(home)
        

        cart.isHidden = true
        mainView.isHidden = false
        menu.isHidden = true
        home.isHidden = false
        categories.isHidden = true
        
        
        homeBtnPressed()
    }

    @objc func homeBtnPressed()
    {
        home.isHidden = false
        home.frame = CGRect(x: 0, y: 0, width: mainView.bounds.width, height: mainView.bounds.height - 88)
        home.backgroundColor = UIColor.white
        mainView.addSubview(home)
        
        
        let logo = UIImageView(image: UIImage(named: "icon"))
        logo.translatesAutoresizingMaskIntoConstraints = false
        home.addSubview(logo)
        let logoX = NSLayoutConstraint(item: logo, attribute: .centerX, relatedBy: .equal, toItem: home, attribute: .centerX, multiplier: 1, constant: 0)
        let logoY = NSLayoutConstraint(item: logo, attribute: .centerY, relatedBy: .equal, toItem: home, attribute: .centerY, multiplier: 1, constant: 0)
        home.addConstraints([logoX, logoY])
        
        let location = CustomLabelCC()
        location.main(title: "13 West King St.\nMalvern, PA 19355\n610-644-0829", txtColor: UIColor.black)
        location.numberOfLines = 3
        location.textAlignment = .center
        location.font = UIFont(name: "Arial", size: home.frame.width/15)
        home.addSubview(location)
        let locationX = NSLayoutConstraint(item: location, attribute: .centerX, relatedBy: .equal, toItem: home, attribute: .centerX, multiplier: 1, constant: 0)
        let locationY = NSLayoutConstraint(item: location, attribute: .bottom, relatedBy: .equal, toItem: logo, attribute: .top, multiplier: 1, constant: -10)
        home.addConstraints([locationX, locationY])
        
        let welcomeLbl = CustomLabelCC()
        welcomeLbl.main(title: "Caffe Craze", txtColor: UIColor.black)
        welcomeLbl.font = UIFont(name: "Arial Rounded MT Bold", size: home.frame.width/10)
        home.addSubview(welcomeLbl)
        let welcomeLblX = NSLayoutConstraint(item: welcomeLbl, attribute: .centerX, relatedBy: .equal, toItem: home, attribute: .centerX, multiplier: 1, constant: 0)
        let welcomeLblY = NSLayoutConstraint(item: welcomeLbl, attribute: .bottom, relatedBy: .equal, toItem: location, attribute: .top, multiplier: 1, constant: 0)
        home.addConstraints([welcomeLblX, welcomeLblY])

        
        let findUs = CustomLabelCC()
        findUs.main(title: "Instagram:\n@CaffeCraze\nFacebook:\n@CaffeCraze\nWebsite:\ncaffecraze.com", txtColor: UIColor.black)
        findUs.numberOfLines = 6
        findUs.font = UIFont(name: "Arial", size: home.frame.width/15 )
        home.addSubview(findUs)
        let findUsX = NSLayoutConstraint(item: findUs, attribute: .centerX, relatedBy: .equal, toItem: home, attribute: .centerX, multiplier: 1, constant: 0)
        let findUsY = NSLayoutConstraint(item: findUs, attribute: .top, relatedBy: .equal, toItem: logo, attribute: .bottom, multiplier: 1, constant: 10)
        home.addConstraints([findUsX, findUsY])
    }
    
    @objc func menuBtnPressed()
    {
        menu.isHidden = false
        menu.frame = CGRect(x: 0, y: 0, width: mainView.bounds.width, height: mainView.bounds.height - 88)
        menu.contentSize = CGSize(width: mainView.bounds.width, height: mainView.bounds.height - 88 + 0)
        menu.backgroundColor = UIColor.white
        mainView.addSubview(menu)
        
        let subviews = self.menu.subviews
        for subview in subviews
        {
            subview.removeFromSuperview()
        }
        
        let welcomeLbl = CustomLabelCC()
        welcomeLbl.main(title: "Caffe Craze Menu", txtColor: UIColor.black)
        welcomeLbl.font = UIFont(name: "Arial Rounded MT Bold", size: menu.frame.width/9)
        menu.addSubview(welcomeLbl)
        let welcomeLblX = NSLayoutConstraint(item: welcomeLbl, attribute: .centerX, relatedBy: .equal, toItem: menu, attribute: .centerX, multiplier: 1, constant: 0)
        let welcomeLblY = NSLayoutConstraint(item: welcomeLbl, attribute: .centerY, relatedBy: .equal, toItem: menu, attribute: .centerY, multiplier: 1/2, constant: 0)
        menu.addConstraints([welcomeLblX, welcomeLblY])
        
        let logo = UIImageView(image: UIImage(named: "icon"))
        logo.translatesAutoresizingMaskIntoConstraints = false
        menu.addSubview(logo)
        let logoX = NSLayoutConstraint(item: logo, attribute: .centerX, relatedBy: .equal, toItem: menu, attribute: .centerX, multiplier: 1, constant: 0)
        let logoY = NSLayoutConstraint(item: logo, attribute: .centerY, relatedBy: .equal, toItem: menu, attribute: .centerY, multiplier: 1, constant: 0)
        menu.addConstraints([logoX, logoY])
        
        categories.isHidden = false
        categories.frame = CGRect(x: 0, y: mainView.bounds.height - 90, width: mainView.bounds.width, height: 150)
        categories.backgroundColor = UIColor.darkGray
        menu.addSubview(categories)
        
        let hot = CustomButtonCC()
        hot.main(title: "Hot Drinks", titleColor: UIColor.white, backColor: UIColor.clear, bordColor: UIColor.black.cgColor, bordW: 1, width: mainView.frame.width, height: 30)
        hot.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        hot.addTarget(self, action: #selector(hotPressed), for: .touchUpInside)
        categories.addSubview(hot)
        let hotX = NSLayoutConstraint(item: hot, attribute: .centerX, relatedBy: .equal, toItem: categories, attribute: .centerX, multiplier: 1, constant: 0)
        let hotY = NSLayoutConstraint(item: hot, attribute: .top, relatedBy: .equal, toItem: categories, attribute: .top, multiplier: 1, constant: 0)
        categories.addConstraints([hotX, hotY])
        
        let cold = CustomButtonCC()
        cold.main(title: "Cold Drinks", titleColor: UIColor.white, backColor: UIColor.clear, bordColor: UIColor.black.cgColor, bordW: 1, width: mainView.frame.width, height: 30)
        cold.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        cold.addTarget(self, action: #selector(coldPressed), for: .touchUpInside)
        categories.addSubview(cold)
        let coldX = NSLayoutConstraint(item: cold, attribute: .centerX, relatedBy: .equal, toItem: categories, attribute: .centerX, multiplier: 1, constant: 0)
        let coldY = NSLayoutConstraint(item: cold, attribute: .top, relatedBy: .equal, toItem: hot, attribute: .bottom, multiplier: 1, constant: 0)
        categories.addConstraints([coldX, coldY])
        
        let bake = CustomButtonCC()
        bake.main(title: "Bakery & Treats", titleColor: UIColor.white, backColor: UIColor.clear, bordColor: UIColor.black.cgColor, bordW: 1, width: mainView.frame.width, height: 30)
        bake.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        bake.addTarget(self, action: #selector(bakePressed), for: .touchUpInside)
        categories.addSubview(bake)
        let bakeX = NSLayoutConstraint(item: bake, attribute: .centerX, relatedBy: .equal, toItem: categories, attribute: .centerX, multiplier: 1, constant: 0)
        let bakeY = NSLayoutConstraint(item: bake, attribute: .top, relatedBy: .equal, toItem: cold, attribute: .bottom, multiplier: 1, constant: 0)
        categories.addConstraints([bakeX, bakeY])
        
        let bottle = CustomButtonCC()
        bottle.main(title: "Bottles", titleColor: UIColor.white, backColor: UIColor.clear, bordColor: UIColor.black.cgColor, bordW: 1, width: mainView.frame.width, height: 30)
        bottle.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        bottle.addTarget(self, action: #selector(bottlePressed), for: .touchUpInside)
        categories.addSubview(bottle)
        let bottleX = NSLayoutConstraint(item: bottle, attribute: .centerX, relatedBy: .equal, toItem: categories, attribute: .centerX, multiplier: 1, constant: 0)
        let bottleY = NSLayoutConstraint(item: bottle, attribute: .top, relatedBy: .equal, toItem: bake, attribute: .bottom, multiplier: 1, constant: 0)
        categories.addConstraints([bottleX, bottleY])
        
        let add = CustomButtonCC()
        add.main(title: "Drink Add-Ons & Cups", titleColor: UIColor.white, backColor: UIColor.clear, bordColor: UIColor.black.cgColor, bordW: 1, width: mainView.frame.width, height: 30)
        add.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        add.addTarget(self, action: #selector(addPressed), for: .touchUpInside)
        categories.addSubview(add)
        let addX = NSLayoutConstraint(item: add, attribute: .centerX, relatedBy: .equal, toItem: categories, attribute: .centerX, multiplier: 1, constant: 0)
        let addY = NSLayoutConstraint(item: add, attribute: .top, relatedBy: .equal, toItem: bottle, attribute: .bottom, multiplier: 1, constant: 0)
        categories.addConstraints([addX, addY])
        
        
        
        UIView.animate(withDuration: 1, animations:{
            self.categories.frame = CGRect(x: 0, y: self.mainView.bounds.height - 88 - 150, width: self.mainView.bounds.width, height: 150)
        }) { (finished) in
            
        }
        
        hotMenu.isHidden = false
        coldMenu.isHidden = false
        bakeMenu.isHidden = false
        bottleMenu.isHidden = false
        addMenu.isHidden = false
    }
    @objc func hotPressed()
    {
        hotMenu.isHidden = false
        hotMenu.frame = CGRect(x: 0, y: 0, width: mainView.bounds.width, height: mainView.bounds.height - 88)
        hotMenu.contentSize = CGSize(width: mainView.bounds.width, height: mainView.bounds.height - 88 + 0)
        hotMenu.backgroundColor = UIColor.white
        menu.addSubview(hotMenu)
        
        let welcomeLbl = CustomLabelCC()
        welcomeLbl.main(title: "Hot Drinks", txtColor: UIColor.black)
        welcomeLbl.font = UIFont(name: "Hoefler Text", size: menu.frame.width/9)
        hotMenu.addSubview(welcomeLbl)
        let welcomeLblX = NSLayoutConstraint(item: welcomeLbl, attribute: .centerX, relatedBy: .equal, toItem: hotMenu, attribute: .centerX, multiplier: 1, constant: 0)
        let welcomeLblY = NSLayoutConstraint(item: welcomeLbl, attribute: .centerY, relatedBy: .equal, toItem: hotMenu, attribute: .centerY, multiplier: 1/5, constant: 0)
        hotMenu.addConstraints([welcomeLblX, welcomeLblY])
        
        var i = 1
        var index = 0
        var num = Int(view.bounds.height/7) + 20
        
        for x in hotMenuItems
        {
            
            let item = UILabel()
            item.translatesAutoresizingMaskIntoConstraints = false
            item.layer.masksToBounds = true
            item.backgroundColor = UIColor.red
            item.layer.cornerRadius = 35
            item.heightAnchor.constraint(equalToConstant: view.bounds.height/7).isActive = true
            item.widthAnchor.constraint(equalToConstant: view.bounds.width - 50).isActive = true
            item.text = x
            item.textAlignment = .center
            item.font = UIFont(name: "Hoefler Text", size: view.bounds.height/31.866)
            hotMenu.addSubview(item)
            let itemX = NSLayoutConstraint(item: item, attribute: .centerX, relatedBy: .equal, toItem: hotMenu, attribute: .centerX, multiplier: 1, constant: 0)
            let itemY = NSLayoutConstraint(item: item, attribute: .top, relatedBy: .equal, toItem: hotMenu, attribute: .top, multiplier: 1, constant: CGFloat(num))
            hotMenu.addConstraints([itemX, itemY])
            
            let price = UILabel()
            price.backgroundColor = UIColor.clear
            price.translatesAutoresizingMaskIntoConstraints = false
            price.text = String(format:"$%.2f", hotMenuPrices[index])
            price.font = UIFont(name: "Copperplate", size: view.bounds.height/29.866)
            hotMenu.addSubview(price)
            let priceX = NSLayoutConstraint(item: price, attribute: .left, relatedBy: .equal, toItem: item, attribute: .left, multiplier: 1, constant: 15)
            let priceY = NSLayoutConstraint(item: price, attribute: .top, relatedBy: .equal, toItem: item, attribute: .top, multiplier: 1, constant: 15)
            hotMenu.addConstraints([priceX, priceY])
            
            let addBtn = UIButton()
            addBtn.setImage(UIImage(named: "plusLogo"), for: .normal)
            addBtn.translatesAutoresizingMaskIntoConstraints = false
            addBtn.tag = index
            addBtn.addTarget(self, action: #selector(addHotToCart), for: .touchUpInside)
            hotMenu.addSubview(addBtn)
            let addBtnX = NSLayoutConstraint(item: addBtn, attribute: .right, relatedBy: .equal, toItem: item, attribute: .right, multiplier: 1, constant: -15)
            let addBtnY = NSLayoutConstraint(item: addBtn, attribute: .bottom, relatedBy: .equal, toItem: item, attribute: .bottom, multiplier: 1, constant: -15)
            hotMenu.addConstraints([addBtnX, addBtnY])
            
            let addItem = UILabel()
            addItem.backgroundColor = UIColor.clear
            addItem.translatesAutoresizingMaskIntoConstraints = false
            addItem.text = "Add to Cart"
            addItem.font = UIFont(name: "Copperplate", size: view.bounds.height/29.866)
            hotMenu.addSubview(addItem)
            let addItemX = NSLayoutConstraint(item: addItem, attribute: .right, relatedBy: .equal, toItem: addBtn, attribute: .left, multiplier: 1, constant: -10)
            let addItemY = NSLayoutConstraint(item: addItem, attribute: .bottom, relatedBy: .equal, toItem: addBtn, attribute: .bottom, multiplier: 1, constant: 0)
            hotMenu.addConstraints([addItemX, addItemY])
            
            
            hotMenu.contentSize = CGSize(width: menu.bounds.width, height: menu.bounds.height - 88 + CGFloat(150 * i))
            
            num = num + Int(view.bounds.height/7) + 30
            i = i + 1
            index = index + 1
        }
    }
    
    @objc func coldPressed()
    {
        coldMenu.isHidden = false
        coldMenu.frame = CGRect(x: 0, y: 0, width: mainView.bounds.width, height: mainView.bounds.height - 88)
        coldMenu.contentSize = CGSize(width: mainView.bounds.width, height: mainView.bounds.height - 88 + 0)
        coldMenu.backgroundColor = UIColor.white
        menu.addSubview(coldMenu)
        
        let welcomeLbl = CustomLabelCC()
        welcomeLbl.main(title: "Cold Drinks", txtColor: UIColor.black)
        welcomeLbl.font = UIFont(name: "Hoefler Text", size: menu.frame.width/9)
        coldMenu.addSubview(welcomeLbl)
        let welcomeLblX = NSLayoutConstraint(item: welcomeLbl, attribute: .centerX, relatedBy: .equal, toItem: coldMenu, attribute: .centerX, multiplier: 1, constant: 0)
        let welcomeLblY = NSLayoutConstraint(item: welcomeLbl, attribute: .centerY, relatedBy: .equal, toItem: coldMenu, attribute: .centerY, multiplier: 1/5, constant: 0)
        coldMenu.addConstraints([welcomeLblX, welcomeLblY])
        
        var i = 1
        var index = 0
        var num = Int(view.bounds.height/7) + 20
        
        for x in coldMenuItems
        {
            
            let item = UILabel()
            item.translatesAutoresizingMaskIntoConstraints = false
            item.layer.masksToBounds = true
            item.backgroundColor = UIColor.red
            item.layer.cornerRadius = 35
            item.heightAnchor.constraint(equalToConstant: view.bounds.height/7).isActive = true
            item.widthAnchor.constraint(equalToConstant: view.bounds.width - 50).isActive = true
            item.text = x
            item.textAlignment = .center
            item.font = UIFont(name: "Hoefler Text", size: view.bounds.height/29.866)
            coldMenu.addSubview(item)
            let itemX = NSLayoutConstraint(item: item, attribute: .centerX, relatedBy: .equal, toItem: coldMenu, attribute: .centerX, multiplier: 1, constant: 0)
            let itemY = NSLayoutConstraint(item: item, attribute: .top, relatedBy: .equal, toItem: coldMenu, attribute: .top, multiplier: 1, constant: CGFloat(num))
            coldMenu.addConstraints([itemX, itemY])
            
            let price = UILabel()
            price.backgroundColor = UIColor.clear
            price.translatesAutoresizingMaskIntoConstraints = false
            price.text = String(format:"$%.2f", coldMenuPrices[index])
            price.font = UIFont(name: "Copperplate", size: view.bounds.height/29.866)
            coldMenu.addSubview(price)
            let priceX = NSLayoutConstraint(item: price, attribute: .left, relatedBy: .equal, toItem: item, attribute: .left, multiplier: 1, constant: 15)
            let priceY = NSLayoutConstraint(item: price, attribute: .top, relatedBy: .equal, toItem: item, attribute: .top, multiplier: 1, constant: 15)
            coldMenu.addConstraints([priceX, priceY])
            
            let addBtn = UIButton()
            addBtn.setImage(UIImage(named: "plusLogo"), for: .normal)
            addBtn.translatesAutoresizingMaskIntoConstraints = false
            addBtn.tag = index
            addBtn.addTarget(self, action: #selector(addColdToCart), for: .touchUpInside)
            coldMenu.addSubview(addBtn)
            let addBtnX = NSLayoutConstraint(item: addBtn, attribute: .right, relatedBy: .equal, toItem: item, attribute: .right, multiplier: 1, constant: -15)
            let addBtnY = NSLayoutConstraint(item: addBtn, attribute: .bottom, relatedBy: .equal, toItem: item, attribute: .bottom, multiplier: 1, constant: -15)
            coldMenu.addConstraints([addBtnX, addBtnY])
            
            let addItem = UILabel()
            addItem.backgroundColor = UIColor.clear
            addItem.translatesAutoresizingMaskIntoConstraints = false
            addItem.text = "Add to Cart"
            addItem.font = UIFont(name: "Copperplate", size: view.bounds.height/29.866)
            coldMenu.addSubview(addItem)
            let addItemX = NSLayoutConstraint(item: addItem, attribute: .right, relatedBy: .equal, toItem: addBtn, attribute: .left, multiplier: 1, constant: -10)
            let addItemY = NSLayoutConstraint(item: addItem, attribute: .bottom, relatedBy: .equal, toItem: addBtn, attribute: .bottom, multiplier: 1, constant: 0)
            coldMenu.addConstraints([addItemX, addItemY])
            
            
            coldMenu.contentSize = CGSize(width: menu.bounds.width, height: menu.bounds.height - 88 + CGFloat(125 * i))
            
            num = num + Int(view.bounds.height/7) + 30
            i = i + 1
            index = index + 1
        }
    }
    
    @objc func bakePressed()
    {
        bakeMenu.isHidden = false
        bakeMenu.frame = CGRect(x: 0, y: 0, width: mainView.bounds.width, height: mainView.bounds.height - 88)
        bakeMenu.contentSize = CGSize(width: mainView.bounds.width, height: mainView.bounds.height - 88 + 0)
        bakeMenu.backgroundColor = UIColor.white
        menu.addSubview(bakeMenu)
        
        let welcomeLbl = CustomLabelCC()
        welcomeLbl.main(title: "Bakery & Treats", txtColor: UIColor.black)
        welcomeLbl.font = UIFont(name: "Hoefler Text", size: menu.frame.width/9)
        bakeMenu.addSubview(welcomeLbl)
        let welcomeLblX = NSLayoutConstraint(item: welcomeLbl, attribute: .centerX, relatedBy: .equal, toItem: bakeMenu, attribute: .centerX, multiplier: 1, constant: 0)
        let welcomeLblY = NSLayoutConstraint(item: welcomeLbl, attribute: .centerY, relatedBy: .equal, toItem: bakeMenu, attribute: .centerY, multiplier: 1/5, constant: 0)
        bakeMenu.addConstraints([welcomeLblX, welcomeLblY])
        
        var i = 1
        var index = 0
        var num = Int(view.bounds.height/7) + 20
        
        for x in bakeMenuItems
        {
            
            let item = UILabel()
            item.translatesAutoresizingMaskIntoConstraints = false
            item.layer.masksToBounds = true
            item.backgroundColor = UIColor.red
            item.layer.cornerRadius = 35
            item.heightAnchor.constraint(equalToConstant: view.bounds.height/7).isActive = true
            item.widthAnchor.constraint(equalToConstant: view.bounds.width - 50).isActive = true
            item.text = x
            item.textAlignment = .center
            item.font = UIFont(name: "Hoefler Text", size: view.bounds.height/29.866)
            bakeMenu.addSubview(item)
            let itemX = NSLayoutConstraint(item: item, attribute: .centerX, relatedBy: .equal, toItem: bakeMenu, attribute: .centerX, multiplier: 1, constant: 0)
            let itemY = NSLayoutConstraint(item: item, attribute: .top, relatedBy: .equal, toItem: bakeMenu, attribute: .top, multiplier: 1, constant: CGFloat(num))
            bakeMenu.addConstraints([itemX, itemY])
            
            let price = UILabel()
            price.backgroundColor = UIColor.clear
            price.translatesAutoresizingMaskIntoConstraints = false
            price.text = String(format:"$%.2f", bakeMenuPrices[index])
            price.font = UIFont(name: "Copperplate", size: view.bounds.height/29.866)
            bakeMenu.addSubview(price)
            let priceX = NSLayoutConstraint(item: price, attribute: .left, relatedBy: .equal, toItem: item, attribute: .left, multiplier: 1, constant: 15)
            let priceY = NSLayoutConstraint(item: price, attribute: .top, relatedBy: .equal, toItem: item, attribute: .top, multiplier: 1, constant: 15)
            bakeMenu.addConstraints([priceX, priceY])
            
            let addBtn = UIButton()
            addBtn.setImage(UIImage(named: "plusLogo"), for: .normal)
            addBtn.translatesAutoresizingMaskIntoConstraints = false
            addBtn.tag = index
            addBtn.addTarget(self, action: #selector(addBakeToCart), for: .touchUpInside)
            bakeMenu.addSubview(addBtn)
            let addBtnX = NSLayoutConstraint(item: addBtn, attribute: .right, relatedBy: .equal, toItem: item, attribute: .right, multiplier: 1, constant: -15)
            let addBtnY = NSLayoutConstraint(item: addBtn, attribute: .bottom, relatedBy: .equal, toItem: item, attribute: .bottom, multiplier: 1, constant: -15)
            bakeMenu.addConstraints([addBtnX, addBtnY])
            
            let addItem = UILabel()
            addItem.backgroundColor = UIColor.clear
            addItem.translatesAutoresizingMaskIntoConstraints = false
            addItem.text = "Add to Cart"
            addItem.font = UIFont(name: "Copperplate", size: view.bounds.height/29.866)
            bakeMenu.addSubview(addItem)
            let addItemX = NSLayoutConstraint(item: addItem, attribute: .right, relatedBy: .equal, toItem: addBtn, attribute: .left, multiplier: 1, constant: -10)
            let addItemY = NSLayoutConstraint(item: addItem, attribute: .bottom, relatedBy: .equal, toItem: addBtn, attribute: .bottom, multiplier: 1, constant: 0)
            bakeMenu.addConstraints([addItemX, addItemY])
            
            
            bakeMenu.contentSize = CGSize(width: menu.bounds.width, height: menu.bounds.height - 88 + CGFloat(125 * i))
            
            num = num + Int(view.bounds.height/7) + 30
            i = i + 1
            index = index + 1
        }
    }
    
    @objc func bottlePressed()
    {
        bottleMenu.isHidden = false
        bottleMenu.frame = CGRect(x: 0, y: 0, width: mainView.bounds.width, height: mainView.bounds.height - 88)
        bottleMenu.contentSize = CGSize(width: mainView.bounds.width, height: mainView.bounds.height - 88 + 0)
        bottleMenu.backgroundColor = UIColor.white
        menu.addSubview(bottleMenu)
        
        let welcomeLbl = CustomLabelCC()
        welcomeLbl.main(title: "Bottles", txtColor: UIColor.black)
        welcomeLbl.font = UIFont(name: "Hoefler Text", size: menu.frame.width/9)
        bottleMenu.addSubview(welcomeLbl)
        let welcomeLblX = NSLayoutConstraint(item: welcomeLbl, attribute: .centerX, relatedBy: .equal, toItem: bottleMenu, attribute: .centerX, multiplier: 1, constant: 0)
        let welcomeLblY = NSLayoutConstraint(item: welcomeLbl, attribute: .centerY, relatedBy: .equal, toItem: bottleMenu, attribute: .centerY, multiplier: 1/5, constant: 0)
        bottleMenu.addConstraints([welcomeLblX, welcomeLblY])
        
        var i = 1
        var index = 0
        var num = Int(view.bounds.height/7) + 20
        
        for x in bottleMenuItems
        {
            
            let item = UILabel()
            item.translatesAutoresizingMaskIntoConstraints = false
            item.layer.masksToBounds = true
            item.backgroundColor = UIColor.red
            item.layer.cornerRadius = 35
            item.heightAnchor.constraint(equalToConstant: view.bounds.height/7).isActive = true
            item.widthAnchor.constraint(equalToConstant: view.bounds.width - 50).isActive = true
            item.text = x
            item.textAlignment = .center
            item.font = UIFont(name: "Hoefler Text", size: view.bounds.height/29.866)
            bottleMenu.addSubview(item)
            let itemX = NSLayoutConstraint(item: item, attribute: .centerX, relatedBy: .equal, toItem: bottleMenu, attribute: .centerX, multiplier: 1, constant: 0)
            let itemY = NSLayoutConstraint(item: item, attribute: .top, relatedBy: .equal, toItem: bottleMenu, attribute: .top, multiplier: 1, constant: CGFloat(num))
            bottleMenu.addConstraints([itemX, itemY])
            
            let price = UILabel()
            price.backgroundColor = UIColor.clear
            price.translatesAutoresizingMaskIntoConstraints = false
            price.text = String(format:"$%.2f", bottleMenuPrices[index])
            price.font = UIFont(name: "Copperplate", size: view.bounds.height/29.866)
            bottleMenu.addSubview(price)
            let priceX = NSLayoutConstraint(item: price, attribute: .left, relatedBy: .equal, toItem: item, attribute: .left, multiplier: 1, constant: 15)
            let priceY = NSLayoutConstraint(item: price, attribute: .top, relatedBy: .equal, toItem: item, attribute: .top, multiplier: 1, constant: 15)
            bottleMenu.addConstraints([priceX, priceY])
            
            let addBtn = UIButton()
            addBtn.setImage(UIImage(named: "plusLogo"), for: .normal)
            addBtn.translatesAutoresizingMaskIntoConstraints = false
            addBtn.tag = index
            addBtn.addTarget(self, action: #selector(addBottleToCart), for: .touchUpInside)
            bottleMenu.addSubview(addBtn)
            let addBtnX = NSLayoutConstraint(item: addBtn, attribute: .right, relatedBy: .equal, toItem: item, attribute: .right, multiplier: 1, constant: -15)
            let addBtnY = NSLayoutConstraint(item: addBtn, attribute: .bottom, relatedBy: .equal, toItem: item, attribute: .bottom, multiplier: 1, constant: -15)
            bottleMenu.addConstraints([addBtnX, addBtnY])
            
            let addItem = UILabel()
            addItem.backgroundColor = UIColor.clear
            addItem.translatesAutoresizingMaskIntoConstraints = false
            addItem.text = "Add to Cart"
            addItem.font = UIFont(name: "Copperplate", size: view.bounds.height/29.866)
            bottleMenu.addSubview(addItem)
            let addItemX = NSLayoutConstraint(item: addItem, attribute: .right, relatedBy: .equal, toItem: addBtn, attribute: .left, multiplier: 1, constant: -10)
            let addItemY = NSLayoutConstraint(item: addItem, attribute: .bottom, relatedBy: .equal, toItem: addBtn, attribute: .bottom, multiplier: 1, constant: 0)
            bottleMenu.addConstraints([addItemX, addItemY])
            
            
            bottleMenu.contentSize = CGSize(width: menu.bounds.width, height: menu.bounds.height - 88 + CGFloat(125 * i))
            
            num = num + Int(view.bounds.height/7) + 30
            i = i + 1
            index = index + 1
        }
    }
    
    @objc func addPressed()
    {
        addMenu.isHidden = false
        addMenu.frame = CGRect(x: 0, y: 0, width: mainView.bounds.width, height: mainView.bounds.height - 88)
        addMenu.contentSize = CGSize(width: mainView.bounds.width, height: mainView.bounds.height - 88 + 0)
        addMenu.backgroundColor = UIColor.white
        menu.addSubview(addMenu)
        
        let welcomeLbl = CustomLabelCC()
        welcomeLbl.main(title: "Drink Add-Ons & Cups", txtColor: UIColor.black)
        welcomeLbl.font = UIFont(name: "Hoefler Text", size: menu.frame.width/11.5)
        addMenu.addSubview(welcomeLbl)
        let welcomeLblX = NSLayoutConstraint(item: welcomeLbl, attribute: .centerX, relatedBy: .equal, toItem: addMenu, attribute: .centerX, multiplier: 1, constant: 0)
        let welcomeLblY = NSLayoutConstraint(item: welcomeLbl, attribute: .centerY, relatedBy: .equal, toItem: addMenu, attribute: .centerY, multiplier: 1/5, constant: 0)
        addMenu.addConstraints([welcomeLblX, welcomeLblY])
        
        var i = 1
        var index = 0
        var num = Int(view.bounds.height/7) + 20
        
        for x in addMenuItems
        {
            
            let item = UILabel()
            item.translatesAutoresizingMaskIntoConstraints = false
            item.layer.masksToBounds = true
            item.backgroundColor = UIColor.red
            item.layer.cornerRadius = 35
            item.heightAnchor.constraint(equalToConstant: view.bounds.height/7).isActive = true
            item.widthAnchor.constraint(equalToConstant: view.bounds.width - 50).isActive = true
            item.text = x
            item.textAlignment = .center
            item.font = UIFont(name: "Hoefler Text", size: view.bounds.height/29.866)
            addMenu.addSubview(item)
            let itemX = NSLayoutConstraint(item: item, attribute: .centerX, relatedBy: .equal, toItem: addMenu, attribute: .centerX, multiplier: 1, constant: 0)
            let itemY = NSLayoutConstraint(item: item, attribute: .top, relatedBy: .equal, toItem: addMenu, attribute: .top, multiplier: 1, constant: CGFloat(num))
            addMenu.addConstraints([itemX, itemY])
            
            let price = UILabel()
            price.backgroundColor = UIColor.clear
            price.translatesAutoresizingMaskIntoConstraints = false
            price.text = String(format:"$%.2f", addMenuPrices[index])
            price.font = UIFont(name: "Copperplate", size: view.bounds.height/29.866)
            addMenu.addSubview(price)
            let priceX = NSLayoutConstraint(item: price, attribute: .left, relatedBy: .equal, toItem: item, attribute: .left, multiplier: 1, constant: 15)
            let priceY = NSLayoutConstraint(item: price, attribute: .top, relatedBy: .equal, toItem: item, attribute: .top, multiplier: 1, constant: 15)
            addMenu.addConstraints([priceX, priceY])
            
            let addBtn = UIButton()
            addBtn.setImage(UIImage(named: "plusLogo"), for: .normal)
            addBtn.translatesAutoresizingMaskIntoConstraints = false
            addBtn.tag = index
            addBtn.addTarget(self, action: #selector(addAddToCart), for: .touchUpInside)
            addMenu.addSubview(addBtn)
            let addBtnX = NSLayoutConstraint(item: addBtn, attribute: .right, relatedBy: .equal, toItem: item, attribute: .right, multiplier: 1, constant: -15)
            let addBtnY = NSLayoutConstraint(item: addBtn, attribute: .bottom, relatedBy: .equal, toItem: item, attribute: .bottom, multiplier: 1, constant: -15)
            addMenu.addConstraints([addBtnX, addBtnY])
            
            let addItem = UILabel()
            addItem.backgroundColor = UIColor.clear
            addItem.translatesAutoresizingMaskIntoConstraints = false
            addItem.text = "Add to Cart"
            addItem.font = UIFont(name: "Copperplate", size: view.bounds.height/29.866)
            addMenu.addSubview(addItem)
            let addItemX = NSLayoutConstraint(item: addItem, attribute: .right, relatedBy: .equal, toItem: addBtn, attribute: .left, multiplier: 1, constant: -10)
            let addItemY = NSLayoutConstraint(item: addItem, attribute: .bottom, relatedBy: .equal, toItem: addBtn, attribute: .bottom, multiplier: 1, constant: 0)
            addMenu.addConstraints([addItemX, addItemY])
            
            
            addMenu.contentSize = CGSize(width: menu.bounds.width, height: menu.bounds.height - 88 + CGFloat(125 * i))
            
            num = num + Int(view.bounds.height/7) + 30
            i = i + 1
            index = index + 1
        }
    }
    
    @objc func addHotToCart(_ sender: UIButton)
    {
        cartItems = cartItems.adding(hotMenuItems[sender.tag]) as NSArray
        cartPrices = cartPrices.adding(hotMenuPrices[sender.tag]) as NSArray
    }
    
    @objc func addColdToCart(_ sender: UIButton)
    {
        cartItems = cartItems.adding(coldMenuItems[sender.tag]) as NSArray
        cartPrices = cartPrices.adding(coldMenuPrices[sender.tag]) as NSArray
    }
    
    @objc func addBakeToCart(_ sender: UIButton)
    {
        cartItems = cartItems.adding(bakeMenuItems[sender.tag]) as NSArray
        cartPrices = cartPrices.adding(bakeMenuPrices[sender.tag]) as NSArray
    }
    
    @objc func addBottleToCart(_ sender: UIButton)
    {
        cartItems = cartItems.adding(bottleMenuItems[sender.tag]) as NSArray
        cartPrices = cartPrices.adding(bottleMenuPrices[sender.tag]) as NSArray
    }
    
    @objc func addAddToCart(_ sender: UIButton)
    {
        cartItems = cartItems.adding(addMenuItems[sender.tag]) as NSArray
        cartPrices = cartPrices.adding(addMenuPrices[sender.tag]) as NSArray
    }
    
    @objc func cartBtnPressed()
    {
        cart.isHidden = false
        cart.frame = CGRect(x: 0, y: 0, width: mainView.bounds.width, height: mainView.bounds.height - 88)
        cart.backgroundColor = UIColor.white
        mainView.addSubview(cart)
        
        let subviews = self.cart.subviews
        for subview in subviews
        {
            subview.removeFromSuperview()
        }
        
        let welcomeLbl = CustomLabelCC()
        welcomeLbl.main(title: "Cart", txtColor: UIColor.black)
        welcomeLbl.font = UIFont(name: "Arial Rounded MT Bold", size: cart.frame.width/10)
        cart.addSubview(welcomeLbl)
        let welcomeLblX = NSLayoutConstraint(item: welcomeLbl, attribute: .centerX, relatedBy: .equal, toItem: cart, attribute: .centerX, multiplier: 1, constant: 0)
        let welcomeLblY = NSLayoutConstraint(item: welcomeLbl, attribute: .bottom, relatedBy: .equal, toItem: cart, attribute: .centerY, multiplier: 1/4, constant: 0)
        cart.addConstraints([welcomeLblX, welcomeLblY])
        
        let checkoutBox = UILabel()
        checkoutBox.translatesAutoresizingMaskIntoConstraints = false
        checkoutBox.backgroundColor = UIColor.white
        checkoutBox.layer.borderWidth = 3
        checkoutBox.layer.borderColor = UIColor.black.cgColor
        checkoutBox.heightAnchor.constraint(equalToConstant: view.bounds.height/2.5).isActive = true
        checkoutBox.widthAnchor.constraint(equalToConstant:view.bounds.width/2).isActive = true
        cart.addSubview(checkoutBox)
        let checkoutBoxX = NSLayoutConstraint(item: checkoutBox, attribute: .centerX, relatedBy: .equal, toItem: cart, attribute: .centerX, multiplier: 3/2, constant: 12)
        let checkoutBoxY = NSLayoutConstraint(item: checkoutBox, attribute: .top, relatedBy: .equal, toItem: welcomeLbl, attribute: .bottom, multiplier: 1, constant: 50)
        cart.addConstraints([checkoutBoxX, checkoutBoxY])
        
        var subtotal = 0.00
        for x in 1..<cartPrices.count
        {
            subtotal = subtotal + (cartPrices[x] as! Double)
        }
        let subtotalLbl = CustomLabelCC()
        subtotalLbl.main(title: String(format: "Subtotal:\n$%.2f", subtotal), txtColor: UIColor.black)
        subtotalLbl.font = UIFont(name: "Copperplate", size: view.bounds.height/29.866)
        subtotalLbl.numberOfLines = 2
        cart.addSubview(subtotalLbl)
        let subtotalLblX = NSLayoutConstraint(item: subtotalLbl, attribute: .centerX, relatedBy: .equal, toItem: checkoutBox, attribute: .centerX, multiplier: 1, constant: -10)
        let subtotalLblY = NSLayoutConstraint(item: subtotalLbl, attribute: .top, relatedBy: .equal, toItem: checkoutBox, attribute: .top, multiplier: 1, constant: 15)
        cart.addConstraints([subtotalLblX, subtotalLblY])
        
        total = subtotal * 1.06
        let totalLbl = CustomLabelCC()
        totalLbl.main(title: String(format: "Total:\n$%.2f", total), txtColor: UIColor.black)
        totalLbl.font = UIFont(name: "Copperplate", size: view.bounds.height/29.866)
        totalLbl.numberOfLines = 2
        cart.addSubview(totalLbl)
        let totalLblX = NSLayoutConstraint(item: totalLbl, attribute: .left, relatedBy: .equal, toItem: subtotalLbl, attribute: .left, multiplier: 1, constant: 0)
        let totalLblY = NSLayoutConstraint(item: totalLbl, attribute: .top, relatedBy: .equal, toItem: subtotalLbl, attribute: .bottom, multiplier: 1, constant: 5)
        cart.addConstraints([totalLblX, totalLblY])
        
       
        
        let checkoutBtn = CustomButtonCC()
        checkoutBtn.main(title: "Checkout", titleColor: UIColor.white, backColor: UIColor.black, bordColor: UIColor.black.cgColor, bordW: 0, width: view.bounds.width/2-22, height: 70)
        checkoutBtn.titleLabel?.font = UIFont(name: "Copperplate", size: view.bounds.height/29.866)
        checkoutBtn.addTarget(self, action: #selector(checkoutPressed), for: .touchUpInside)
        cart.addSubview(checkoutBtn)
        let checkoutBtnX = NSLayoutConstraint(item: checkoutBtn, attribute: .left, relatedBy: .equal, toItem: checkoutBox, attribute: .left, multiplier: 1, constant: 6)
        let checkoutBtnY = NSLayoutConstraint(item: checkoutBtn, attribute: .bottom, relatedBy: .equal, toItem: checkoutBox, attribute: .bottom, multiplier: 1, constant: -20)
        cart.addConstraints([checkoutBtnX, checkoutBtnY])
        
        let pickUpLbl = CustomLabelCC()
        pickUpLbl.main(title: "Pick Up\nIn Store", txtColor: UIColor.black)
        pickUpLbl.numberOfLines = 2
        pickUpLbl.font = UIFont(name: "Hoefler Text", size: view.bounds.height/31.866)
        pickUpLbl.numberOfLines = 2
        cart.addSubview(pickUpLbl)
        let pickUpLblX = NSLayoutConstraint(item: pickUpLbl, attribute: .centerX, relatedBy: .equal, toItem: checkoutBox, attribute: .centerX, multiplier: 1, constant: -6)
        let pickUpLblY = NSLayoutConstraint(item: pickUpLbl, attribute: .bottom, relatedBy: .equal, toItem: checkoutBtn, attribute: .top, multiplier: 1, constant: -10)
        cart.addConstraints([pickUpLblX, pickUpLblY])
        
        var i = 1
        var index = 1
        var num = Int(view.bounds.height/7) + 20
        if (!(cartItems == nil))
        {
            for x in 1..<cartItems.count
            {
                let item = UILabel()
                item.translatesAutoresizingMaskIntoConstraints = false
                item.layer.masksToBounds = true
                item.backgroundColor = UIColor.red
                item.layer.cornerRadius = 35
                item.heightAnchor.constraint(equalToConstant: view.bounds.height/4).isActive = true
                item.widthAnchor.constraint(equalToConstant:view.bounds.width/2).isActive = true
                item.text = (cartItems[x] as! String)
                item.numberOfLines = 2
                item.textAlignment = .center
                item.font = UIFont(name: "Hoefler Text", size: view.bounds.height/29.866)
                cart.addSubview(item)
                let itemX = NSLayoutConstraint(item: item, attribute: .centerX, relatedBy: .equal, toItem: cart, attribute: .centerX, multiplier: 1/2, constant: 10)
                let itemY = NSLayoutConstraint(item: item, attribute: .top, relatedBy: .equal, toItem: cart, attribute: .top, multiplier: 1, constant: CGFloat(num))
                cart.addConstraints([itemX, itemY])
                
                let price = UILabel()
                price.backgroundColor = UIColor.clear
                price.translatesAutoresizingMaskIntoConstraints = false
                price.text = String(format:"$%.2f", (cartPrices[x] as! Double))
                price.font = UIFont(name: "Copperplate", size: view.bounds.height/29.866)
                cart.addSubview(price)
                let priceX = NSLayoutConstraint(item: price, attribute: .left, relatedBy: .equal, toItem: item, attribute: .left, multiplier: 1, constant: 15)
                let priceY = NSLayoutConstraint(item: price, attribute: .top, relatedBy: .equal, toItem: item, attribute: .top, multiplier: 1, constant: 15)
                cart.addConstraints([priceX, priceY])
                
                let addBtn = UIButton()
                addBtn.setImage(UIImage(named: "minusLogo"), for: .normal)
                addBtn.translatesAutoresizingMaskIntoConstraints = false
                addBtn.tag = index
                addBtn.addTarget(self, action: #selector(removeFromCart), for: .touchUpInside)
                cart.addSubview(addBtn)
                let addBtnX = NSLayoutConstraint(item: addBtn, attribute: .right, relatedBy: .equal, toItem: item, attribute: .right, multiplier: 1, constant: -15)
                let addBtnY = NSLayoutConstraint(item: addBtn, attribute: .bottom, relatedBy: .equal, toItem: item, attribute: .bottom, multiplier: 1, constant: -15)
                cart.addConstraints([addBtnX, addBtnY])
                
                let removeItem = UILabel()
                removeItem.backgroundColor = UIColor.clear
                removeItem.translatesAutoresizingMaskIntoConstraints = false
                removeItem.text = "Remove"
                removeItem.tag = index
                removeItem.font = UIFont(name: "Copperplate", size: view.bounds.height/29.866)
                cart.addSubview(removeItem)
                let removeItemX = NSLayoutConstraint(item: removeItem, attribute: .right, relatedBy: .equal, toItem: addBtn, attribute: .left, multiplier: 1, constant: -10)
                let removeItemY = NSLayoutConstraint(item: removeItem, attribute: .bottom, relatedBy: .equal, toItem: addBtn, attribute: .bottom, multiplier: 1, constant: 0)
                cart.addConstraints([removeItemX, removeItemY])
                
                
                cart.contentSize = CGSize(width: menu.bounds.width, height: menu.bounds.height - 88 + CGFloat(((Int(view.bounds.height)/4) + 20) * i))
                
                num = num + Int(view.bounds.height/4) + 25
                i = i + 1
                index = index + 1
            }
        }
    }
    
    @objc func removeFromCart(_ sender: UIButton)
    {
        let arr = NSMutableArray()
        for x in 0..<cartItems.count
        {
            arr.add(cartItems[x])
        }
        arr.removeObject(at: sender.tag)
        cartItems = arr as NSArray
        
        let arr2 = NSMutableArray()
        for x in 0..<cartPrices.count
        {
            arr2.add(cartPrices[x])
        }
        arr2.removeObject(at: sender.tag)
        cartPrices = arr2 as NSArray
        
        cartBtnPressed()
    }
    
    @objc func checkoutPressed()
    {
        var alert = UIAlertController(title: "Error", message: "Caffe Craze has been permanently closed", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
        
//        dismiss(animated: true) {
//                    let vc = self.makeCardEntryViewController()
//                    vc.delegate = self
//
//                    let nc = UINavigationController(rootViewController: vc)
//                    self.present(nc, animated: true, completion: nil)
//                }
        
    }
    func getTotal() -> Int
    {
        let total2 = Double(round(total * 100))
        return Int(total2)
    }
    func getOrder() -> String
    {
        var order = ""
        for x in 0..<cartItems.count
        {
            let item = cartItems[x] as! String
            if(x < cartItems.count - 1)
            {
                order = order + item + ", "
            }
            else
            {
                order = order + item
            }
        }
        
        return order
    }
    
//    private func didChargeSuccessfully() {
//        // Let user know that the charge was successful
//        let alert = UIAlertController(title: "Your order was successful",
//                                      message: "Go to your Square dashbord to see this order reflected in the sales tab.",
//                                      preferredStyle: UIAlertController.Style.alert)
//        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//        present(alert, animated: true, completion: nil)
//    }
}

extension ViewController: UINavigationControllerDelegate {
   func navigationControllerSupportedInterfaceOrientations(
       _: UINavigationController
   ) -> UIInterfaceOrientationMask {
       return .portrait
   }
}

extension ViewController {
    func makeCardEntryViewController() -> SQIPCardEntryViewController {
        let theme = SQIPTheme()
        theme.errorColor = .red
        theme.tintColor = UIColor(red: 0.14, green: 0.6, blue: 0.55, alpha: 1)
        theme.keyboardAppearance = .light
        theme.messageColor = UIColor(red: 0.48, green: 0.48, blue: 0.48, alpha: 1)
        theme.saveButtonTitle = "Pay"
        
        let cardEntry = SQIPCardEntryViewController(theme: theme)
        cardEntry.collectPostalCode = true
        cardEntry.delegate = self
        return cardEntry
    }
}

//extension ViewController: SQIPCardEntryViewControllerDelegate {
//func cardEntryViewController(_ cardEntryViewController: SQIPCardEntryViewController, didCompleteWith status: SQIPCardEntryCompletionStatus) {
//    // Note: If you pushed the card entry form onto an existing navigation controller,
//    // use UINavigationController.popViewController(animated:) instead
//    dismiss(animated: true) {
//        switch status {
//        case .canceled:
//            break
//            self.viewDidLoad()
//
//        case .success:
//
//            return
//        }
//
//        }
//    }
//}

    
extension ViewController: SQIPCardEntryViewControllerDelegate {
    
    func cardEntryViewController(
        _: SQIPCardEntryViewController,
        didCompleteWith status : SQIPCardEntryCompletionStatus
    ) {
//
        dismiss(animated: true) {
                switch status {
                case .canceled:
                    self.cartBtnPressed()
                    break
                case .success:
                    return
                }
            
            //self.didChargeSuccessfully()
        }
    }

    func cardEntryViewController(_ cardEntryViewController: SQIPCardEntryViewController, didObtain cardDetails : SQIPCardDetails, completionHandler : @escaping (Error?) -> Void)
     {
        // Implemented in step 4.
        
        print(cardDetails.nonce)
        ChargeApi.processPayment(cardDetails.nonce, money: getTotal(), order: getOrder()) { (transactionID, errorDescription) in
            guard let errorDescription = errorDescription else {
                // No error occured, we successfully charged
                completionHandler(nil)
                return
            }

            // Pass error description
            let error = NSError(domain: "com.example.supercookie", code: 0, userInfo:[NSLocalizedDescriptionKey : errorDescription])
            completionHandler(error)
        }
    }
}


