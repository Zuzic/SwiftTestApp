//
//  Array+Extension.swift
//  jovote
//
//  Created by Hung Vo on 5/6/16.
//  Copyright © 2016 jointvote. All rights reserved.
//

import Foundation

extension Array{
    func findElementsOfClass(@noescape predicate: Array.Generator.Element -> Bool) -> Array?{
        var findElement:Array = Array()
        for item in self{            
            if predicate(item){
               findElement.append(item)
            }
        }
        return findElement
    }
}


