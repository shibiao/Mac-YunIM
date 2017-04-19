//
//  MainSessionListController.swift
//  MacOs-YunIM
//
//  Created by 牛辉 on 2017/3/21.
//  Copyright © 2017年 Niu. All rights reserved.
//

import Cocoa

class MainSessionListController: NSViewController,NSCollectionViewDelegate,NSCollectionViewDataSource,NSCollectionViewDelegateFlowLayout {

    
    @IBOutlet weak var collectionView: NSCollectionView!
    
    var sessions : [IMSessionModel] = []
    
    let grayColor = NSColor(red:0.95, green:0.95, blue:0.95, alpha:1.00)
    override func viewDidLoad() {
        super.viewDidLoad()
        view.wantsLayer = true
        view.layer?.backgroundColor = grayColor.cgColor
        collectionView.wantsLayer = true
        collectionView.layer?.backgroundColor = grayColor.cgColor
        collectionView.backgroundView?.wantsLayer = true
        collectionView.backgroundView?.layer?.backgroundColor = grayColor.cgColor
        collectionView.delegate = self
        collectionView.dataSource = self
        let nib = NSNib(nibNamed: "MainSessionItem", bundle: nil)
        collectionView.register(nib, forItemWithIdentifier: "MainSessionItem")
        let layout = NSCollectionViewFlowLayout()
        layout.minimumLineSpacing = 0.5
        collectionView.collectionViewLayout = layout
        getSssions()
    }
    func getSssions() {
        IMChatMob.imSessionManager.loadSession { (sessions) in
            self.sessions = sessions
            self.collectionView.reloadData()
        }
    }
    func collectionView(_ collectionView: NSCollectionView, layout collectionViewLayout: NSCollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> NSSize {
        return NSMakeSize(self.collectionView.frame.size.width, 80)
    }
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return sessions.count
    }
    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {

        let item = collectionView.makeItem(withIdentifier: "MainSessionItem", for: indexPath) as! MainSessionItem
        return item 

    }
}
