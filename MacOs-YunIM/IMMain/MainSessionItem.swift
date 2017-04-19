//
//  MainSessionItem.swift
//  MacOs-YunIM
//
//  Created by 牛辉 on 2017/3/21.
//  Copyright © 2017年 Niu. All rights reserved.
//

import Cocoa

class MainSessionItem: NSCollectionViewItem {
    let normalColor = NSColor(red:0.96, green:0.96, blue:0.96, alpha:1.00)
    let selectedColor = NSColor(red:0.86, green:0.86, blue:0.86, alpha:1.00)
    //背景视图
    @IBOutlet weak var backgroundView: NSView!
    @IBOutlet weak var name: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundView.wantsLayer = true
        backgroundView.layer?.backgroundColor = normalColor.cgColor
    }
    //当collectionView item被选中时，改变颜色并更新颜色
    override var isSelected: Bool{
        didSet {
            super.isSelected = isSelected
            updateColor()
        }
    }
    func updateColor() {
        if isSelected {
            switch highlightState {
            case .none, .forDeselection:
                backgroundView.layer?.backgroundColor = normalColor.cgColor
            case .forSelection:
                backgroundView.layer?.backgroundColor = selectedColor.cgColor
            default:
                break
            }
        }else{
            backgroundView.layer?.backgroundColor = normalColor.cgColor
        }
    }

}
