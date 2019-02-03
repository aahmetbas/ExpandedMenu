//
//  MenuItem.swift
//  ExpandedMenu
//
//  Created by Alperen Ahmet Baş on 15.01.2019.
//  Copyright © 2019 Alperen Ahmet Baş. All rights reserved.
//

import UIKit

public class MenuItem:NSObject{
    var title = ""
    var titleColor:UIColor = UIColor.black
    var titleSize:CGFloat = 18.8
    var backgrounColor:UIColor = UIColor.white
    var view:UIView = UIView()
    
    init(title:String, backgrounColor:UIColor, view:UIView) {
        self.title = title
        self.backgrounColor = backgrounColor
        self.view = view
    }
    
    init(title:String, titleColor:UIColor, backgrounColor:UIColor, view:UIView) {
        self.title = title
        self.backgrounColor = backgrounColor
        self.view = view
        self.titleColor = titleColor
    }
    
    init(title:String, titleColor:UIColor, titleSize:CGFloat, backgrounColor:UIColor, view:UIView) {
        self.title = title
        self.backgrounColor = backgrounColor
        self.view = view
        self.titleColor = titleColor
        self.titleSize = titleSize
    }
}
