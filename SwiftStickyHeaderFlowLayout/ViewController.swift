//
//  ViewController.swift
//  SwiftStickyHeaderFlowLayout
//
//  Created by Shaowei Zhang on 15/7/25.
//  Copyright © 2015年 Shaowei Zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = self.collectionView.collectionViewLayout as! CSStickyHeaderFlowLayout
        if layout.isKindOfClass(CSStickyHeaderFlowLayout){
            layout.parallaxHeaderReferenceSize = CGSizeMake(self.view.frame.size.width, 200)
        }
        
        let headerNib = UINib(nibName: "CSGrowHeader", bundle: nil)
        self.collectionView!.registerNib(headerNib, forSupplementaryViewOfKind: CSStickyHeaderParallaxHeader, withReuseIdentifier: "header")
        let sectionHeaderNib = UINib(nibName: "CSGrowSectionHeader", bundle: nil)
        
        self.collectionView!.registerNib(sectionHeaderNib, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "sectionHeader")
    }
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        if kind == CSStickyHeaderParallaxHeader {
            let cell = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "header", forIndexPath: indexPath)
            return cell
        } else if kind == UICollectionElementKindSectionHeader {
            let cell = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "sectionHeader", forIndexPath: indexPath)
            cell.backgroundColor = UIColor.yellowColor()
            return cell
        }else{
            let cell = UICollectionReusableView()
            return cell
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        // Locate your layout
    }
    
    //Section Header 的个数
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 5
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return 1
    }
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! customCollectionViewCell
        cell.cellLabel.text = "I am Pikachu"
        cell.cellImage.image = UIImage(named: "pikachu")
        return cell
    }
}

