//
//  IMloginProtocol.swift
//  MacOs-YunIM
//
//  Created by 牛辉 on 2017/4/2.
//  Copyright © 2017年 Niu. All rights reserved.
//

import Cocoa

protocol IMloginProtocol {
    
    func login(_ token: String, id: String, callBack:@escaping callBack)
    
}
