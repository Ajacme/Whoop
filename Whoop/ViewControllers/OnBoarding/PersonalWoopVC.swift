//
//  PersonalWoopVC.swift
//  Whoop!
//
//  Created by Dilip manek on 31/10/17.
//  Copyright © 2017 Dilip manek. All rights reserved.
//

import UIKit

//class CellForIndexPage: UICollectionViewCell {
//    @IBOutlet weak var lblForText: UILabel!
//}

class PersonalWoopVC: UIViewController,UIScrollViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var Cons_BottomLabel: NSLayoutConstraint!

    @IBOutlet weak var pageControl: UIPageControl!
    private var actionSheet = UIAlertController()
    private var cameraController = UIImagePickerController()
    var x = 1
    @objc var scrollTimer:Timer?
        var isTakeImage = Bool()
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollTimer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(self.scrollingTimer), userInfo: nil, repeats: true)
        DispatchQueue.main.async {
            self.view.layoutIfNeeded()
            self.imgProfile.Round = true
        }
        if DeviceType.IS_IPHONE_5
        {
            Cons_BottomLabel.constant = 11
        }
        //imgProfile.layer.cornerRadius  = imgProfile.frame.size.width/2
    }
//    override func viewDidAppear(_ animated: Bool) {
//        imgProfile.Round = true
//
//    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK:- Status Bar Set Light Content
    override var prefersStatusBarHidden: Bool {
        return false
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    // MARK: - Click events..
    
    @IBAction func tapToGo(_ sender: UIButton) {
        if self.isTakeImage
        {
            if let objHomeVC = self.storyboard?.instantiateViewController(withIdentifier: "WhoopHappy") as? WhoopHappyViewController{
                objHomeVC.isGreen = false
                self.navigationController?.pushViewController(objHomeVC, animated: true)
            }
        }else{
            showAlert(title: "Alert", message: "Please first select any image")
        }
    }
    
    @IBAction func tapToSkip(_ sender: UIButton) {
        if let objHomeVC = self.storyboard?.instantiateViewController(withIdentifier: "WhoopHappy") as? WhoopHappyViewController{
            objHomeVC.isGreen = false
            self.navigationController?.pushViewController(objHomeVC, animated: true)
        }
    }
    @IBAction func tapToGetProfile(_ sender: UIControl) {
        
        let actionSheetController: UIAlertController = UIAlertController(title:nil, message: nil, preferredStyle: .actionSheet)
        
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel) { action -> Void in
        }
        actionSheetController.addAction(cancelAction)
        
        let choosePictureAction: UIAlertAction = UIAlertAction(title: "Photo Library", style: .default) { action -> Void in
            
            _ = self.startCameraFromViewController(self, sourceType:.photoLibrary, withDelegate:self as UIImagePickerControllerDelegate & UINavigationControllerDelegate)
        }
        actionSheetController.addAction(choosePictureAction)
        
        self.present(actionSheetController, animated: true, completion: nil)
        
        let takePictureAction: UIAlertAction = UIAlertAction(title: "Choose From Camera", style: .default) { action -> Void in
            
            _ = self.startCameraFromViewController(self, sourceType: .camera, withDelegate: self as UIImagePickerControllerDelegate & UINavigationControllerDelegate )
        }
        actionSheetController.addAction(takePictureAction)
        
    }
    //MARK: - ImagePicker Delegate Action
    
    func startCameraFromViewController(_ viewController: UIViewController,sourceType:UIImagePickerControllerSourceType, withDelegate delegate: UIImagePickerControllerDelegate & UINavigationControllerDelegate) -> Bool {
        
        if UIImagePickerController.isSourceTypeAvailable(sourceType) == false {
            return false
        }
        cameraController = UIImagePickerController()
        cameraController.sourceType = sourceType
        cameraController.allowsEditing = true
        cameraController.delegate = delegate
        present(cameraController, animated: true, completion: nil)
        return true
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        dismiss(animated: true, completion: nil)
        
        if let pickedImage = info[UIImagePickerControllerEditedImage] as? UIImage {
            self.isTakeImage = true
            imgProfile.image = pickedImage
        }
    }
    
    //MARK: - Set Value of Label
    @objc func scrollingTimer()
    {
                let contentOffset = scrollView.contentOffset.x as CGFloat
                let nextPage = NSInteger(contentOffset/scrollView.frame.size.width) + 1
               if self.x < 3 {
                self.x = self.x + 1
                scrollView.scrollRectToVisible(CGRect(x: CGFloat(nextPage) * scrollView.frame.size.width, y: 0, width: scrollView.frame.size.width, height: scrollView.frame.size.height), animated: true)
                }
               else{
                self.x = 0
                scrollView.scrollRectToVisible(CGRect(x: CGFloat(0) * scrollView.frame.size.width, y: 0, width: scrollView.frame.size.width, height: scrollView.frame.size.height), animated: false)
             }
    }
    
    // MARK: - ScrollView Delegate
    func scrollViewDidScroll(_ scrollView: UIScrollView)
    {
        pageControl.currentPage = Int(floor((scrollView.contentOffset.x - scrollView.frame.size.width / 2) / scrollView.frame.size.width)) + 1
    }
}
//extension PersonalWoopVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        let cellSize:CGSize = CGSize(width: self.collectionView.bounds.width, height: self.collectionView.frame.size.height - 45 )
//        return cellSize
//    }
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 3
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellForIndexPage", for: indexPath) as! CellForIndexPage
//        cell.lblForText.text = arrText[indexPath.row]
//        return cell
//  }
// }
