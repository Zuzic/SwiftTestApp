//
//  ViewController.swift
//  jovote
//
//  Created by Hung Vo on 5/4/16.
//  Copyright © 2016 jointvote. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SideBarDelegate {

    var sideBar:SideBar = SideBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blueColor()
        sideBar = SideBar(sourceView: self.view, menuItems: ["firs item", "second item", "third item"], navigationBar: (self.navigationController?.navigationBar)!)
        sideBar.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func sideBarDidSelectButtonAtIndex(index: Int) {
        if index == 0 {
            self.view.backgroundColor = UIColor.redColor()
        }else if index == 1 {
            self.view.backgroundColor = UIColor.greenColor()
        }else if index == 2 {
            self.view.backgroundColor = UIColor.orangeColor()
        }
    }
    
//    func SideBarWillOpen() {
//        self.navigationController?.navigationBar.frame = CGRectMake(sideBar.barWidth, (self.navigationController?.navigationBar.frame.origin.y)!, (self.navigationController?.navigationBar.frame.size.width)!, (self.navigationController?.navigationBar.frame.size.height)!)
//    }
//    
//    func sideBarWillClose() {
//        self.navigationController?.navigationBar.frame = CGRectMake(0, (self.navigationController?.navigationBar.frame.origin.y)!, (self.navigationController?.navigationBar.frame.size.width)!, (self.navigationController?.navigationBar.frame.size.height)!)
//    }


}

