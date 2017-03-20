//
//  UserPofile.swift
//  MacOs-YunIM
//
//  Created by 牛辉 on 2017/3/21.
//  Copyright © 2017年 Niu. All rights reserved.
//

import Cocoa

private let UserPath = docPath.appendingPathComponent("UserPath.data");
class UserPofile: NSObject,ModelProtocol {
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

    var name        : String        = ""
    var overview    : String        = ""
    var id          : String        = ""
    var phone       : String        = ""
    var email       : String        = ""
    var avatar      : String        = ""
    func save(){
        NSKeyedArchiver.archiveRootObject(self, toFile: UserPath)
    }
    class var info : UserPofile {
        if let loginInfo = NSKeyedUnarchiver.unarchiveObject(withFile: UserPath) as? UserPofile {
            return loginInfo
        } else {
            return UserPofile()
        }
    }
    class var name        : String{
        return self.info.name
    }
    class var overview    : String{
        return self.info.overview
    }
    class var id          : String{
        return self.info.id
    }
    class var phone       : String{
        return self.info.phone
    }
    class var email       : String{
        return self.info.email
    }
    class var avatar      : String{
        return self.info.avatar
    }

}
