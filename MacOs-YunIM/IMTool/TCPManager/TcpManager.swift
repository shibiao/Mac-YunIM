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
    var receiveBuffer   = NSMutableData()
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
    func receiveData(){
        var buffer = [UInt8](repeating: 0, count: 1024)
        let len = inputStream?.read(&buffer, maxLength: buffer.count)
        if let len = len {
            if len > 0 {
                receiveLock?.lock()
                receiveBuffer.append(buffer, length: len)
                while buffer.count >= 16 {
                    var range = NSRange(location: 0, length: 16)
                    let headerData = receiveBuffer.subdata(with: range)
                    let inputData = DataInputStream(headerData as NSData)
                    let dataLen = inputData.readInt()
                    if dataLen > Int32(receiveBuffer.length) {
                        //如果协议头里面包长大于buffer长度 说明数据还没有接收完
                        break
                    }
                    _               = inputData.readShort()
                    _               = inputData.readShort()
                    let serviceId   = inputData.readShort()
                    let commandId   = inputData.readShort()
                    let reserved    = inputData.readShort()
                    _               = inputData.readShort()
                    SLog("收到信息 服务id=\(serviceId) 命令id=\(commandId) 序列号=\(reserved)")
                    range = NSRange(location: 16, length: dataLen - 16)
                    let loadData = receiveBuffer.subdata(with: range) as NSData
                    let remainLen = Int32(receiveBuffer.length) - dataLen
                    range = NSRange(location: Int(dataLen), length: Int(remainLen))
                    let remainData = receiveBuffer.subdata(with: range)
                    receiveBuffer.setData(remainData)
                    if loadData.length > 0 {
                        APIRouter.manager.receive(loadData, (Int(serviceId),Int(commandId),Int(reserved)))
                    }
                    
                }
            }
        } else {
            SLog("没有数据")
        }
    }
    //MARK: 发送数据
    func send(_ data: NSData) {
        
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
