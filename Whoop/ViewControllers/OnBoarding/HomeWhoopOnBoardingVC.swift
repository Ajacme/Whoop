//
//  HomeWhoopOnBoardingVC.swift
//  Whoop!
//
//  Created by Dilip manek on 01/11/17.
//  Copyright © 2017 Dilip manek. All rights reserved.
//

import UIKit

class HomeWhoopOnBoardingVC: UIViewController {

    @IBOutlet weak var imageTop: UIImageView!
    @IBOutlet weak var imageLeft: UIImageView!
    @IBOutlet weak var imageRight: UIImageView!
    @IBOutlet weak var imageBottom: UIImageView!
      var newImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if newImage != nil{
            imageTop.image = newImage
        }
        self.navigationController?.navigationBar.barTintColor = UIColor.clear
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
    @IBAction func tapToHomeWhoopButtonCode(_ sender: UIControl) {
        
        let objHomeWhoopBoardingVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeWhoopBoardingVC") as! HomeWhoopBoardingVC
        if newImage != nil{
            objHomeWhoopBoardingVC.newImage = newImage
        }
        self.navigationController?.pushViewController(objHomeWhoopBoardingVC, animated: true)
    }
    @IBAction func tapToEnterCode(_ sender: UIControl) {
        let objEnterCodeVCVC = self.storyboard?.instantiateViewController(withIdentifier: "EnterCodeVC") as! EnterCodeVC
        if newImage != nil{
            objEnterCodeVCVC.newImage = newImage
        }
        self.navigationController?.pushViewController(objEnterCodeVCVC, animated: true)
    }
    @IBAction func tapToChangeAddress(_ sender: UIButton) {
    }
}
