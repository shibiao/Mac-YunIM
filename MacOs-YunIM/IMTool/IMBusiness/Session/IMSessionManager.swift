//
//  IMSessionManager.swift
//  MacOs-YunIM
//
//  Created by 牛辉 on 2017/4/8.
//  Copyright © 2017年 Niu. All rights reserved.
//

import Cocoa

struct IMSessionManager: IMSessionProtocol{
    func loadSession(callBack: @escaping ([IMSessionModel]) -> ()) {
        IMRequest.loadSession { (response) in
            switch response {
            case .Success(let sessions):
                callBack(sessions)
                break
            default:
                callBack([])
                break
            }
        }
    }
}
