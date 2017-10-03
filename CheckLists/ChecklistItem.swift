//
//  ChecklistItem.swift
//  CheckLists
//
//  Created by Joe Crescenzi on 9/24/17.
//  Copyright © 2017 Joe Crescenzi. All rights reserved.
//

import Foundation
class ChecklistItem: NSObject
{
    var text = ""
    var checked = false
    
    func toggleChecked()
    {
        checked = !checked
    }
    
}


