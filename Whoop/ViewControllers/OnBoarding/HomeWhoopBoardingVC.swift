//
//  HomeWhoopBoardingVC.swift
//  Whoop!
//
//  Created by Dilip manek on 02/11/17.
//  Copyright © 2017 Dilip manek. All rights reserved.
//

import UIKit

class CellForHomeBoarding: UICollectionViewCell {
    
    @IBOutlet weak var lblForTitle: UILabel!
    @IBOutlet weak var imageHeader: UIImageView!
    @IBOutlet weak var lblForDesc: UILabel!
    @IBOutlet weak var Cons_ImageHeight: NSLayoutConstraint!

}

class HomeWhoopBoardingVC: UIViewController {
    
    @IBOutlet weak var imageTop: UIImageView!
    @IBOutlet weak var imageLeft: UIImageView!
    @IBOutlet weak var imageRight: UIImageView!
    @IBOutlet weak var imageBottom: UIImageView!
     var newImage: UIImage!
    @objc var scrollTimer:Timer?
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    var x = 1
    var arrScrollData = [[String : Any]]()
    var objCodePopUp = ViewForCodePopUp()

    override func viewDidLoad() {
        super.viewDidLoad()
        if newImage != nil{
            imageTop.image = newImage
        }
        scrollTimer = Timer.scheduledTimer(timeInterval: 8.0, target: self, selector: #selector(self.scrollingTimer), userInfo: nil, repeats: true)
        arrScrollData  = [
                        ["image" : "adress","title" : "Choose how to verify your address","Desc":"You should unlock your home's button as quickly as\npossible so you can make bigger savings. You can\nverify your address in two ways. Swipe to see them "],
                        ["image" : "by_code","title" : "By Code","Desc":"We'll simply pop a unique code in the post and all\nyou need to do is to enter the code in the app when\nit arrives."],
                        ["image" : "by_card","title" : "By Card","Desc":"You can quickly verify your address with your debit\ncard if it is registered to your home address.Just tap\nby card to get started. "]
                        ]

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK:- Status Bar Set Light Content
    override var prefersStatusBarHidden: Bool {
        return false
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - Click events..
    @IBAction func tapToBycode(_ sender: UIButton) {
        
        self.customChatView()
    }
    
    @IBAction func tapToByCard(_ sender: UIButton) {
        if let objHomeVC = self.storyboard?.instantiateViewController(withIdentifier: "WhoopButtonViewController") as?   WhoopButtonViewController{
            self.navigationController?.pushViewController(objHomeVC, animated: true)
        }
        
    }
    @IBAction func tapToPopupClose(_ sender: UIButton) {
        self.objCodePopUp.removeFromSuperview()
        self.objCodePopUp.Cons_ViewTop.constant = 1000
        
        if let objHomeVC = self.storyboard?.instantiateViewController(withIdentifier: "WhoopHappy") as? WhoopHappyViewController{
            objHomeVC.isGreen = true
            self.navigationController?.pushViewController(objHomeVC, animated: true)
        }
        
    }
    //MARK: - Set Value of Label
    @objc func scrollingTimer()
    {
        if self.x < 3 {
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
    
    // MARK: - CustumeView Design For PopUp
    func customChatView()  {
        objCodePopUp = Bundle.main.loadNibNamed("ViewForCodePopUp", owner: self, options: nil)?.first as! ViewForCodePopUp
        self.objCodePopUp.frame = CGRect(x: 0, y:0, width:ScreenSize.WIDTH, height:ScreenSize.HEIGHT)
        objCodePopUp.lblTitle.text = "By Code"
        objCodePopUp.lblDesc.text = "Thanks!We're posting you a\nunique code today. Just enter it to\nverify your address to finish\nunlocking your home's button and\nstart inviting the people you live\n with. Until then you can use your\n personal button."
        objCodePopUp.backgroundColor = UIColor.clear
        self.view.addSubview(objCodePopUp)
        UIView.animate(withDuration: 0.5) {
            //self.objCodePopUp.alpha = 0.5
            self.objCodePopUp.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.5)
           self.objCodePopUp.Cons_ViewTop.constant = 40
            self.view.layoutIfNeeded()
        }
        self.objCodePopUp.btnClose.addTarget(self, action: #selector(self.tapToPopupClose(_:)), for: .touchUpInside)
        self.objCodePopUp.btnCancel.addTarget(self, action: #selector(self.tapToPopupClose(_:)), for: .touchUpInside)
    }
}
extension HomeWhoopBoardingVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let cellSize:CGSize = CGSize(width: self.collectionView.bounds.width, height: self.collectionView.frame.size.height)
        return cellSize
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellForHomeBoarding", for: indexPath) as! CellForHomeBoarding
        let dic = arrScrollData[indexPath.row]
        cell.lblForTitle.text = dic["title"] as? String
        cell.lblForDesc.text = dic["Desc"] as? String
//        if indexPath.row == 2
//        {
//            cell.Cons_ImageHeight.constant = 0
//        }else
//        {
            cell.Cons_ImageHeight.constant = 90
//        }
        cell.imageHeader.image =  UIImage(named: dic["image"] as! String)
        return cell
    }
}
