//
//  FirstIndexingVC.swift
//  Whoop!
//
//  Created by Dilip manek on 31/10/17.
//  Copyright © 2017 Dilip manek. All rights reserved.
//

import UIKit

class CellForPaging: UICollectionViewCell {
    
    @IBOutlet weak var lblForText: UILabel!
    @IBOutlet weak var imageHeader: UIImageView!
    @IBOutlet weak var Cons_TopImg: NSLayoutConstraint!
}

class FirstIndexingVC: UIViewController {
    @objc var scrollTimer:Timer?
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var Cons_BottomPaging: NSLayoutConstraint!
    
    var arrText = ["We've got your address.Verify it\nnow to unlock your home's button\nor use your personal Whoop!\nButton for 30 days. Find our more...","Verify your address to unlock \n your home's button.Once verified \n you can invite the \n people you live with. Or…","If someone you live with has\ngiven you a code it means your\nhome's button is unlocked and you\ncan add yourself straight away.","Or you can use your personal\nWhoop! Button for 30 days\nAfter 30 days you must unlock\nor join your home's button."]
    var arrImagesName = ["home","lock","share","banner_icon4"]
    var x = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        scrollTimer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(self.scrollingTimer), userInfo: nil, repeats: true)
        Cons_BottomPaging.constant = -38
        if DeviceType.IS_IPHONE_5
        {
            Cons_BottomPaging.constant = -22
        }
    }
    
    // MARK:- Status Bar Set Light Content
    override var prefersStatusBarHidden: Bool {
        return false
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - Set Value of Label
    @objc func scrollingTimer()
    {
        if self.x < 4 {
            let indexPath = IndexPath(item: x, section: 0)
            self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            self.x = self.x + 1
        } else {
            self.x = 0
            self.collectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .centeredHorizontally, animated: false)
        }
    }
    
    // MARK: - ScrollView Delegate
    func scrollViewDidScroll(_ scrollView: UIScrollView)
    {
        pageControl.currentPage = Int(floor((scrollView.contentOffset.x - scrollView.frame.size.width / 2) / scrollView.frame.size.width)) + 1
    }
    
    // MARK: - Click events..
    @IBAction func tapToPersonalWoop(_ sender: UIControl) {
        
        if let objPersonalWhoopVC = self.storyboard?.instantiateViewController(withIdentifier: "PersonalWoopVC") as? PersonalWoopVC{
            self.navigationController?.pushViewController(objPersonalWhoopVC, animated: true)
        }
    }
    @IBAction func tapToHomeWoop(_ sender: UIControl) {
        if let objHomeWhoopVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeWhoopVC") as? HomeWhoopVC{
                self.navigationController?.pushViewController(objHomeWhoopVC, animated: true)
        }
    }
//    // MARK: - ScrollView Delegate
//
//    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//        pageControl.currentPage = Int(floor((scrollView.contentOffset.x - scrollView.frame.size.width / 2) / scrollView.frame.size.width)) + 1
//    }
}
extension FirstIndexingVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
      let cellSize:CGSize = CGSize(width: self.collectionView.bounds.width, height: self.collectionView.frame.size.height - 50 )
        return cellSize
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellForPaging", for: indexPath) as! CellForPaging
         cell.lblForText.text = arrText[indexPath.row]
        cell.Cons_TopImg.constant = 24
        if DeviceType.IS_IPHONE_5
        {
            cell.Cons_TopImg.constant = 15
        }
          cell.imageHeader.image =  UIImage(named: arrImagesName[indexPath.row])
            return cell
    }
}
