//
//  MainWindowController.swift
//  MacOs-YunIM
//
//  Created by 牛辉 on 2017/3/19.
//  Copyright © 2017年 Niu. All rights reserved.
//

import Cocoa

class MainWindowController: NSWindowController {

    override func windowDidLoad() {
        super.windowDidLoad()

        window?.titlebarAppearsTransparent = true
        window?.titleVisibility = .hidden
        window?.styleMask = [.fullSizeContentView,.titled,.resizable,.miniaturizable,.closable]
        window?.isMovableByWindowBackground = true

    }

}
