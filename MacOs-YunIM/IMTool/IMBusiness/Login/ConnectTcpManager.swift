//
//  ConnectTcpManager.swift
//  MacOs-YunIM
//
//  Created by 牛辉 on 2017/4/3.
//  Copyright © 2017年 Niu. All rights reserved.
//

import Cocoa

class ConnectTcpManager: NSObject {
    
    var ip: String = ""
    var port: Int32 = 0
    var  connecting : Bool = false
    var callBack : callBack?
    override init() {
        super.init()
        NotificationCenter.default.addObserver(self, selector: #selector(ConnectTcpManager.tcpConntectSuccess), name: NSNotification.Name.TcpConntectSuccess, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ConnectTcpManager.tcpConntectFailure), name: NSNotification.Name.TcpConntectFailure, object: nil)
    }
    func tcpConntectFailure() {
        callBack?(.Failure("链接超时"))
    }
    func tcpConntectSuccess() {
        callBack?(.Success(1))
    }
    func connectTCP(callBack: @escaping callBack) {
        
        self.callBack = callBack
        if !connecting {
            connecting = true
            TcpManager.share.connect(ip, port)
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+15) {
                if self.connecting == true {
                    callBack(.Failure("链接超时"))
                    self.connecting = false
                }
            }
        }
    }
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
