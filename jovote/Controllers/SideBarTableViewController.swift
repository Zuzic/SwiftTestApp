//
//  SideBarTableViewController.swift
//  jovote
//
//  Created by Hung Vo on 5/4/16.
//  Copyright © 2016 jointvote. All rights reserved.
//

import UIKit

protocol SideBarTableViewControllerDelegate {
    func sideBarControllerDidSelectRow(indexPath: NSIndexPath)
}

class SideBarTableViewController: UITableViewController {

    var delegate:SideBarTableViewControllerDelegate?
    var tableData:Array<String> = []
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
       
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tableData.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell")
        
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
            
            cell!.backgroundColor = UIColor.clearColor()
            cell!.textLabel?.textColor = UIColor.darkGrayColor()
        }
        
        cell!.textLabel?.text = tableData[indexPath.row]
        return cell!
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 45.0
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        delegate?.sideBarControllerDidSelectRow(indexPath)
    }
}

