//
//  NHLoginWindowController.swift
//  Mac-YunIM
//
//  Created by 牛辉 on 2017/3/16.
//  Copyright © 2017年 Niu. All rights reserved.
//

import Cocoa

class NHLoginWindowController: NSWindowController {

    @IBOutlet weak var PhoneTextFT: NSTextField!
    @IBOutlet weak var passWordTF: NSTextField!
    
    var bottomWindow : NSWindow?
    @IBOutlet weak var btn: NSButton!
    
    override func windowDidLoad() {
        super.windowDidLoad()
        setUpUI()
    }
    func setUpUI() {
        //隐藏titleBar 透明
        window?.titlebarAppearsTransparent = true
        //title可见
        window?.titleVisibility = .hidden
        window?.backgroundColor = NSColor.white
        //隐藏最小化按钮
        window?.standardWindowButton(.miniaturizeButton)?.isHidden = true
        //隐藏最大化按钮
        window?.standardWindowButton(.zoomButton)?.isHidden = true
        window?.isMovableByWindowBackground = true
        //消除 编辑时 系统自带的边框效果
        PhoneTextFT.focusRingType = .none;
        passWordTF.focusRingType  = .none;
        btn.target = self
        btn.action = #selector(NHLoginWindowController.bottomClick(_:))
    }
    
    func bottomClick(_ sender : NSButton) {
        if (bottomWindow != nil) {
            self.window?.removeChildWindow(bottomWindow!)
            bottomWindow = nil
        } else {
            createBottomWindow()
        }
    }
    
    @IBAction func btnClick(_ sender: Any) {
    }
    func createBottomWindow() {
        bottomWindow = NSWindow()
        bottomWindow?.styleMask     = .borderless
        bottomWindow?.backingType   = .nonretained
        bottomWindow?.setFrame( NSMakeRect(self.window!.frame.origin.x, self.window!.frame.origin.y - 100, self.window!.frame.size.width, 100), display: true, animate: true)
        bottomWindow?.contentView = self.bottomView
        self.window?.addChildWindow(bottomWindow!, ordered: .below)
    }
    lazy var bottomView : LoginBottomView =  {
        let view = LoginBottomView.initXib()
        return view
    }()
}
