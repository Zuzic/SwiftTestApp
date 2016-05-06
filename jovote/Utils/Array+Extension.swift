//
//  Array+Extension.swift
//  jovote
//
//  Created by Hung Vo on 5/6/16.
//  Copyright © 2016 jointvote. All rights reserved.
//

import Foundation

infix operator >!< {}

func >!< (object1: AnyObject!, object2: AnyObject!) -> Bool {
    return (object_getClassName(object1) == object_getClassName(object2))
}

extension Array{
    func findElementsOfClass<L:BooleanType>(predicate: Array.Generator.Element -> L) -> Array.Generator.Element?{
        //var findElement:NSMutableArray = NSMutableArray()
        
        
        
        for item in self{            
            if predicate(item){
                return item
            }
            else{
                return nil
            }
        }
        return nil
    }
}