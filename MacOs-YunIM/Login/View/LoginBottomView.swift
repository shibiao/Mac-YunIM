//
//  LoginBottomView.swift
//  Mac-YunIM
//
//  Created by 牛辉 on 2017/3/17.
//  Copyright © 2017年 Niu. All rights reserved.
//

import Cocoa

class LoginBottomView: NSView {

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

    }
    
    class func initXib() -> LoginBottomView {
        var nilArr  = NSArray()
        Bundle.main.loadNibNamed("LoginBottomView", owner: self, topLevelObjects: &nilArr)
        var temp : LoginBottomView?
        for item in nilArr {
            if item is LoginBottomView {
                temp = item as? LoginBottomView
            }
        }
        return temp!
    }
    
}
