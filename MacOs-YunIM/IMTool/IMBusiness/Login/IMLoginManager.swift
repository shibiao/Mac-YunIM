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
    func login(_ token: String, id: String, callBack: @escaping callBack) {
        connectTcp { (response) in
            switch response {
            case .Success(_):
                    var api = IMLoginAPI()
                    let clientVersion = "MAC/3.1.5-3.1.5.2"
                    let deviceToken   = "token_\(NSDate().timeIntervalSince1970)"
                    let  params = (id,token, deviceToken,clientVersion)
                    api.request(params, { (api) in
                        switch api {
                        case .Success(let json as Dictionary<String, Any>):
                            if (json["resultCode"] as! Int32) == 0 {
                                callBack(.Success(0))
                            } else {
                                callBack(.Failure("失败"))
                            }
                            break
                        case .Failure(_):
                            callBack(.Failure("失败"))
                            break
                        default:
                            break
                        }
                    })
                break
            case .Failure(_):
                break
            }
        }
    }
}
