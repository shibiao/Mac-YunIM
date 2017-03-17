//
//  AppDelegate.swift
//  MacOs-YunIM
//
//  Created by 牛辉 on 2017/3/17.
//  Copyright © 2017年 Niu. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var mainWindow : NSWindowController!
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        self.checkLoginApplicationDidFinishLaunching(aNotification)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

