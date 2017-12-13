//
//  ForgotPasswordVC.swift
//  ZaeemTest
//
//  Created by Abdul Baseer on 07/11/2017.
//  Copyright © 2017 Abdul Baseer. All rights reserved.
//

import UIKit

class ForgotPasswordVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        _ = addRightBarButton(withImage: #imageLiteral(resourceName: "cancel_icon"), text: nil, action: #selector(closeVC))
        navigationItem.setHidesBackButton(true, animated:true);
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

    @objc func closeVC() {
        let _ = navigationController?.popViewController(animated: true)
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

extension UIViewController {
    func addRightBarButton(withImage image: UIImage?, text: String?, action: Selector?) -> UIBarButtonItem {
        let barButton = UIBarButtonItem(title: text, style: .plain, target: self, action: action)
        barButton.image = image
        barButton.tintColor = UIColor.white
        barButton.setTitleTextAttributes(
            [NSAttributedStringKey.foregroundColor: UIColor.white],
            for: .disabled
        )
        /*barButton.setTitleTextAttributes(
         [
         NSForegroundColorAttributeName: UIColor.white,
         NSFontAttributeName: UIFont.frMedium(ofSize: 13)
         ],
         for: .normal
         )*/
        self.navigationItem.rightBarButtonItem = barButton
        return barButton
    }
}
