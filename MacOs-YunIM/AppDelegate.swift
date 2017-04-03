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
//        [[UIApplication sharedApplication] registerForRemoteNotifications];
        NSApplication.shared().registerForRemoteNotifications(matching: NSRemoteNotificationType.sound)
        self.checkLoginApplicationDidFinishLaunching(aNotification)
    }
    func applicationShouldHandleReopen(_ sender: NSApplication, hasVisibleWindows flag: Bool) -> Bool {
        
        self.mainWindow.window?.makeKeyAndOrderFront(nil)
        return true
    }
    func application(_ application: NSApplication, didReceiveRemoteNotification userInfo: [String : Any]) {
        
    }
    func application(_ application: NSApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        
    }
    func applicationWillResignActive(_ notification: Notification) {
        QLPreviewPanel.shared().close()
    }
    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return false
    }
    func application(_ application: NSApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        print(String(data: deviceToken, encoding: String.Encoding.utf8) ?? "")
    }
}

