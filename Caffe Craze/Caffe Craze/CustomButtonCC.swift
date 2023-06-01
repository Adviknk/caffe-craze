//
//  CustomButtonCC.swift
//  Caffe Craze
//
//  Created by Advik Nakirikanti on 7/10/20.
//  Copyright © 2020 Advik Nakirikanti. All rights reserved.
//

import UIKit

class CustomButtonCC: UIButton
{
    override init(frame: CGRect)
    {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    func main(title : String, titleColor: UIColor, backColor: UIColor, bordColor: CGColor, bordW: CGFloat, width: CGFloat, height: CGFloat)
    {
        translatesAutoresizingMaskIntoConstraints = false
        setTitleColor(titleColor, for: .normal)
        setTitle(title, for: .normal)
        backgroundColor = backColor
        layer.borderColor = bordColor
        layer.borderWidth = bordW
        heightAnchor.constraint(equalToConstant: height).isActive = true
        widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    
//    func mcqBtn(title: String)
//    {
//        translatesAutoresizingMaskIntoConstraints = false
//        setTitleColor(UIColor.white, for: .normal)
//        setTitle(title, for: .normal)
//        backgroundColor = UIColor.blue
//        layer.cornerRadius = 25
//        layer.borderColor = UIColor.black.cgColor
//        layer.borderWidth = 3
//        titleLabel?.font = UIFont(name: "Hoefler Text", size: 27)
//        layer.shadowOffset = CGSize(width: 0, height: 4)
//        layer.shadowOpacity = 0.5
//        layer.shadowRadius = 5
//        layer.shadowColor = UIColor.blue.cgColor
//        heightAnchor.constraint(equalToConstant: 60).isActive = true
//        widthAnchor.constraint(equalToConstant: 340).isActive = true
//    }
    
}
