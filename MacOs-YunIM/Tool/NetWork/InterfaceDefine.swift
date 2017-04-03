//
//  InterfaceDefine.swift
//  MacOs-YunIM
//
//  Created by 牛辉 on 2017/3/18.
//  Copyright © 2017年 Niu. All rights reserved.
//

import Cocoa
//MARK: IM

public let IM_PriorIP       = "test.yunwoke.com"
public let IM_Port: Int32   =  9000

//MARK: url
public let BaseUrl = "http://iter.yunwoke.com/api/"

//MARK: 接口
public let ApiLogin = "v2/user/signin"
public let ApiUserPofile = "v2/user/profile"







//MARK: 常量
let app : AppDelegate =  (NSApplication.shared().delegate as! AppDelegate)







extension String {
    var token : String {
        return BaseUrl + self + "?session_token=" + LoginModel.session_token
    }
    var noneToken: String {
        return BaseUrl + self
    }
}
