//
//  HeaderTVCell.swift
//  IOS_Test_RahulPatni
//
//  Created by Neosoft on 15/06/21.
//

import UIKit

class HeaderTVCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    let arrTempImages = ["https://cdn.pixabay.com/photo/2015/04/19/08/32/marguerite-729510_1280.jpg", "https://media.istockphoto.com/photos/white-daisies-in-a-meadow-lit-by-sunlight-picture-id941033510?k=6&m=941033510&s=612x612&w=0&h=6aPhM9N0EGTZNPXbX6VdJ3h9BOFhy9Sz3ME_5llTX3w=", "https://media.istockphoto.com/photos/daisy-flowers-picture-id471379177?s=612x612", "https://images.unsplash.com/photo-1612335120827-84755d23437d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1050&q=80", "https://images.unsplash.com/photo-1587320695845-48deec73667f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1350&q=80"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.pageControl.numberOfPages = self.arrTempImages.count
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.isPagingEnabled = true
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let width = UIScreen.main.bounds.width
        layout.itemSize = CGSize(width: width, height: 250)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        self.collectionView?.collectionViewLayout = layout
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.arrTempImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ImageCarocelCVCell
        let data = self.arrTempImages[indexPath.item]
        cell.imgView.setImageFromURl("\(data)")
        cell.imgView.contentMode = .scaleToFill
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width), height: 250)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}

extension HeaderTVCell {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let index = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
        self.pageControl?.currentPage = index
    }
}
