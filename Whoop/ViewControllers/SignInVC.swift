//
//  SignInVC.swift
//  ZaeemTest
//
//  Created by Abdul Baseer on 07/11/2017.
//  Copyright © 2017 Abdul Baseer. All rights reserved.
//

import UIKit

class SignInVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.tintColor = UIColor.white
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.tintColor = UIColor.clear
    }
    // MARK: - Buuton Click Events
    @IBAction func tapSignInButton(_ sender: Any) {
        
        if let objHomeVC = self.storyboard?.instantiateViewController(withIdentifier: "WhoopButtonViewController") as?   WhoopButtonViewController{
            objHomeVC.isRed = true
            self.navigationController?.pushViewController(objHomeVC, animated: true)
        }
        
        //old Flow
        /*if let objHomeVC = self.storyboard?.instantiateViewController(withIdentifier: "FirstIndexingVC") as? FirstIndexingVC{
            self.navigationController?.pushViewController(objHomeVC, animated: true)
        }*/
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
