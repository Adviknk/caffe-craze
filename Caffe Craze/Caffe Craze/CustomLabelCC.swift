//
//  CustomLabelCC.swift
//  Caffe Craze
//
//  Created by Advik Nakirikanti on 7/10/20.
//  Copyright © 2020 Advik Nakirikanti. All rights reserved.
//

import UIKit

class CustomLabelCC: UILabel
{
    override init(frame: CGRect)
    {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    func main(title: String, txtColor: UIColor)
    {
        translatesAutoresizingMaskIntoConstraints = false
        text = title
        textColor = txtColor
    }

    func main2(title: String, txtColor: UIColor, numLines: Int)
    {
        translatesAutoresizingMaskIntoConstraints = false
        text = title
        textColor = txtColor
        font = UIFont(name: "Hoefler Text", size: 55)
        textAlignment = .center
        numberOfLines = numLines
    }
    
    
}
