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
        loginWd.showWindow(nil)
        loginWd.window?.makeKeyAndOrderFront(nil)
        mainWindow = loginWd
    }
    
    func showMainWindowController() {
        let main = NSStoryboard.init(name: "MainWindowController", bundle: nil).instantiateInitialController() as!  MainWindowController
        main.showWindow(nil)
        main.window?.makeKeyAndOrderFront(nil)
        mainWindow = main;

    }
}
