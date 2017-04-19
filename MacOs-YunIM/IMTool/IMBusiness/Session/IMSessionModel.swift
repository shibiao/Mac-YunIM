//
//  IMSessionModel.swift
//  MacOs-YunIM
//
//  Created by 牛辉 on 2017/4/8.
//  Copyright © 2017年 Niu. All rights reserved.
//

import Cocoa

class IMSessionModel: NSObject {
    
    /// 房间id
    var cid:            String?
    /// 会话id
    var sid:            String?
    /// 会话类型  1个人 ，2群组
    var type:           Int = 1
    /// 未读数
    var unread_cnt:     Int = 0
    /// 挂载的消息
    var msg:            IMMessageModel?

}
