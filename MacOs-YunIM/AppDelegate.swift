//
//  AppDelegate.swift
//  MacOs-YunIM
//
//  Created by 牛辉 on 2017/3/17.
//  Copyright © 2017年 Niu. All rights reserved.
//

import Cocoa
import Quartz
@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var mainWindow : NSWindowController!
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        self.checkLoginApplicationDidFinishLaunching(aNotification)
    }
    func applicationShouldHandleReopen(_ sender: NSApplication, hasVisibleWindows flag: Bool) -> Bool {
        
        self.mainWindow.window?.makeKeyAndOrderFront(nil)
        return true
    }
    func applicationWillResignActive(_ notification: Notification) {
        QLPreviewPanel.shared().close()
    }
    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return false
    }
}

