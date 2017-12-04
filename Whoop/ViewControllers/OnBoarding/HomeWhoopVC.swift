//
//  HomeWhoopVC.swift
//  Whoop!
//
//  Created by Dilip manek on 01/11/17.
//  Copyright © 2017 Dilip manek. All rights reserved.
//

import UIKit

class HomeWhoopVC: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIScrollViewDelegate  {
    var isTakeImage = Bool()
    @IBOutlet weak var imgProfile: UIImageView!
    private var actionSheet = UIAlertController()
    private var cameraController = UIImagePickerController()
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var Cons_BottomLabel: NSLayoutConstraint!

    @objc var scrollTimer:Timer?
    var x = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollTimer = Timer.scheduledTimer(timeInterval: 15.0, target: self, selector: #selector(self.scrollingTimer), userInfo: nil, repeats: true)
        scrollView.contentSize = CGSize(width: 750, height: 400)
        scrollView.delegate = self
        DispatchQueue.main.async {
            self.view.layoutIfNeeded()
            self.imgProfile.Round = true
        }
        // Do any additional setup after loading the view.
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
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Click events..
    @IBAction func tapToGo(_ sender: UIButton) {
        if self.isTakeImage
        {
            let objHomeWhoopBoardingVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeWhoopOnBoardingVC") as! HomeWhoopOnBoardingVC
            objHomeWhoopBoardingVC.newImage = imgProfile.image
            self.navigationController?.pushViewController(objHomeWhoopBoardingVC, animated: true)
        }else{
            showAlert(title: "Alert", message: "Please select image to continue!")
        }
    }
    
    @IBAction func tapToSkip(_ sender: UIButton) {
        let objHomeWhoopBoardingVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeWhoopOnBoardingVC") as! HomeWhoopOnBoardingVC
        self.navigationController?.pushViewController(objHomeWhoopBoardingVC, animated: true)
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
        if self.x < 2 {
            self.x = self.x + 1
            print(CGFloat(nextPage) * scrollView.frame.size.width)
            print(scrollView.frame.size.width)
            print(scrollView.frame.size.height)
            scrollView.scrollRectToVisible(CGRect(x: CGFloat(nextPage) * scrollView.frame.size.width, y: 0, width: scrollView.frame.size.width, height: scrollView.frame.size.height), animated: true)
        }
        else{
            self.x = 0
            scrollView.scrollRectToVisible(CGRect(x: CGFloat(0) * scrollView.frame.size.width, y: 0, width: scrollView.frame.size.width, height: scrollView.frame.size.height), animated: false)
        }
    }
    
    // MARK: - ScrollView Delegate
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(floor((scrollView.contentOffset.x - scrollView.frame.size.width / 2) / scrollView.frame.size.width)) + 1
    }
//    func scrollViewDidScroll(_ scrollView: UIScrollView)
//    {
//        pageControl.currentPage = Int(floor((scrollView.contentOffset.x - scrollView.frame.size.width / 2) / scrollView.frame.size.width)) + 1
//    }
}
