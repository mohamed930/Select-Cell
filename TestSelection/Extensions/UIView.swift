//
//  UIView.swift
//  TestSelection
//
//  Created by Mohamed Ali on 02/10/2021.
//

import UIKit

extension UIView {
    
    func SetViewBorder(BorderColor: UIColor, BorderSize: CGFloat) {
        self.layer.borderColor = BorderColor.cgColor
        self.layer.masksToBounds = true
        self.layer.borderWidth = BorderSize
    }
}
