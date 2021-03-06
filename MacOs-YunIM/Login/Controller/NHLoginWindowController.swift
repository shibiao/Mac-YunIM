//
//  NHLoginWindowController.swift
//  Mac-YunIM
//
//  Created by 牛辉 on 2017/3/16.
//  Copyright © 2017年 Niu. All rights reserved.
//

import Cocoa

class NHLoginWindowController: NSWindowController,NSDrawerDelegate,NSTextFieldDelegate
{

    @IBOutlet weak var PhoneTextFT: NSTextField!
    @IBOutlet weak var passWordTF: NSTextField!
    var bottomDrawer : NSDrawer?
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
        PhoneTextFT.stringValue = "18513989391"
        passWordTF.focusRingType  = .none;
        passWordTF.stringValue = "123123"
        PhoneTextFT.delegate = self;
        passWordTF.delegate = self;
        btn.target = self
        btn.action = #selector(NHLoginWindowController.bottomClick(_:))
        if PhoneTextFT.stringValue.isEmpty {
            PhoneTextFT.becomeFirstResponder()
        }else{
            passWordTF.becomeFirstResponder()
        }
    }
    func bottomClick(_ sender : NSButton) {
        if (bottomDrawer != nil) {
            bottomDrawer?.close()
        } else {
            createBottomWindow()
            bottomDrawer?.open(on: .minY)
        }
    }
    //功能建被点击 的通知   command ，shift等
    override func flagsChanged(with event: NSEvent) {
        print("123123")
    }
    func control(_ control: NSControl, textView: NSTextView, doCommandBy commandSelector: Selector) -> Bool {
        
        switch commandSelector.description {
        case "insertNewline:":
            if control == PhoneTextFT {
                passWordTF.becomeFirstResponder()
            } else {
                print("登陆")
                loginClick()
            }
            return false
        case "insertTab:":
            if control == passWordTF {
                PhoneTextFT.becomeFirstResponder()
            } else {
                passWordTF.becomeFirstResponder()
            }
            return false
        default:
            textView.perform(commandSelector, with: textView)
            print(commandSelector.description)
        }
        return true
    }
    func loginClick() {
        NHLoginTool.login(self.PhoneTextFT.stringValue, self.passWordTF.stringValue) { (response) in
            switch response {
            case .Success( _):
                app.showMainWindowController()
                NHLoginTool.userPofile(self.userRequest)
                let alert = NSAlert()
                alert.messageText = "提示"
                alert.informativeText = "IM登陆成功"
                alert.beginSheetModal(for:app.mainWindow.window! , completionHandler: { (modal) in
                    
                })
                break
            case .Failure(let error):
                let alert = NSAlert()
                alert.messageText = "提示"
                alert.informativeText = error
                alert.beginSheetModal(for:app.mainWindow.window! , completionHandler: { (modal) in
                    
                })
                break
            }
            
        }
    }
    func userRequest(_ response: Response<Any, String>) {
        
    }
    func createBottomWindow() {
        bottomDrawer = NSDrawer(contentSize: NSMakeSize(250, 100), preferredEdge: .maxX)
        bottomDrawer?.delegate = self
        bottomDrawer?.leadingOffset  = 0
        bottomDrawer?.trailingOffset = 0
        bottomDrawer?.minContentSize = NSMakeSize(250, 100)
        bottomDrawer?.maxContentSize = NSMakeSize(250, 100)
        bottomDrawer?.parentWindow   = self.window
        bottomDrawer?.contentView    = self.bottomView
    }
    func drawerDidClose(_ notification: Notification) {
        bottomDrawer = nil
    }
    lazy var bottomView : LoginBottomView =  {
        let view = LoginBottomView.initXib()
        return view
    }()
}
