//
//  RegisterViewController.swift
//  jovote
//
//  Created by Hung Vo on 5/6/16.
//  Copyright © 2016 jointvote. All rights reserved.
//

import UIKit

postfix operator % {}

postfix func % (percentage: Int) -> Double {
    return (Double(percentage) / 100)
}

class RegisterViewController: UIViewController, UITextFieldDelegate{

    
    // MARK: - Properties
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var confirmPasswordField: UITextField!
    @IBOutlet weak var enterButton: UIButton!
    
    
    // MARK: - Life cyrcle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let text:String = "test"
        let text1:String = "test"
        let array:Array = [0, 1, 2]
        
        print("String vs. Array: \(text as AnyObject >!< NSArray().classForCoder as AnyObject )")
        print("String vs. String: \(text as AnyObject >!< text1 as AnyObject )")
        
        let z = 30%
        print(z)

    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        NSNotificationCenter.defaultCenter().addObserver(self,
                                                         selector: #selector(RegisterViewController.keyboardWillShow(_:)),
                                                         name: UIKeyboardDidShowNotification,
                                                         object: self.view.window)
        
        NSNotificationCenter.defaultCenter().addObserver(self,
                                                         selector: #selector(RegisterViewController.keyboardWillHide(_:)),
                                                         name: UIKeyboardWillHideNotification,
                                                         object: self.view.window)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        NSNotificationCenter.defaultCenter().removeObserver(self)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Action methods
   
    @IBAction func enterClicked(sender: AnyObject) {
        
    }
    
    // MARK: - Observers methods
    func keyboardWillShow(notify:NSNotificationCenter){
        print("keyboardWillShow")
    }
    
    func keyboardWillHide(notify:NSNotificationCenter){
        print("keyboardWillHide")
    }
    
    
    // MARK: - Utils methods
    func hideKeyboard() {
        //let index = self.view.subviews.findElementsOfClass({$0.dynamicType == UITextField().dynamicType})
        
        
    }
    
    
    
    // MARK: - UITextFieldDelegate
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
