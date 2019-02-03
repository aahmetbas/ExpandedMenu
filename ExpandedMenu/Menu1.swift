//
//  Menu1.swift
//  ExpandedMenu
//
//  Created by Alperen Ahmet Baş on 29.01.2019.
//  Copyright © 2019 Alperen Ahmet Baş. All rights reserved.
//

import UIKit

class Menu1:UIView{

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var topLeftButton: UIButton!
    @IBOutlet weak var topRightButton: UIButton!
    @IBOutlet weak var bottomLeftButton: UIButton!
    @IBOutlet weak var bottomRightButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
