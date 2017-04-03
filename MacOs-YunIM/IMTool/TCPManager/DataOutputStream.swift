//
//  DataOutputStream.swift
//  MacOs-YunIM
//
//  Created by 牛辉 on 2017/4/3.
//  Copyright © 2017年 Niu. All rights reserved.
//

import Cocoa

struct DataOutputStream {
    
    var data: NSMutableData
    var lenght: Int = 0
    
    init() {
        self.data = NSMutableData()
        self.lenght = 0
    }
    
    mutating func writeShort(_ v: Int16) {
        var ch = [Int16](repeating: 0, count: 2)
        ch[0] = (v & 0x0ff)>>8
        ch[1] = (v & 0x0ff)
        data.append(ch, length: 2)
        self.lenght = self.lenght + 2
    }
    mutating func directWriteBytes(_ data: NSData) {
        let len = data.length
        self.data.append(data as Data)
        self.lenght = self.lenght + len
    }
    func writeDataCount() {
        var ch = [Int8](repeating: 0, count: 4)
        for i in 0..<4 {
            ch[i] = (Int8((self.lenght >> ((3 - i)*8)) & 0x0ff))
        }
        data.replaceBytes(in: NSMakeRange(0, 4), withBytes: ch)
    }
    mutating func writeInt(_ v: Int32) {
        var ch = [Int8](repeating: 0, count: 4)
        for i in 0..<4 {
//            ch[i] = ((v >> ((3 - i)*8)) & 0x0ff);
                        ch[i] = (Int8(Int32((v >> ((3 - i)*8)) & 0x0ff)))
        }
        self.data.append(ch, length: 4)
        lenght = lenght + 4;
    }
}


extension DataOutputStream {
    mutating func write(_ header: apiHeader) {
                writeShort(1)
        writeShort(0)
        writeShort(Int16(header.sid))
        writeShort(Int16(header.cid))
        writeShort(Int16(header.seq))
        writeShort(1)
    }
}
