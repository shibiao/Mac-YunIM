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
    private var imSession : IMSessionProtocol
    private var imMessage : IMMessageProtocol
    static var imLoginManager : IMloginProtocol {
        return IMChatMob.share.imlogin
    }
    static var imSessionManager : IMSessionProtocol {
        return IMChatMob.share.imSession
    }
    static var imMessageManager : IMMessageProtocol {
        return IMChatMob.share.imMessage
    }
    init() {
        //模块初始化
        imlogin = IMLoginManager()
        imSession = IMSessionManager()
        imMessage = IMMessageManager()
        //注册收到消息
        registerReceiveMessage()
    }
    func registerReceiveMessage(){
        
    }
}
