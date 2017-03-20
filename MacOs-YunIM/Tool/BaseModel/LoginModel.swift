//
//  LoginModel.swift
//  MacOs-YunIM
//
//  Created by 牛辉 on 2017/3/20.
//  Copyright © 2017年 Niu. All rights reserved.
//

import Cocoa

class LoginModel: NSObject,ModelProtocol {
    public func encode(with aCoder: NSCoder) {
        self.encode(aCoder)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init()
        self.coder(aDecoder)
    }
    
    var session_token   : String    = ""
    var id              : String    = ""
    var expire_at       : Int       = 0
    
}
