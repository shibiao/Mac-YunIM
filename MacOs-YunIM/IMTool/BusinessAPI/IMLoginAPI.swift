//
//  IMLoginAPI.swift
//  MacOs-YunIM
//
//  Created by 牛辉 on 2017/4/2.
//  Copyright © 2017年 Niu. All rights reserved.
//

import Cocoa

class IMLoginAPI: ApiProtocol {
    var callBack: callBack?
    var seq : Int = 0
    //MARK: 数据返回时候包头
    var responseHeader: apiHeader {
        return (Int(ServiceID.sidLogin.rawValue),Int(LoginCmdID.cidLoginResUserlogin.rawValue),seq)
    }
    //MARK: 请求的时候包头
    var requestHeader: apiHeader {
        return (Int(ServiceID.sidLogin.rawValue),Int(LoginCmdID.cidLoginReqUserlogin.rawValue),seq)
    }
    //MARK: 收到数据时 处理数据
    public func analysis(_ data: NSData) -> Any {
        do {
            let res = try IMLoginRes.parse(from: data as Data)
            let resultCode  = res.errCode
            let resultMsg   = res.errMsg
            return ["resultCode": resultCode,"resultMsg": resultMsg ?? ""]
        } catch _ {
            return ["resultCode": 1         ,"resultMsg": "数据解析失败"]
        }
    }
    //MARK: 发送数据时 处理数据
    internal func package(_ data: Any) -> NSData? {
        
        let user  = data as! (String, String, String, String)
        var dataout = DataOutputStream()
        dataout.writeInt(1)
        dataout.write(requestHeader)
        let login = IMLoginReq()
        login.userId = user.0
        login.onlineStatus = .userStatusOnline
        login.token  = user.1
        login.clientType = .clientTypeIos
        login.deviceId   = user.2
        login.clientVersion = user.3
        dataout.directWriteBytes((login.data() as? NSData)!)
        dataout.writeDataCount()
        return dataout.data
    }
}
