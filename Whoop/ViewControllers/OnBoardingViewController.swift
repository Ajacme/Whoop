//
//  OnBoardingViewController.swift
//  ZaeemTest
//
//  Created by ZaeemZafar on 11/7/17.
//  Copyright © 2017 Abdul Baseer. All rights reserved.
//

import UIKit
import ImageSlideshow

class OnBoardingViewController: UIViewController {

    @IBOutlet weak var slideshowView: ImageSlideshow!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        slideshowView.setImageInputs([
            ImageSource(image: #imageLiteral(resourceName: "splash-screen-slider")),ImageSource(image: #imageLiteral(resourceName: "splash-screen-slider2")),ImageSource(image: #imageLiteral(resourceName: "splash-screen-slider3")),ImageSource(image: #imageLiteral(resourceName: "splash-screen-slider4"))
            ])
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
