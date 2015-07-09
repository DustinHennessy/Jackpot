//
//  Numbers.swift
//  Jackpot
//
//  Created by Dustin Hennessy on 7/8/15.
//  Copyright (c) 2015 DustinHennessy. All rights reserved.
//

import UIKit
import Parse

class Numbers: PFObject, PFSubclassing {
    @NSManaged var number1: Int
    @NSManaged var number2: Int
    @NSManaged var number3: Int
    @NSManaged var number4: Int
    @NSManaged var number5: Int
    @NSManaged var powerBall: Int
    @NSManaged var winnerStatus: String
    
    override class func initialize() {
        struct Static {
            static var onceToken : dispatch_once_t = 0
        }
        dispatch_once(&Static.onceToken) {
            self.registerSubclass()
        }
    }
    
    static func parseClassName() -> String {
        return "Numbers"
    }
}

