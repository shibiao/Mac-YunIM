//
//  IMChatMob.swift
//  MacOs-YunIM
//
//  Created by 牛辉 on 2017/4/2.
//  Copyright © 2017年 Niu. All rights reserved.
//

import Cocoa

struct IMChatMob {
    
    static let share = IMChatMob()
    //MARK: 登陆模块
    private var imlogin : IMloginProtocol
    var imLoginManager : IMloginProtocol {
        get {
            return imlogin
        }
    }
    init() {
        //模块初始化
        imlogin = IMLoginManager()
        
        //注册收到消息
        registerReceiveMessage()
    }
    func registerReceiveMessage(){
        
    }
}
