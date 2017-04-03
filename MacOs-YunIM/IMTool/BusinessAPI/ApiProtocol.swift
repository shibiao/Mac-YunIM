//
//  IMApiProtocol.swift
//  MacOs-YunIM
//
//  Created by 牛辉 on 2017/4/2.
//  Copyright © 2017年 Niu. All rights reserved.
//

import Cocoa


public var globalSeq = 0

protocol ApiProtocol {
    func analysis(_ data: NSData) -> Any
    func package(_ data: Any) -> NSData?
    var  callBack : callBack? {get set}
}
protocol ApiHeaderProtocol {
    var requestHeader   : apiHeader {get}
    var responseHeader  : apiHeader {get}
    var seq             : Int       {get set}
}
extension ApiProtocol where Self: ApiHeaderProtocol {
    
    mutating func request(_ data: Any,_ callBack: @escaping callBack) {
        //1. 序列号 区分api
        globalSeq += 1
        self.seq = globalSeq
        //2. 注册api
        let bool = APIRouter.manager.register(self)
        if bool == false {
            return
        }
        //3.保存callBack
        self.callBack = callBack
        //4.数据打包
        //5.发送数据
        if let data = self.package(data) {
            TcpManager.share.send(data)
        }
        
    }
    
}
