//
//  MainSessionItem.swift
//  MacOs-YunIM
//
//  Created by 牛辉 on 2017/3/21.
//  Copyright © 2017年 Niu. All rights reserved.
//

import Cocoa

class MainSessionItem: NSCollectionViewItem {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.wantsLayer = true
        view.layer?.backgroundColor = NSColor(red:0.91, green:0.91, blue:0.91, alpha:1.00).cgColor
        
//        backgroundView.wantsLayer = true
//        backgroundView.layer?.backgroundColor = normalColor.cgColor

    
    }
    
}
