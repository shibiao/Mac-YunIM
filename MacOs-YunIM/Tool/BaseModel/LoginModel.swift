//
//  LoginModel.swift
//  MacOs-YunIM
//
//  Created by 牛辉 on 2017/3/20.
//  Copyright © 2017年 Niu. All rights reserved.
//

import Cocoa
let home = NSHomeDirectory() as NSString;
let docPath = home.appendingPathComponent("Documents") as NSString;
private let loginPath = docPath.appendingPathComponent("login.data");
class LoginModel: NSObject,ModelProtocol {

    public func encode(with aCoder: NSCoder) {
        self.encode(aCoder)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init()
        self.coder(aDecoder)
    }
    override init() {
        super.init()
    }
    
    var session_token   : String    = ""
    var id              : String    = ""
    var expire_at       : Int       = 0
    
    func save(){
        NSKeyedArchiver.archiveRootObject(self, toFile: loginPath)
    }
    
    class var info : LoginModel {
        if let loginInfo = NSKeyedUnarchiver.unarchiveObject(withFile: loginPath) as? LoginModel {
            return loginInfo
        } else {
            return LoginModel()
        }
    }
    class var session_token : String {
        return self.info.session_token
    }
    class var id : String {
        return self.info.id
    }
    class var expire_at: Int {
        return self.info.expire_at
    }
    
}
