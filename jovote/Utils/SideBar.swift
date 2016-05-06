//
//  SideBar.swift
//  jovote
//
//  Created by Hung Vo on 5/4/16.
//  Copyright © 2016 jointvote. All rights reserved.
//

import UIKit

@objc protocol SideBarDelegate{
    func sideBarDidSelectButtonAtIndex(index:Int)
    optional func sideBarWillClose()
    optional func SideBarWillOpen()
}

class SideBar: NSObject, SideBarTableViewControllerDelegate {
    
    let barWidth:CGFloat = 200.0
    let sideBarTableViewTopInset:CGFloat = 64.0
    let sideBarContainerView:UIView = UIView()
    let sideBarTableViewController:SideBarTableViewController = SideBarTableViewController()
    var originView:UIView! = nil
    
    var animator:UIDynamicAnimator!
    var barAnimator:UIDynamicAnimator!
    var delegate:SideBarDelegate?
    var isSideBarOpen:Bool = false
    
    override init() {
        super.init()
    }
    
    init(sourceView:UIView, menuItems:Array<String>) {
        super.init()
        
        originView = sourceView
        sideBarTableViewController.tableData = menuItems
        
        setUpSideBar()
        
        animator = UIDynamicAnimator(referenceView: originView)
        
        let showGuestureRecodnizer:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(SideBar.handleSwipe(_:)))
        showGuestureRecodnizer.direction = UISwipeGestureRecognizerDirection.Right
        originView.addGestureRecognizer(showGuestureRecodnizer)
        
        let hideGuesterRecodnizer:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(SideBar.handleSwipe(_:)))
        hideGuesterRecodnizer.direction = UISwipeGestureRecognizerDirection.Left
        originView.addGestureRecognizer(hideGuesterRecodnizer)
    }
    
    func  setUpSideBar(){
        sideBarContainerView.frame = CGRectMake(-barWidth - 1, originView.frame.origin.y, barWidth, originView.frame.size.height)
        sideBarContainerView.backgroundColor = UIColor.clearColor()
        sideBarContainerView.clipsToBounds = false
        
        originView.addSubview(sideBarContainerView)
        
        let blurView:UIVisualEffectView = UIVisualEffectView(effect: UIBlurEffect.init(style: .Light))
        blurView.frame = sideBarContainerView.bounds
        sideBarContainerView.addSubview(blurView)
        
        sideBarTableViewController.delegate = self
        sideBarTableViewController.tableView.frame = sideBarContainerView.bounds
        sideBarTableViewController.tableView.clipsToBounds = false
        sideBarTableViewController.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        sideBarTableViewController.tableView.backgroundColor = UIColor.clearColor()
        sideBarTableViewController.tableView.scrollsToTop = false
        sideBarTableViewController.tableView.contentInset = UIEdgeInsetsMake(sideBarTableViewTopInset, 0, 0, 0)
        
        sideBarTableViewController.tableView.reloadData()
        
        sideBarContainerView.addSubview(sideBarTableViewController.tableView)
        
    }
    
    func handleSwipe(recognizer:UISwipeGestureRecognizer){
        if recognizer.direction == UISwipeGestureRecognizerDirection.Left{
            showSideBar(false)
            delegate?.sideBarWillClose?()
        }
        else{
            showSideBar(true)
            delegate?.SideBarWillOpen?()
        }
    }

    func showSideBar(shouldOped:Bool){
        animator.removeAllBehaviors()
        
        isSideBarOpen = shouldOped
        
        let gravityX:CGFloat = (shouldOped) ? 0.5 : -0.5
        let magnitude:CGFloat = (shouldOped) ? 20 : -20
        let boundaryX:CGFloat = (shouldOped) ? barWidth : -barWidth - 1
        
        let gravityBahavior:UIGravityBehavior = UIGravityBehavior(items: [sideBarContainerView])
        gravityBahavior.gravityDirection = CGVectorMake(gravityX, 0)
        animator.addBehavior(gravityBahavior)
        
        let collisionBehavior:UICollisionBehavior = UICollisionBehavior(items: [sideBarContainerView])
        collisionBehavior.addBoundaryWithIdentifier("sideBarBoundary", fromPoint: CGPointMake(boundaryX, 20), toPoint: CGPointMake(boundaryX, originView.frame.size.height))
        animator.addBehavior(collisionBehavior)
        
        let pushBahavior:UIPushBehavior = UIPushBehavior(items: [sideBarContainerView], mode: .Instantaneous)
        pushBahavior.magnitude = magnitude
        animator.addBehavior(pushBahavior)
        //barAnimator.addBehavior(pushBahavior)
        
        let sideBarBehavior:UIDynamicItemBehavior = UIDynamicItemBehavior(items: [sideBarContainerView])
        sideBarBehavior.elasticity = 0.3
        animator.addBehavior(sideBarBehavior)
    }

    
    
    func sideBarControllerDidSelectRow(indexPath: NSIndexPath) {
        delegate?.sideBarDidSelectButtonAtIndex(indexPath.row)
    }
    
    
}
