//
//  SettingsMenuModelClass.swift
//  Whoop!
//
//  Created by Dilip Manek on 06/11/17.
//  Copyright © 2017 Dilip manek. All rights reserved.
//

import Foundation
import UIKit

//MAEK: - Setting Menu Model Class
class ModelSectionDataSettingMenuSection {
    var strSectionTitle = ""
    var imgSectionImage: UIImage = UIImage()
    var imgDropDown: UIImage = UIImage()
    var imgDropDownBottom: UIImage = UIImage()

    var isSectionselected: Bool = false
    var subMenuData = [ModelSubDataSettingMenu]()
    
    //    memory Allocation
    init(strSectionTitle: String = "", imgSectionImage: UIImage = UIImage(), imgDropDown: UIImage = UIImage(),imgDropDownBottom: UIImage = UIImage(), isSectionselected: Bool = false, subMenuData: [ModelSubDataSettingMenu] = [ModelSubDataSettingMenu]()) {
        self.strSectionTitle = strSectionTitle
        self.imgSectionImage = imgSectionImage
        self.imgDropDown = imgDropDown
        self.imgDropDownBottom = imgDropDownBottom
        self.isSectionselected = isSectionselected
        self.subMenuData = subMenuData
    }
}

class ModelSubDataSettingMenu {
    
    var strSectionTitle = ""
    var imgSectionImage: UIImage = UIImage()
    var isSectionselected: Bool = false
    
    //    memory Allocation
    init(strSectionTitle: String = "", imgSectionImage: UIImage = UIImage()) {
        self.strSectionTitle = strSectionTitle
        self.imgSectionImage = imgSectionImage
    }
}
