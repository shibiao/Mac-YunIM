//
//  SendBuffer.swift
//  MacOs-YunIM
//
//  Created by 牛辉 on 2017/4/3.
//  Copyright © 2017年 Niu. All rights reserved.
//

import Cocoa

class SendBuffer: NSMutableData {
    
    var consumeLen: Int = 0
    
    func consume(_ len: Int) {
        consumeLen += len
    }

}
