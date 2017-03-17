//
//  AppDelegate+Login.swift
//  Mac-YunIM
//
//  Created by 牛辉 on 2017/3/16.
//  Copyright © 2017年 Niu. All rights reserved.
//

import Cocoa


extension AppDelegate {
    
    func checkLoginApplicationDidFinishLaunching(_ aNotification: Notification) {
        
        let loginWd = NHLoginWindowController(windowNibName: "NHLoginWindowController")
        loginWd.showWindow(self)
        loginWd.window?.makeKeyAndOrderFront(nil)
        loginWd.window?.becomeKey()
        NSApp.beginModalSession(for: loginWd.window!)
    }
}
