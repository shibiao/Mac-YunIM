//
//  TcpManager.swift
//  MacOs-YunIM
//
//  Created by 牛辉 on 2017/4/1.
//  Copyright © 2017年 Niu. All rights reserved.
//

import Cocoa
class TcpManager :NSObject, StreamDelegate {
    
    static let share = TcpManager()
    private override init() {}
    var inputStream     :   InputStream?
    var outputStream    :   OutputStream?
    var receiveLock     :   NSLock?          = NSLock()
    var sendLock        :   NSLock?          = NSLock()
    //MARK: 创建socket链接
    func connect(_ ip: String ,_ port: Int32,_ status: Int = 1) {
        Stream.stream(ip, port, input: &inputStream, output: &outputStream)
        inputStream?.delegate = self
        outputStream?.delegate = self
        inputStream?.schedule(in: RunLoop.current, forMode: RunLoopMode.defaultRunLoopMode)
        outputStream?.schedule(in: RunLoop.current, forMode: RunLoopMode.defaultRunLoopMode)
        inputStream?.open()
        outputStream?.open()
    }
    //MARK: 结束socket链接
    func disconnect() {
        receiveLock = nil
        sendLock    = nil
        inputStream?.close()
        outputStream?.close()
        inputStream?.remove(from: RunLoop.current, forMode: RunLoopMode.defaultRunLoopMode)
        outputStream?.remove(from: RunLoop.current, forMode: RunLoopMode.defaultRunLoopMode)
        inputStream = nil
        outputStream = nil
    }
    func stream(_ aStream: Stream, handle eventCode: Stream.Event) {
        switch eventCode {
        case Stream.Event.openCompleted:// 建立连接完成
            break
        case Stream.Event.endEncountered:// 结束事件
            break
        case Stream.Event.errorOccurred:// 发生错误
            break
        case Stream.Event.hasBytesAvailable://接受数据
            break
        case Stream.Event.hasSpaceAvailable://发送数据
            break
        default: break
            
        }
    }
}
extension Stream {
    class func stream(_ ip: String ,_ port: Int32, input: inout InputStream? , output: inout OutputStream?){
        var host : CFHost
        var inputStream:  Unmanaged<CFReadStream>?
        var outputStream: Unmanaged<CFWriteStream>?
        host = CFHostCreateWithName(nil, ip as CFString) as! CFHost
        CFStreamCreatePairWithSocketToCFHost(nil, host, port, &inputStream, &outputStream)
        if ((inputStream != nil) && (outputStream != nil)) {
            input = inputStream!.takeUnretainedValue();
            output = outputStream!.takeUnretainedValue();
        }
    }
}
