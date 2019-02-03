//
//  RoundedView.swift
//  ExpandedMenu
//
//  Created by Alperen Ahmet Baş on 22.03.2018.
//  Copyright © 2018 Alperen Ahmet Baş. All rights reserved.
//

import UIKit

@IBDesignable public class RoundedView: UIView {
    
    @IBInspectable var borderColor: UIColor = UIColor.white {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 2.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var shadow: Float = 0.0 {
        didSet {
            layer.shadowOpacity = shadow
        }
    }
    
}

