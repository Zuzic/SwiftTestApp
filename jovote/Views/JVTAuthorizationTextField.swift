//
//  JVTAuthorizationTextField.swift
//  jovote
//
//  Created by Hung Vo on 5/12/16.
//  Copyright © 2016 jointvote. All rights reserved.
//

import UIKit

class JVTAuthorizationTextField: UITextField {
    
    func addLeftIcon (icon:UIImage){
        let iconSize = checkIcomSize(icon)
        
        let iconImageView:UIImageView = UIImageView(image: icon)
        iconImageView.frame = CGRectMake(10, 0, iconSize.iconWidth, iconSize.iconHeight)
        
        let containerView:UIView = UIView()
        containerView.frame = CGRectMake(0, 0, 30, iconSize.iconHeight)
        containerView.backgroundColor = UIColor.clearColor()
        containerView.addSubview(iconImageView)
        
        self.leftView = containerView
        self.leftViewMode = UITextFieldViewMode.UnlessEditing
    }
    
    func addPlaceholderText(placeholderText:String) {
        self.attributedPlaceholder = NSAttributedString(string:placeholderText, attributes: [NSForegroundColorAttributeName:colorPlaceholderAuthText])
    }
    
    func addIconAndPlaceholder(icon:UIImage, placeholderText:String){
        addLeftIcon(icon)
        addPlaceholderText(placeholderText)
    }
    
    
    private func checkIcomSize(icon:UIImage?) ->(iconWidth:CGFloat, iconHeight:CGFloat){
        var width = icon?.size.width
        var height = icon?.size.height
        
        if width>15 || height>15 {
            var multiplier:CGFloat = 1
            
            if width>=height {
                multiplier = 15.0 / width!
            }
            else {
                multiplier = 15.0 / height!
            }
            
            width = width!*multiplier
            height = height!*multiplier
        }
        
        return (width!, height!)
    }
}
