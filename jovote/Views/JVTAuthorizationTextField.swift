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
        self.leftViewMode = UITextFieldViewMode.UnlessEditing
        self.leftView = UIImageView(image: icon)
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
