//
//  Helper.swift
//  CommonClass
//
//  Created by Devubha Manek on 5/2/16.
//  Copyright © 2016 Devubha Manek. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation
import QuartzCore

//prod
//dev
public let build_type = "prod"
public let apiversion = 1.0
//let UserIDGlobal = UserDefaults.Main.string(forKey:.UserID)


var isAllUpdated : Int = 0
//MARK: - Web Services Constant
struct WebURL {
    
    
}
// Weekday
extension Date {
    func dayOfWeek() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self).capitalized
        // or capitalized(with: locale)
    }
    func monthName() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM"
        return dateFormatter.string(from: self).capitalized
        // or capitalized(with: locale)
    }
    func dayName() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd"
        return dateFormatter.string(from: self).capitalized
        // or capitalized(with: locale)
    }
    func dayNumberOfWeek() -> Int? {
        return Calendar.current.dateComponents([.weekday], from: self).weekday
    }
}
extension UIColor{
    class func AppTheme() -> UIColor{
        return UIColor(red: 253.0 / 255.0, green: 89.0 / 255.0, blue: 24.0 / 255.0, alpha: 1.0)
    }
    class func LightAppTheme() -> UIColor{
        return UIColor(red: 251.0 / 255.0, green: 117.0 / 255.0, blue: 43.0 / 255.0, alpha: 0.5)
    }
    class func AppSkyGreen() -> UIColor{
        return UIColor(red: 24.0 / 255.0, green: 199.0 / 255.0, blue: 187.0 / 255.0, alpha: 1.0)
    }
    class func AppTransparentGrey() -> UIColor{
        return UIColor(red: 116.0 / 255.0, green: 116.0 / 255.0, blue: 116.0 / 255.0, alpha: 0.4)
    }
    class func AppGrey() -> UIColor{
        return UIColor(red: 227.0 / 255.0, green: 232.0 / 255.0, blue: 238.0 / 255.0, alpha: 1.0)
    }
    class func AppSkyLight() -> UIColor{
        return UIColor(red: 237.0 / 255.0, green: 243.0 / 255.0, blue: 247.0 / 255.0, alpha: 1.0)
    }
    class func connectGrey() -> UIColor{
        return UIColor(red: 146.0 / 255.0, green: 150.0 / 255.0, blue: 159.0 / 255.0, alpha: 1.0)
    }
    class func AppRed() -> UIColor{
        return UIColor(red: 216.0 / 255.0, green: 97.0 / 255.0, blue: 97.0 / 255.0, alpha: 1.0)
    }
}

extension UIControl{
    
    func activeConnect() {
        self.backgroundColor = UIColor.AppTheme()
    }
    func InactiveConnect() {
        self.backgroundColor = UIColor.connectGrey()
    }
    
    
    
}
//MARK: - Bozzii Group Type
enum group_id : Int {
    case Connect_Yak = 1,Job_Board,Buy_Sell,Rideshare,Bozzii_Media,Bozzii_Jokes,Employer_Review,Advert
}
//MARK: - Device Type
enum UIUserInterfaceIdiom : Int {
    case Unspecified
    case Phone
    case Pad
}
struct DeviceType {
    static let IS_IPHONE_4_OR_LESS  = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH < 568.0
    static let IS_IPHONE_5          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 568.0
    static let IS_IPHONE_6          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 667.0
    static let IS_IPHONE_6PLUS      = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 736.0
    static let IS_IPAD              = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.SCREEN_MAX_LENGTH == 1024.0
    static let IS_IPAD_PRO          = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.SCREEN_MAX_LENGTH == 1366.0
}

//MARK: - Screen Size
struct ScreenSize {
    static let WIDTH         = UIScreen.main.bounds.size.width
    static let HEIGHT        = UIScreen.main.bounds.size.height
    static let SCREEN_MAX_LENGTH    = max(ScreenSize.WIDTH, ScreenSize.HEIGHT)
    static let SCREEN_MIN_LENGTH    = min(ScreenSize.WIDTH, ScreenSize.HEIGHT)
}
//MARK: - StoryBoards Constant
struct storyBoards {
    
    static let Main = UIStoryboard(name: "Main", bundle: Bundle.main)
}

//MARK: - Font Layout
struct FontName {
    //Font Name List
    static let HelveticaNeueBoldItalic = "HelveticaNeue-BoldItalic"
    static let HelveticaNeueLight = "HelveticaNeue-Light"
    static let HelveticaNeueUltraLightItalic = "HelveticaNeue-UltraLightItalic"
    static let HelveticaNeueCondensedBold = "HelveticaNeue-CondensedBold"
    static let HelveticaNeueMediumItalic = "HelveticaNeue-MediumItalic"
    static let HelveticaNeueThin = "HelveticaNeue-Thin"
    static let HelveticaNeueMedium = "HelveticaNeue-Medium"
    static let HelveticaNeueThinItalic = "HelveticaNeue-ThinItalic"
    static let HelveticaNeueLightItalic = "HelveticaNeue-LightItalic"
    static let HelveticaNeueUltraLight = "HelveticaNeue-UltraLight"
    static let HelveticaNeueBold = "HelveticaNeue-Bold"
    static let HelveticaNeue = "HelveticaNeue"
    static let HelveticaNeueCondensedBlack = "HelveticaNeue-CondensedBlack"
    static let SatteliteRegular = "Satellite"
    static let SatteliteOblique = "Satellite-Oblique"
    static let AvenirBlack = "Avenir-Black"
    static let AvenirHeavy = "Avenir-Heavy"
    static let AvenirRoman = "Avenir-Roman"
    static let AvenirMedium = "Avenir-Medium"
    static let DKNewBeginnings = "DKNewBeginnings"
    static let RobotoRegular = "Roboto-Regular"
    
}

func showAlert(title: NSString, message: String) {
    
    let obj = UIAlertView(title: title as String, message: message, delegate: nil, cancelButtonTitle:"OK")
    obj.show()
}
func setFontLayout(strFontName:String,fontSize:CGFloat) -> UIFont {
    //Set auto font size in different devices.
    return UIFont(name: strFontName, size: (ScreenSize.WIDTH / 375) * fontSize)!
}
//MARK: - Set Color Method
func setColor(r: Float, g: Float, b: Float, aplha: Float)-> UIColor {
    return UIColor(red: CGFloat(Float(r / 255.0)), green: CGFloat(Float(g / 255.0)) , blue: CGFloat(Float(b / 255.0)), alpha: CGFloat(aplha))
}
//MARK: - Color
struct Color
{
    static let textColor = UIColor(red: 0.92, green: 0.92, blue: 0.92, alpha: 1.0)
    static let keyboardHeaderColor = UIColor(red: 35.0 / 255.0, green: 116.0 / 255.0, blue: 185.0 / 255.0, alpha: 1.0)
}
//MARK: - check string nil
func createString(value: AnyObject) -> String
{
    var returnString: String = ""
    if let str: String = value as? String
    {
        returnString = str
    }
    else if let str: Int = value as? Int
    {
        returnString = String.init(format: "%d", str)
    }
        
    else if let _: NSNull = value as? NSNull
    {
        returnString = String.init(format: "")
    }
    return returnString
}

//MARK: - check string nil
func createFloatToString(value: AnyObject) -> String
{
    var returnString: String = ""
    if let str: String = value as? String
    {
        returnString = str
    }
    else if let str: Float = value as? Float
    {
        returnString = String.init(format: "%.2f", str)
    }
    else if let _: NSNull = value as? NSNull
    {
        returnString = String.init(format: "")
    }
    return returnString
}
func UTCToLocal(date:String) -> String {
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
    
    let dt = dateFormatter.date(from: date)
    dateFormatter.timeZone = TimeZone.current
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    var str = ""
    if dt != nil
    {
        str = dateFormatter.string(from: dt!)
    }
    return str
}
func timeAgoSinceDate(_ datetodisplay:String, numericDates:Bool) -> String {
    
    
    let display = UTCToLocal(date: datetodisplay)
    
    
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    
    guard let date = formatter.date(from: display)  else {
        return ""
    }
    
    let currentDate = Date()
    let calendar = Calendar.current
    
    let now = currentDate
    let earliest = (now as NSDate).earlierDate(date)
    let latest = (earliest == now) ? date : now
    
    let components:DateComponents = (calendar as NSCalendar).components([NSCalendar.Unit.minute , NSCalendar.Unit.hour , NSCalendar.Unit.day , NSCalendar.Unit.weekOfYear , NSCalendar.Unit.month , NSCalendar.Unit.year , NSCalendar.Unit.second], from: earliest, to: latest, options: NSCalendar.Options())
    
    if (components.year! >= 2) {
        return "\(components.year!) years ago"
    } else if (components.year! >= 1){
        if (numericDates){
            return "1 year ago"
        } else {
            return "Last year"
        }
    } else if (components.month! >= 2) {
        return "\(components.month!) months ago"
    } else if (components.month! >= 1){
        if (numericDates){
            return "1 month ago"
        } else {
            return "Last month"
        }
    } else if (components.weekOfYear! >= 2) {
        return "\(components.weekOfYear!) weeks ago"
    } else if (components.weekOfYear! >= 1){
        if (numericDates){
            return "1 week ago"
        } else {
            return "Last week"
        }
    } else if (components.day! >= 2) {
        return "\(components.day!) days ago"
    } else if (components.day! >= 1){
        if (numericDates){
            return "1 day ago"
        } else {
            return "Yesterday"
        }
    } else if (components.hour! >= 2) {
        return "\(components.hour!) hours ago"
    } else if (components.hour! >= 1){
        if (numericDates){
            return "1 hour ago"
        } else {
            return "An hour ago"
        }
    } else if (components.minute! >= 2) {
        return "\(components.minute!) minutes ago"
    } else if (components.minute! >= 1){
        if (numericDates){
            return "1 minute ago"
        } else {
            return "A minute ago"
        }
    } else if (components.second! >= 3) {
        return "\(components.second!) seconds ago"
    } else {
        return "Just now"
    }
    
}
func getTimeFromFullDate(_ datetodisplay:String, numericDates:Bool) -> String {
    
    let display = UTCToLocal(date: datetodisplay)
    
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    let date = formatter.date(from: display)
    formatter.dateFormat = "HH:mm"
    let strTime = formatter.string(from: date!)
    return strTime
    
}
func createDoubleToString(value: AnyObject) -> String
{
    var returnString: String = ""
    if let str: String = value as? String
    {
        returnString = str
    }
    else if let str: Float = value as? Float
    {
        returnString = String.init(format: "%f", str)
    }
    else if let _: NSNull = value as? NSNull
    {
        returnString = String.init(format: "")
    }
    return returnString
}
//MARK: - check string nil
func createIntToString(value: AnyObject) -> String
{
    var returnString: String = ""
    if let str: String = value as? String
    {
        returnString = str
    }
    else if let str: Int = value as? Int
    {
        returnString = String.init(format: "%d", str)
    }
    else if let _: NSNull = value as? NSNull
    {
        returnString = String.init(format: "")
    }
    return returnString
}

func createStringToint(value: AnyObject) -> Int
{
    var returnString: Int = 0
    
    if  value as! String == ""
    {
        returnString = 0
    }else{
        returnString = Int(value as! String)!
    }
    
    return returnString
}
func creatArray(value: AnyObject) -> NSMutableArray
{
    var tempArray = NSMutableArray()
    
    if let arrData: NSArray = value as? NSArray
    {
        tempArray = NSMutableArray.init(array: arrData)
    }
    else if let _: NSNull = value as? NSNull
    {
        tempArray = NSMutableArray.init()
    }
    
    return tempArray
}
class CircleControl: UIControl {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateCornerRadius()
    }
    
    private func updateCornerRadius() {
        layer.cornerRadius = min(bounds.width, bounds.height) / 2
    }
}
func creatDictnory(value: AnyObject) -> NSMutableDictionary
{
    var tempDict = NSMutableDictionary()
    
    if let DictData: NSDictionary = value as? NSDictionary
    {
        tempDict = NSMutableDictionary.init()
        tempDict.addEntries(from:DictData as! [AnyHashable : Any])
    }
    else if let _: NSNull = value as? NSNull
    {
        tempDict = NSMutableDictionary.init()
    }
    
    return tempDict
}
//MARK: - Scaling
struct DeviceScale {
    static let SCALE_X = ScreenSize.WIDTH / 375.0
    static let SCALE_Y = ScreenSize.HEIGHT / 667.0
}

//MARK: - Helper Class
class Helper {
    //MARK: - Shared Instance
    static let sharedInstance : Helper = {
        let instance = Helper()
        return instance
    }()
    
    static let isDevelopmentBuild:Bool = true
    
    //MARK: - Convert Second TO Hours,Minutes and Seconds
    func secondsToHoursMinutesSeconds (seconds : Int) -> (Int, Int, Int) {
        return (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
    }
    //MARK: - Add zero before single digit
    func addZeroBeforeDigit(number: Int) -> String {
        return ((number > 9) ? (String.init(format: "%d", number)) : (String.init(format: "0%d", number)))
    }
}
extension String {
    
    func isEmail() -> Bool {
        let regex = try? NSRegularExpression(pattern: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}", options: .caseInsensitive)
        
        return regex?.firstMatch(in: self, options: [], range: NSMakeRange(0, self.characters.count)) != nil
    }
    
    func isStringWithoutSpace() -> Bool{
        return !self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).isEmpty
    }
}
//MARK: - UILabel Extension
extension UILabel {
    //Set line spacing between two lines.
    func setLineHeight(lineHeight: CGFloat) {
        let text = self.text
        if let text = text {
            let attributeString = NSMutableAttributedString(string: text)
            let style = NSMutableParagraphStyle()
            
            style.lineSpacing = lineHeight
            attributeString.addAttribute(NSAttributedStringKey.paragraphStyle, value: style, range: NSMakeRange(0, text.characters.count))
            self.attributedText = attributeString
        }
    }
    //Get dynamic height
    func requiredHeight() -> CGFloat {
        let label:UILabel = UILabel(frame: CGRect(x: 0,y: 0,width: self.frame.width, height : CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = self.font
        label.text = self.text
        label.sizeToFit()
        return label.frame.height
    }
    //Get dynamic width
    func requiredWidth() -> CGFloat {
        let label:UILabel = UILabel(frame: CGRect(x: 0,y: 0,width: self.frame.width,height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = self.font
        label.text = self.text
        label.sizeToFit()
        return label.frame.width
    }
    
    
}
func estimateFrameForText(text: String ,height :CGFloat) -> CGRect {
    //we make the height arbitrarily large so we don't undershoot height in calculation
    let width: CGFloat =  75
    
    let size = CGSize(width: width, height: height)
    let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
    let attributes = [NSAttributedStringKey.font: UIFont.init(name: FontName.RobotoRegular, size: 15)]
    
    return NSString(string: text).boundingRect(with: size, options: options, attributes: attributes, context: nil)
}

//Get dynamic label width
func widthForLabel(label:UILabel,text:String) ->CGFloat
{
    let fontName = label.font.fontName;
    let fontSize = label.font.pointSize;
    
    let attributedText = NSMutableAttributedString(string: text,attributes: [NSAttributedStringKey.font:UIFont(name: fontName,size: fontSize)!])
    let rect: CGRect = attributedText.boundingRect(with: CGSize(width: label.frame.size.width, height: CGFloat.greatestFiniteMagnitude), options: [.usesLineFragmentOrigin, .usesFontLeading], context: nil)
    
    return ceil(rect.size.width)
}

func rectForText(text: String, font: UIFont, maxSize: CGSize) -> CGSize {
    
    let attrString = NSAttributedString.init(string: text, attributes: [NSAttributedStringKey.font:font])
    let rect = attrString.boundingRect(with: maxSize, options: NSStringDrawingOptions.usesLineFragmentOrigin, context: nil)
    let size = CGSize(width: rect.size.width, height: rect.size.height)
    return size
}
//MARK: - UIApplication Extension
extension UIApplication {
    class func topViewController(viewController: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = viewController as? UINavigationController {
            return topViewController(viewController: nav.visibleViewController)
        }
        if let tab = viewController as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(viewController: selected)
            }
        }
        if let presented = viewController?.presentedViewController {
            return topViewController(viewController: presented)
        }
        //        if let slide = viewController as? SlideMenuController {
        //            return topViewController(viewController: slide.mainViewController)
        //        }
        return viewController
    }
}
//MARK: - String Extension
extension String {
    //Get string length
    var length: Int { return characters.count    }  // Swift 2.0
    
    //Remove white space in string
    func removeWhiteSpace() -> String {
        return self.trimmingCharacters(in: .whitespaces)
    }
    func index(from: Int) -> Index {
        return self.index(startIndex, offsetBy: from)
    }
    
    func substring(from: Int) -> String {
        let fromIndex = index(from: from)
        return substring(from: fromIndex)
    }
    
    func substring(to: Int) -> String {
        let toIndex = index(from: to)
        return substring(to: toIndex)
    }
    
    func substring(with r: Range<Int>) -> String {
        let startIndex = index(from: r.lowerBound)
        let endIndex = index(from: r.upperBound)
        return substring(with: startIndex..<endIndex)
    }
    
    func randomString(length: Int) -> String {
        
        let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let len = UInt32(letters.length)
        var randomString = ""
        for _ in 0 ..< length {
            let rand = arc4random_uniform(len)
            var nextChar = letters.character(at: Int(rand))
            randomString += NSString(characters: &nextChar, length: 1) as String
        }
        
        return randomString
    }
}
//MARK: - NSString Extension
extension NSString {
    //Remove white space in string
    func removeWhiteSpace() -> NSString {
        return self.trimmingCharacters(in: NSCharacterSet.whitespaces) as NSString
    }
    
}
//MARK: - UISearchBar Class Modify
extension UISearchBar
{
    //UISearchBar Text Color
    func setTextColor(color: UIColor) {
        let svs = subviews.flatMap { $0.subviews }
        guard let tf = (svs.filter { $0 is UITextField }).first as? UITextField else { return }
        tf.textColor = color
    }
    //UISearchBar Set Font
    func setFont(font: UIFont) {
        let svs = subviews.flatMap { $0.subviews }
        guard let tf = (svs.filter { $0 is UITextField }).first as? UITextField else { return }
        tf.font = font
    }
    //UISearchBar Placeholder Text Color
    func setPlaceholderColor(color: UIColor) {
        let svs = subviews.flatMap { $0.subviews }
        guard let tf = (svs.filter { $0 is UITextField }).first as? UITextField else { return }
        tf .setValue(color, forKeyPath: "_placeholderLabel.textColor")
    }
}


//MARK: - Create thumbnail image
func smallImageWithImage(sourceImage: UIImage) -> UIImage {
    var width:Int = 0
    var height:Int = 0
    let y = sourceImage.size.height
    let x = sourceImage.size.width
    
    if sourceImage.size.height > 175 || sourceImage.size.width > 175 {
        if sourceImage.size.height > sourceImage.size.width {
            height = 175
            width = 0
        }else {
            height = 0
            width = 175
        }
    }
    
    var factor:Double = 1.0
    if width > 0 {
        factor = (Double(width) / Double(x) ) as Double
    }
    else if height > 0 {
        factor = Double(height) / Double(y)
    }
    
    let newHeight = Double(y) * factor
    let newWidth = Double(x) * factor
    
    UIGraphicsBeginImageContext(CGSize(width : CGFloat(newWidth),height :  CGFloat(newHeight)))
    sourceImage.draw(in: CGRect(x : 0,y : 0,width : CGFloat(newWidth),height : CGFloat(newHeight)))
    let newImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    return newImage!
}

//MARK: - NSDate Extention for UTC date
extension NSDate {
    func getUTCFormateDate() -> String {
        let dateFormatter = DateFormatter()
        let timeZone = NSTimeZone(name: "UTC")
        dateFormatter.timeZone = timeZone as TimeZone!
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: self as Date)
    }
    
    func getSystemFormateDate() -> String {
        let dateFormatter = DateFormatter()
        let timeZone = NSTimeZone.system
        dateFormatter.timeZone = timeZone
        dateFormatter.dateFormat = "dd/MM/yy hh:mma"
        return dateFormatter.string(from: self as Date)
    }
    
}

//MARK: - UIView Extension
extension UIView {
    
    //MARK: - IBInspectable
    //Set Corner Radious
    @IBInspectable var shadow: Bool {
        get {
            return layer.shadowOpacity > 0.0
        }
        set {
            if newValue == true {
                self.addShadow()
            }
        }
    }
    @IBInspectable var SmallShadow: Bool {
        get {
            return layer.shadowOpacity > 0.0
        }
        set {
            if newValue == true {
                self.addShadowSmall()
            }
        }
    }
    func add_shadow(demoView : UIView,height : CGFloat){
        
        let radius: CGFloat = demoView.frame.width //change it to .height if you need spread for height
        let shadowPath = UIBezierPath(rect: CGRect(x: -1, y: -1, width: radius + 0.5 , height:height - 4.0))
        //Change 2.1 to amount of spread you need and for height replace the code for height
        
        demoView.layer.cornerRadius = 0.0
        demoView.layer.shadowColor = UIColor.darkGray.cgColor
        demoView.layer.shadowOffset = CGSize(width: 0.1, height: 0.2)  //Here you control x and y
        demoView.layer.shadowOpacity = 0.2
        demoView.layer.shadowRadius = 2.0 //Here your control your blur
        demoView.layer.masksToBounds =  false
        demoView.layer.shadowPath = shadowPath.cgPath
    }
    func addShadow(shadowColor: CGColor = UIColor.darkGray.cgColor,
                   shadowOffset: CGSize = CGSize(width: 0.0, height: 0.0),
                   shadowOpacity: Float = 0.4,
                   shadowRadius: CGFloat = 6.0) {
        layer.shadowColor = shadowColor
        layer.shadowOffset = shadowOffset
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
    }
    func addShadowSmall(shadowColor: CGColor = UIColor.darkGray.cgColor,
                        shadowOffset: CGSize = CGSize(width: 0.0, height: 0.0),
                        shadowOpacity: Float = 0.2,
                        shadowRadius: CGFloat = 2.0) {
        
        layer.shadowColor = shadowColor
        layer.shadowOffset = shadowOffset
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
    }
    @IBInspectable var cornerRadius:CGFloat {
        set {
            self.layer.cornerRadius = newValue
        }
        get {
            return self.layer.cornerRadius
        }
    }
    
    
    func roundCorners(corners:UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
    
    //Set Round
    @IBInspectable var Round:Bool {
        set {
            self.layer.cornerRadius = self.frame.size.height / 2.0
        }
        get {
            return self.layer.cornerRadius == self.frame.size.height / 2.0
        }
    }
    //Set Border Color
    @IBInspectable var borderColor:UIColor {
        set {
            self.layer.borderColor = newValue.cgColor
        }
        get {
            return UIColor(cgColor: self.layer.borderColor!)
        }
    }
    //Set Border Width
    @IBInspectable var borderWidth:CGFloat {
        set {
            self.layer.borderWidth = newValue
        }
        get {
            return self.layer.borderWidth
        }
    }
    
    //Set Shadow in View
    func addShadowView(width:CGFloat=0.2, height:CGFloat=0.2, Opacidade:Float=0.7, maskToBounds:Bool=false, radius:CGFloat=0.5){
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: width, height: height)
        self.layer.shadowRadius = radius
        self.layer.shadowOpacity = Opacidade
        self.layer.masksToBounds = maskToBounds
    }
    struct NLInnerShadowDirection: OptionSet {
        let rawValue: Int
        
        static let None = NLInnerShadowDirection(rawValue: 0)
        static let Left = NLInnerShadowDirection(rawValue: 1 << 0)
        static let Right = NLInnerShadowDirection(rawValue: 1 << 1)
        static let Top = NLInnerShadowDirection(rawValue: 1 << 2)
        static let Bottom = NLInnerShadowDirection(rawValue: 1 << 3)
        static let All = NLInnerShadowDirection(rawValue: 15)
    }
    
    func dropShadow() {
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: -1, height: 1)
        self.layer.shadowRadius = 1
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shouldRasterize = true
        
        self.layer.rasterizationScale = UIScreen.main.scale
        
    }
    func removeInnerShadow() {
        for view in self.subviews {
            if (view.tag == 2639) {
                view.removeFromSuperview()
                break
            }
        }
    }
    
    func addInnerShadow() {
        let c = UIColor()
        let color = c.withAlphaComponent(0.5)
        
        self.addInnerShadowWithRadius(radius: 3.0, color: color, inDirection: NLInnerShadowDirection.All)
    }
    
    func addInnerShadowWithRadius(radius: CGFloat, andAlpha: CGFloat) {
        let c = UIColor()
        let color = c.withAlphaComponent(alpha)
        
        self.addInnerShadowWithRadius(radius: radius, color: color, inDirection: NLInnerShadowDirection.All)
    }
    
    func addInnerShadowWithRadius(radius: CGFloat, andColor: UIColor) {
        self.addInnerShadowWithRadius(radius: radius, color: andColor, inDirection: NLInnerShadowDirection.All)
    }
    
    func addInnerShadowWithRadius(radius: CGFloat, color: UIColor, inDirection: NLInnerShadowDirection) {
        self.removeInnerShadow()
        
        let shadowView = self.createShadowViewWithRadius(radius: radius, andColor: color, direction: inDirection)
        
        self.addSubview(shadowView)
    }
    
    func createShadowViewWithRadius(radius: CGFloat, andColor: UIColor, direction: NLInnerShadowDirection) -> UIView {
        let shadowView = UIView(frame: CGRect(x: -5,y: 0-5,width: self.bounds.size.width+10,height: self.bounds.size.height+10))
        shadowView.backgroundColor = UIColor.clear
        shadowView.tag = 2639
        
        let colorsArray: Array = [ andColor.cgColor, UIColor.clear.cgColor ]
        
        if direction.contains(.Top) {
            let xOffset: CGFloat = 0.0
            let topWidth = self.bounds.size.width
            
            let shadow = CAGradientLayer()
            shadow.colors = colorsArray
            shadow.startPoint = CGPoint(x:0.5,y: 0.0)
            shadow.endPoint = CGPoint(x:0.5,y: 1.0)
            shadow.frame = CGRect(x: xOffset,y: 0,width: topWidth,height: radius)
            shadowView.layer.insertSublayer(shadow, at: 0)
        }
        
        if direction.contains(.Bottom) {
            let xOffset: CGFloat = 0.0
            let bottomWidth = self.bounds.size.width
            
            let shadow = CAGradientLayer()
            shadow.colors = colorsArray
            shadow.startPoint = CGPoint(x:0.5,y: 1.0)
            shadow.endPoint = CGPoint(x:0.5,y: 0.0)
            shadow.frame = CGRect(x:xOffset,y: self.bounds.size.height - radius, width: bottomWidth,height: radius)
            shadowView.layer.insertSublayer(shadow, at: 0)
        }
        
        if direction.contains(.Left) {
            let yOffset: CGFloat = 0.0
            let leftHeight = self.bounds.size.height
            
            let shadow = CAGradientLayer()
            shadow.colors = colorsArray
            shadow.frame = CGRect(x:0,y: yOffset,width: radius,height: leftHeight)
            shadow.startPoint = CGPoint(x:0.0,y: 0.5)
            shadow.endPoint = CGPoint(x:1.0,y: 0.5)
            shadowView.layer.insertSublayer(shadow, at: 0)
        }
        
        if direction.contains(.Right) {
            let yOffset: CGFloat = 0.0
            let rightHeight = self.bounds.size.height
            
            let shadow = CAGradientLayer()
            shadow.colors = colorsArray
            shadow.frame = CGRect(x:self.bounds.size.width - radius,y: yOffset,width: radius,height: rightHeight)
            shadow.startPoint = CGPoint(x:1.0,y: 0.5)
            shadow.endPoint = CGPoint(x:0.0,y: 0.5)
            shadowView.layer.insertSublayer(shadow, at: 0)
        }
        return shadowView
    }
}
//MARK: - Bundle Information
extension Bundle {
    var releaseVersionNumber: String? {
        return infoDictionary?["CFBundleShortVersionString"] as? String
    }
    var buildVersionNumber: String? {
        return infoDictionary?["CFBundleVersion"] as? String
    }
}
//MARK: - MTViewController
class MTViewController : UIViewController
{
    //Outlet for auto resizing constraint constant set in different devices
    @IBOutlet var arrXConstraint : [NSLayoutConstraint]!
    
    
    @IBOutlet var arrYConstraint : [NSLayoutConstraint]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if arrXConstraint != nil
        {
            //Auto resizing constraint constant set in different devices
            for const in arrXConstraint {
                const.constant = const.constant * DeviceScale.SCALE_X
            }
        }
        if arrYConstraint != nil
        {
            //Auto resizing constraint constant set in different devices
            for const in arrYConstraint {
                const.constant = const.constant * DeviceScale.SCALE_Y
            }
        }
    }
    
    // MARK:- =======================================================
    // MARK: - Hex to UIcolor
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.characters.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    
    func alert(message: String) -> Void
    {
        let alert = UIAlertController.init(title: "Alert", message: message, preferredStyle: UIAlertControllerStyle.alert)
        let action = UIAlertAction.init(title: "OK", style: UIAlertActionStyle.cancel, handler: { (action) in
            
        })
        alert.addAction(action)
        self.present(alert, animated: true) {
            
        }
    }
}




//MARK: - MTCollectionCell
class MTCollectionCell: UICollectionViewCell
{
    @IBOutlet var arrCellConstants: [NSLayoutConstraint]!
    override func awakeFromNib() {
        
        if arrCellConstants != nil
        {
            for const in arrCellConstants {
                const.constant = const.constant * DeviceScale.SCALE_X
            }
        }
    }
}

//MARK: - MTTableCell
class MTTableCell: UITableViewCell
{
    @IBOutlet var arrTableCellConstants: [NSLayoutConstraint]!
    override func awakeFromNib() {
        
        if arrTableCellConstants != nil
        {
            for const in arrTableCellConstants {
                const.constant = const.constant * DeviceScale.SCALE_X
            }
        }
        
    }
}

//MARK: - MTButton
class MTButton : UIButton
{
}




//MARK: - MTLabel
class MTLabel : UILabel {
    override func awakeFromNib() {
        //Font size auto resizing in different devices
        self.font = self.font.withSize(self.font.pointSize * DeviceScale.SCALE_X)
    }
}

//MARK: - MTTextView
class MTTextView: UITextView
{
    //    override open func awakeFromNib() {
    //        self.font = self.font?.withSize((self.font?.pointSize)! * DeviceScale.SCALE_X)
    //    }
}

//MARK: - MTTextField
//class MTTextField: SkyFloatingLabelTextField
//{
//    override open func awakeFromNib() {
//        self.font = self.font?.withSize((self.font?.pointSize)! * DeviceScale.SCALE_X)
//    }
//}

class MTTextFieldSimple: UITextField
{
    override open func awakeFromNib() {
        self.font = self.font?.withSize((self.font?.pointSize)! * DeviceScale.SCALE_X)
    }
}
//MARK: - UITextfield Extension
extension UITextField {
    
    
    //Set placeholder font
    func setPlaceholderFont(font: UIFont) {
        let lblPlaceHolder:UILabel = self.value(forKey: "_placeholderLabel") as! UILabel
        lblPlaceHolder.font = font
    }
   
    //    Set placeholder text color
    func setPlaceholderTextColor(color: UIColor) {
        let lblPlaceHolder:UILabel = self.value(forKey: "_placeholderLabel") as! UILabel
        lblPlaceHolder.textColor = color
    }
    
    
}
//MARK: - Protocol Oriented Programming Language
protocol Shakeable { }

extension Shakeable where Self: UIView {
    
    func shake() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.03
        animation.repeatCount = 4
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x:self.center.x - 4.0, y:self.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x:self.center.x + 4.0, y:self.center.y))
        layer.add(animation, forKey: "position")
    }
}
class MTImageView: UIImageView, Shakeable {
    
}
//MARK: - NSMutableArray Extension
extension NSMutableArray {
    func shuffle () {
        for i in (0..<self.count).reversed() {
            let ix1 = i
            let ix2 = Int(arc4random_uniform(UInt32(i+1)))
            (self[ix1], self[ix2]) = (self[ix2], self[ix1])
        }
    }
}
//MARK : - UIColor Extension
extension UIColor {
    static var keyboardColor:UIColor {
        return UIColor(red: 26.0 / 255.0, green: 26.0 / 255.0, blue: 25.0 / 255.0, alpha: 1.0)
    }
    class  func colorWithHexString (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: (CharacterSet.whitespaces as NSCharacterSet) as CharacterSet).uppercased()//stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet() as NSCharacterSet).uppercaseString
        let index1 = cString.index(cString.startIndex, offsetBy: +1)
        if (cString.hasPrefix("#")) {
            cString = cString.substring(from: index1)//substringFromIndex(cString.startIndex.advancedBy(1))
        }
        //        var index1 = string1.index(string1.endIndex, offsetBy: -4)
        //
        //        var substring1 = string1.substring(to: index1)
        
        
        if ((cString.characters.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}

// Dictionary Contains Value

extension Dictionary where Value: Equatable {
    func containsValue(value : Value) -> Bool {
        return self.contains { $0.1 == value }
    }
}
