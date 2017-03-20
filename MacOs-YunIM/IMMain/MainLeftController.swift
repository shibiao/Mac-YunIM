//
//  MainLeftController.swift
//  MacOs-YunIM
//
//  Created by 牛辉 on 2017/3/21.
//  Copyright © 2017年 Niu. All rights reserved.
//

import Cocoa
import Kingfisher

class MainLeftController: NSViewController {
    
    @IBOutlet weak var userIcon: NSImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.wantsLayer = true
        view.layer?.backgroundColor = NSColor(red:0.15, green:0.15, blue:0.15, alpha:1.00).cgColor
        
        let iconUrl = URL(string: UserPofile.avatar)
        userIcon.kf.setImage(with: ImageResource(downloadURL:iconUrl!))
    }
    
}
