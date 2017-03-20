//
//  BaseModel.swift
//  MacOs-YunIM
//
//  Created by 牛辉 on 2017/3/20.
//  Copyright © 2017年 Niu. All rights reserved.
//

import Cocoa

protocol ModelProtocol: NSObjectProtocol,NSCoding {
    
    func encode(_ encder: NSCoder)
    func coder(_ aDecoder: NSCoder)
}
extension ModelProtocol where Self: NSObject {

    func encode(_ encder: NSCoder) {
        var count: UInt32 = 0
        let properties = class_copyPropertyList(self.classForCoder, &count)
        var propertyNames: [String] = []
        // Swift中类型是严格检查的，必须转换成同一类型
        for i in 0 ..< Int(count) {
            let property = properties?[i]
            let name = property_getName(property)
            let strName = String(describing: name);
            let value = self.value(forKey: strName)
            encder.encode(value, forKey: strName)
            propertyNames.append(strName);
        }
        free(properties)
    }
    func coder(_ aDecoder: NSCoder) {
        var count: UInt32 = 0
        let properties = class_copyPropertyList(self.classForCoder, &count)
        var propertyNames: [String] = []
        for i in 0 ..< Int(count) {
            let property = properties?[i]
            let name = property_getName(property)
            let strName = String(describing: name);
            let value = aDecoder.decodeObject(forKey: strName)
            self.setValue(value, forKey: strName)
            propertyNames.append(strName);
        }
        free(properties)
    }

}
