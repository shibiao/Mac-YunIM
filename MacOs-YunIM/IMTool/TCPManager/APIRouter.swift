//
//  APIRouter.swift
//  MacOs-YunIM
//
//  Created by 牛辉 on 2017/4/2.
//  Copyright © 2017年 Niu. All rights reserved.
//

import Cocoa

/// 定义元组 包头主要信息 区分业务
typealias apiHeader = (sid: Int,cid: Int,seq: Int)

class APIRouter {
    
    var responses = [String : ApiProtocol]()
    static let  manager = APIRouter()
    //MARK: 1.注册api路由
    public func register(_ api: ApiProtocol) -> Bool {
        
        
        if !responses.keys.contains(ApiTransfer(api.responseHeader)) {
            responses[ApiTransfer(api.responseHeader)] = api
            return true
        } else {
            return false
        }
    }
    //MARK: 2.接受到数据，根据header 查找api
    public func receive(_ loadData: NSData , _ header: apiHeader){
        //1.根据header 去查找相关api
        if let api = responses[ApiTransfer(header)]  {
        //2.处理数据
            let data = api.analysis(loadData)
        //3.销毁注册的api
            dismissApi(api)
        //3.callback返回数据
            api.callBack?(.Success(data))
        }
        
    }
    //MARK: 3.销毁api
    func dismissApi(_ api: ApiProtocol) {
        responses[ApiTransfer(api.responseHeader)] = nil
    }
    //MARK: 4.
    //MARK: 5.tuples

}

func ApiTransfer(_ header: apiHeader) -> String{
    return "\(header.0)-\(header.1)-\(header.2)"
}
