//
//  ViewForCodePopUp.swift
//  Whoop!
//
//  Created by ACMEUNIVERSE MAC-2 on 29/11/17.
//  Copyright © 2017 Dilip manek. All rights reserved.
//

import UIKit

class ViewFor3xPopUpHome: UIView, UIScrollViewDelegate {

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet weak var lblDesc: MTLabel!
    @IBOutlet weak var lblTitle: MTLabel!
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var btnClose: UIButton!
    @IBOutlet weak var Cons_ViewTop: NSLayoutConstraint!
    
    
    @IBOutlet weak var firstDetailDescription: MTLabel!
    @IBOutlet weak var firstShortDescription: MTLabel!
    @IBOutlet weak var imgFirstIcon: UIImageView!
    @IBOutlet weak var lblFirstTitle: UILabel!
    
    
    var x = 1
    @objc var scrollTimer:Timer?
    var isWorking = false
    override init(frame:CGRect) {
        super.init(frame:frame)
        setup()
    }
    required init(coder aDecoder:NSCoder) {
        super.init(coder:aDecoder)!
        setup()
    }
    private func setup() {
        
//        scrollView.delegate = self
//        scrollTimer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(self.scrollingTimer), userInfo: nil, repeats: true)
    }
    
    //MARK: - Set Value of Label
    /*
    @objc func scrollingTimer()
    {
        let contentOffset = scrollView.contentOffset.x as CGFloat
        let nextPage = NSInteger(contentOffset/scrollView.frame.size.width) + 1
        if self.x < 4 {
            self.x = self.x + 1
            scrollView.scrollRectToVisible(CGRect(x: CGFloat(nextPage) * scrollView.frame.size.width, y: 0, width: scrollView.frame.size.width, height: scrollView.frame.size.height), animated: true)
        }
        else{
            self.x = 0
            scrollView.scrollRectToVisible(CGRect(x: CGFloat(0) * scrollView.frame.size.width, y: 0, width: scrollView.frame.size.width, height: scrollView.frame.size.height), animated: false)
        }
    }*/
    
    // MARK: - ScrollView Delegate
    func scrollViewDidScroll(_ scrollView: UIScrollView)
    {
        pageControl.currentPage = Int(floor((scrollView.contentOffset.x - scrollView.frame.size.width / 2) / scrollView.frame.size.width)) + 1
    }
}
