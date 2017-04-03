//
//  IMLoginManager.swift
//  MacOs-YunIM
//
//  Created by 牛辉 on 2017/4/2.
//  Copyright © 2017年 Niu. All rights reserved.
//

import Cocoa
import CoreFoundation
struct IMLoginManager: IMloginProtocol {
    
    func connectTcp(callBack: @escaping callBack) {
        let loginTcp = ConnectTcpManager()
        loginTcp.ip = IM_PriorIP
        loginTcp.port = IM_Port
        loginTcp.connectTCP(callBack: callBack)
    }
    func login(_ token: String, id: String, callBack: callBack) {
        connectTcp { (response) in
            switch response {
            case .Success(_):
                    var api = IMLoginAPI()
                    let clientVersion = "MAC/3.1.5-3.1.5.2"
                    let deviceToken   = "token_\(NSDate().timeIntervalSince1970)"
                    let  params = (id,token, deviceToken,clientVersion)
                    api.request(params,self.loginCallBack)
                break
            case .Failure(_):
                break
            }
        }
    }
    func loginCallBack(response: Response<Any, String>) -> Void {
        
    }
}
