//
//  NHRequest.swift
//  MacOs-YunIM
//
//  Created by 牛辉 on 2017/3/20.
//  Copyright © 2017年 Niu. All rights reserved.
//

import Cocoa
import Alamofire
enum Response<T,U> {
    case Success(T)
    case Failure(U)
}
typealias callBack = (Response<Any, String>) -> Void

struct NHRequest {
    
    static func request(_ url: String,request: @escaping callBack) {
        Alamofire.request(url,headers:UserAgent).responseJSON { (response) in
            switch response.result {
            case .success(let data as Dictionary<String, Any>):
                if (data["error_code"] as! Int ) == 0 {
                    request(.Success(data))
                } else {
                    request(.Failure("失败"))
                }
                break
            case .failure(let error):
                request(.Failure(error.localizedDescription))
                break
            default:
                break
            }
        }
    }
    static func request(_ url: String , parms: [String : Any]?,request: @escaping callBack) {
        Alamofire.request(url,method:.post,parameters:parms,headers:UserAgent).responseJSON { (response) in
            switch response.result {
            case .success(let data as Dictionary<String, Any>):
                if (data["error_code"] as! Int ) == 0 {
                    request(.Success(data))
                } else {
                    request(.Failure("失败"))
                }
                break
            case .failure(let error):
                request(.Failure(error.localizedDescription))
                break
            default:
                break
            }
        }
    }
    static var UserAgent : [String:String] {
        let version = ProcessInfo.processInfo.operatingSystemVersionString
        let str = "i/\(Bundle.main.infoDictionary!["CFBundleShortVersionString"])\(version)/iphone/wifi"
        return ["User-Agent" : str]
    }
    
    
}
