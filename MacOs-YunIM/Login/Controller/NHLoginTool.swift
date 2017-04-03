//
//  NHLoginTool.swift
//  MacOs-YunIM
//
//  Created by 牛辉 on 2017/3/20.
//  Copyright © 2017年 Niu. All rights reserved.
//

import Cocoa
struct NHLoginTool {
    
    static func login(_ phone: String ,_ passWord: String ,request: @escaping callBack) {
        var parms = [String : Any]()
        parms["username"] = phone;
        parms["password"] = passWord;
        parms["remember"] = "true";
        NHRequest.request(ApiLogin.noneToken, parms: parms) { (response) in
            switch response {
            case .Success(let json):
                let model = LoginModel.yy_model(withJSON: json)
                model?.save()
                request(.Success(model ?? LoginModel()))
                if let user = model {
                    loginIM(user.id, user.session_token)
                }
            case .Failure(let error):
                request(.Failure(error))
            }
        }
    }
    static func loginIM(_ id: String ,_ token: String) {
        IMChatMob.share.imLoginManager.login(token, id: id) { (response) in
            switch response {
            case .Success(_):
                let alert = NSAlert()
                alert.messageText = "提示"
                alert.informativeText = "IM登陆成功"
                alert.beginSheetModal(for:app.mainWindow.window! , completionHandler: { (modal) in
                    
                })
                break
            case .Failure(_):
                let alert = NSAlert()
                alert.messageText = "提示"
                alert.informativeText = "IM登陆失败"
                alert.beginSheetModal(for:app.mainWindow.window! , completionHandler: { (modal) in
                    
                })
                break
            }
        }
    }
    static func userPofile(_ request: @escaping callBack) {
        NHRequest.request(ApiUserPofile.token) { (response) in
            switch response {
            case .Success(let json):
                let dic : NSDictionary = json as! NSDictionary
                let model = UserPofile.yy_model(withJSON: dic["profile"] as Any)
                model?.save()
                request(.Success(model ?? UserPofile()))
            case .Failure(let error):
                request(.Failure(error))
            }
        }
    }
}
