//
//  AuthorizationViewController.swift
//  jovote
//
//  Created by Hung Vo on 5/5/16.
//  Copyright © 2016 jointvote. All rights reserved.
//

import UIKit
protocol AuthorizationViewControllerProtocol
{
    func someMethod()  // here is the method declaration
    
}

class AuthorizationViewController: UIViewController {

    @IBOutlet weak var loginContainer: UIView!
    @IBOutlet weak var registerContainer: UIView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    var registeController: RegisterViewController?
    var loginController: LoginViewController?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        segmentControl.setTitle("Log in", forSegmentAtIndex: 0)
        segmentControl.setTitle("Register", forSegmentAtIndex: 1)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        showContainer(selectSegmentIndex: 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Utils methods
    func showContainer(selectSegmentIndex index:Int){
        loginContainer.alpha = index == 0 ? 1 : 0
        registerContainer.alpha = index == 1 ? 1 : 0
    }
    
    //MARK: Touche methods
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if loginContainer.alpha == 0 {
            if let controller = registeController{
                controller.someMethod()
            }
        }
    }

    //MARK: Action methods
    @IBAction func showComponent(sender: AnyObject) {
        let segment:UISegmentedControl = sender as! UISegmentedControl
        
        UIView.animateWithDuration(0.3, animations: {
            self.showContainer(selectSegmentIndex: segment.selectedSegmentIndex)
        })
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "RegisterContainer" {
            if  registeController == nil{
                registeController = (segue.destinationViewController as? RegisterViewController)!
                registeController!.delegate = self
            }
        }
        
        if segue.identifier == "LoginContainer" {
            if loginController == nil {
                loginController = (segue.destinationViewController as? LoginViewController)!
                loginController!.delegate = self
            }
        }
    }
    

}

