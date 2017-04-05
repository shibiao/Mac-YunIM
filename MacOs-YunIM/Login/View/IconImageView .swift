//
//  IconImageView .swift
//  MacOs-YunIM
//
//  Created by Mac on 2017/4/4.
//  Copyright © 2017年 Niu. All rights reserved.
//

import Cocoa
//云沃克图标
class IconImageView: NSImageView {
    //点击图片可以移动窗口
    override var mouseDownCanMoveWindow: Bool{
        return true
    }
}
