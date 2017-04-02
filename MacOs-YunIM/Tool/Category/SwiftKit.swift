//
//  SwiftKit.swift
//  YunZuJia
//
//  Created by 牛辉 on 2016/10/29.
//  Copyright © 2016年 CloudWork. All rights reserved.
//

import Cocoa
import CoreFoundation

extension Int {
    func times(_ blcok: ()->()){
        for _ in 0..<self{
            blcok()
        }
    }
    func tagTimes(_ block: (Int)->()){
        for index in 0..<self{
            block(index)
        }
    }
}
func SLog<T>(_ message : T,methodName: String = #function, lineNumber: Int = #line){
    #if DEBUG
        print("\(methodName)[\(lineNumber)]:\(message)")
    #endif
}
func isNotEmpty(_ str: String?) ->Bool {
    if (str != nil) && str?.isEmpty == false {
        return true
    } else {
        return false
    }
}

public struct NilError: Error, CustomStringConvertible {
    public var description: String { return _description }
    public init(file: String, line: Int) {
        _description = "Nil returned at "
            + (file as NSString).lastPathComponent + ":\(line)"
    }
    private let _description: String
}
extension Optional {
    public func unwrap(file: String = #file, line: Int = #line) throws -> Wrapped {
        guard let unwrapped = self else { throw NilError(file: file, line: line) }
        return unwrapped
    }
}
