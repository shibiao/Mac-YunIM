//
//  IMRequest.swift
//  MacOs-YunIM
//
//  Created by 牛辉 on 2017/4/8.
//  Copyright © 2017年 Niu. All rights reserved.
//

import Cocoa
import Alamofire

struct IMRequest {
    static func loadSession(callBack: @escaping (Response<[IMSessionModel], String>) -> ()) {
        
        IMBaseRequest.request(IMSession.imToken) { (response) in
            switch response {
            case .Success(let json as Dictionary<String, Any> ):
                if let sessions = NSArray.yy_modelArray(with: IMSessionModel.classForCoder(), json: json["data"] as Any) as? [IMSessionModel] {
                    callBack(.Success(sessions))
                } else {
                    callBack(.Failure("失败"))
                }
                break
            case .Failure(let error):
                callBack(.Failure(error))
                break
            default:break
            }
        }
    }
    
}
struct IMBaseRequest {
    
    static func request(_ url: String,request: @escaping callBack) {
        Alamofire.request(url).responseJSON { (response) in
            switch response.result {
            case .success(let data as Dictionary<String, Any>):
                request(.Success(data))
                break
            case .failure(let error):
                request(.Failure(error.localizedDescription))
                break
            default:
                break
            }
        }
    }
}
