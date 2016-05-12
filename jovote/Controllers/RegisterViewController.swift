//
//  RegisterViewController.swift
//  jovote
//
//  Created by Hung Vo on 5/6/16.
//  Copyright © 2016 jointvote. All rights reserved.
//

import UIKit



class RegisterViewController: UIViewController, UITextFieldDelegate, AuthorizationViewControllerProtocol{

    
    // MARK: - Properties
    @IBOutlet weak var nameField: JVTAuthorizationTextField!
    @IBOutlet weak var emailField: JVTAuthorizationTextField!
    @IBOutlet weak var passwordField: JVTAuthorizationTextField!
    @IBOutlet weak var confirmPasswordField: JVTAuthorizationTextField!
    @IBOutlet weak var enterButton: UIButton!
    
    @IBOutlet weak var topConstaint: NSLayoutConstraint!
    
    weak var delegate:AuthorizationViewController?
    
    // MARK: - Life cyrcle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        
        NSNotificationCenter.defaultCenter().addObserver(self,
                                                         selector: #selector(RegisterViewController.keyboardWillShow(_:)),
                                                         name: UIKeyboardWillShowNotification,
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
    
    deinit{
       delegate = nil
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Action methods
   
    @IBAction func enterClicked(sender: AnyObject) {
        
    }
    
    // MARK: - Observers methods
    func keyboardWillShow(notify:NSNotification){
        let userInfo = notify.userInfo!
        let keyboardSpeed = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! Double
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        let yContainerPosition:CGFloat = screenSize.size.height - self.view.bounds.size.height
        
        let keyboardScreenEndFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue()
        let visibleViewArray: Array? = self.view.subviews.findElementsOfClass({ $0.classForCoder == UITextField().classForCoder  && $0.isFirstResponder()})
        let visibleView = visibleViewArray?.first
        
        if let view = visibleView {
            let yPoint = yContainerPosition + view.frame.origin.y + view.frame.size.height - keyboardScreenEndFrame.origin.y
            if yPoint > 0 {
                UIView.animateWithDuration(keyboardSpeed, animations: {
                    self.topConstaint.constant = -yPoint
                    self.view.layoutIfNeeded()
                })
            }
        }
    }
    
    func keyboardWillHide(notify:NSNotification){
        let userInfo = notify.userInfo!
        let keyboardSpeed = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! Double
        
        UIView.animateWithDuration(keyboardSpeed, animations: {
            self.topConstaint.constant = 0
            self.view.layoutIfNeeded()
        })
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
    
    // MARK: - Protocols
    func someMethod() {
        hideKeyboard()
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
