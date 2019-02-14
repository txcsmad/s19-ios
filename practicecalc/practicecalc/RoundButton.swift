//
//  RoundButton.swift
//  Calculator
//
//  Created by Jesse Tipton on 2/5/18.
//  Copyright © 2018 MAD. All rights reserved.
//

import UIKit

@IBDesignable class RoundButton: UIButton {
    
    @IBInspectable var circular: Bool = true
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setup()
    }
    
    func setup() {
        //        if circular {
        //            NSLayoutConstraint.activate([self.widthAnchor.constraint(equalTo: self.heightAnchor)])
        //        } else {
        //            NSLayoutConstraint.activate([self.widthAnchor.constraint(equalTo: self.heightAnchor, multiplier: 2)])
        //        }
        layer.cornerRadius = frame.height / 2
    }
    
}

