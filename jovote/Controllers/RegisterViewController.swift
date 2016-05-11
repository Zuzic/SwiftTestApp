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
    
    @IBOutlet weak var topConstaint: NSLayoutConstraint!
    
    // MARK: - Life cyrcle
    override func viewDidLoad() {
        super.viewDidLoad()

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
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationController?.navigationBar.translucent = true
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
        
    }
    
    func keyboardWillHide(notify:NSNotificationCenter){
        
    }
    
    
    // MARK: - Utils methods
    func hideKeyboard() {
        let hideArr: Array? = self.view.subviews.findElementsOfClass({ $0.classForCoder == UITextField().classForCoder  && $0.isFirstResponder()} )
        for item in hideArr! {
            item.resignFirstResponder()
        }
    }
    
    
    
    // MARK: - UITextFieldDelegate
    
    func textFieldDidBeginEditing(textField: UITextField) {
        print("textFieldDidBeginEditing")
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        print("textFieldDidEndEditing")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
