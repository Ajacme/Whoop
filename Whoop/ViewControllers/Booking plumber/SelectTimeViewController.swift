//
//  SelectTimeViewController.swift
//  Whoop
//
//  Created by ACMEUNIVERSE MAC-2 on 11/12/17.
//  Copyright © 2017 Abdul Baseer. All rights reserved.
//

import UIKit
import CVCalendar

class SelectTimeViewController: UIViewController {
   
    
    
    fileprivate let gregorian = Calendar(identifier: .gregorian)
    fileprivate let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()

    @IBOutlet var btnEvening: UIButton!
    @IBOutlet var btnMorning: UIButton!
    @IBOutlet var btnAfternoon: UIButton!
    @IBOutlet var lblMonthAndDate: UILabel!
    @IBOutlet var lblDayName: UILabel!
    @IBOutlet var calendarBookOnline: CVCalendarView!
    @IBOutlet weak var menuView: CVCalendarMenuView!
    
    @IBOutlet weak var monthLabel: UILabel!
    var selectedSlot = ""
    var year = "2017"
    var day = ""
    var dayOfWeek = ""
    
    
    // MARK: - Properties
    
    struct Color {
        static let selectedText = UIColor.white
        static let text = UIColor.colorWithHexString(hex: "ED6C32")
        static let textDisabled = UIColor.colorWithHexString(hex: "ED6C32")
        static let selectionBackground = UIColor.darkGray
        static let sundayText = UIColor.colorWithHexString(hex: "ED6C32")
        static let sundayTextDisabled = UIColor.green
        static let sundaySelectionBackground = UIColor.darkGray
    }
    var animationFinished = true
    var currentCalendar: Calendar?
    
    override func awakeFromNib() {
        let timeZoneBias = 480 // (UTC+08:00)
        currentCalendar = Calendar.init(identifier: .gregorian)
        currentCalendar?.locale = Locale(identifier: "fr_FR")
        if let timeZone = TimeZone.init(secondsFromGMT: -timeZoneBias * 60) {
            currentCalendar?.timeZone = timeZone
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let currentCalendar = currentCalendar {
            monthLabel.text = CVDate(date: Date(), calendar: currentCalendar).globalDescription
        }
        self.calendarBookOnline.calendarAppearanceDelegate = self
        self.calendarBookOnline.animatorDelegate = self
        self.calendarBookOnline.calendarDelegate = self
        self.menuView.delegate = self
        
        btnMorning.layer.borderWidth    = 2
        btnMorning.layer.borderColor    = UIColor.white.cgColor
        btnMorning.backgroundColor      = UIColor.red
        
        btnEvening.layer.borderWidth = 2
        btnEvening.layer.borderColor = UIColor.white.cgColor
        btnEvening.backgroundColor = UIColor.red
        
        btnAfternoon.layer.borderWidth = 2
        btnAfternoon.layer.borderColor = UIColor.white.cgColor
        

        btnAfternoon.backgroundColor = UIColor.white
        selectedSlot = "Afternoon 12pm - 18pm"
        
        
        
        if let monthName = Date().monthName(){
            print(Date().day)
            lblMonthAndDate.text = "\(Date().day) " + monthName
        }
        if let dayOfWeekItem = Date().dayOfWeek(){
            lblDayName.text = "\(dayOfWeekItem)"
        }
        
//        calendarBookOnline.select(Date(), scrollToDate: true)
//        calendarBookOnline.ty
        
        // Do any additional setup after loading the view.
    }
    

  
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        calendarBookOnline.commitCalendarViewUpdate()
        menuView.commitMenuViewUpdate()
    }
    
    
    // MARK: - Clicks
    @IBAction func tapSubmitData(_ sender: Any) {
        if let initVC = self.storyboard?.instantiateViewController(withIdentifier: "BookedApointmentViewController") as? BookedApointmentViewController{
            if let year = lblDayName.text{
              initVC.day = year
            }
            if let dateandMonth = lblMonthAndDate.text{
                initVC.monthAndDate = dateandMonth
            }
            initVC.slot = selectedSlot
            
            initVC.year = year
            
            self.navigationController?.pushViewController(initVC, animated: true)
        }
    }
    
    @IBAction func tapBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func tapSlots(_ sender: UIButton) {
        
        if sender.tag == 1{// Mor
            btnMorning.backgroundColor = UIColor.white
            btnEvening.backgroundColor = UIColor.red
            btnAfternoon.backgroundColor = UIColor.red
            selectedSlot = "Morning 8am - 12pm"
            
        }else if sender.tag == 2{//Aft
            btnMorning.backgroundColor = UIColor.red
            btnEvening.backgroundColor = UIColor.red
            btnAfternoon.backgroundColor = UIColor.white
            selectedSlot = "Afternoon 12pm - 18pm"
        }else{//Eve
            btnMorning.backgroundColor = UIColor.red
            btnEvening.backgroundColor = UIColor.white
            btnAfternoon.backgroundColor = UIColor.red
            selectedSlot = "Evening 18pm - 19:30pm"
        }
        
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
extension SelectTimeViewController: CVCalendarViewDelegate, CVCalendarMenuViewDelegate  {
    
    /// Required method to implement!
    func presentationMode() -> CalendarMode {
        return .monthView
    }
    
    /// Required method to implement!
    func firstWeekday() -> Weekday {
        return .sunday
    }
    func calendar() -> Calendar? {
        return currentCalendar
    }
    
    func dayOfWeekTextColor(by weekday: Weekday) -> UIColor {
        return weekday == .sunday ? UIColor(red: 1.0, green: 0, blue: 0, alpha: 1.0) : UIColor.darkGray
    }
    func didSelectDayView(_ dayView: DayView, animationDidFinish: Bool) {
        
        if let currentDate = calendarBookOnline.presentedDate.convertedDate()
        {
            if let monthName = currentDate.monthName(){
                print(currentDate.day)
                lblMonthAndDate.text = "\(currentDate.day) " + monthName
            }
            if let dayOfWeekItem = currentDate.dayOfWeek(){
                lblDayName.text = "\(dayOfWeekItem)"
            }
            year = "\(currentDate.year)"

        }
        
    }
    
    func weekdaySymbolType() -> WeekdaySymbolType {
        return .short
    }
    
    func presentedDateUpdated(_ date: CVDate) {
        if monthLabel.text != date.globalDescription && self.animationFinished {
            let updatedMonthLabel = UILabel()
            updatedMonthLabel.textColor = monthLabel.textColor
            updatedMonthLabel.font = monthLabel.font
            updatedMonthLabel.textAlignment = .center
            updatedMonthLabel.text = date.globalDescription
            updatedMonthLabel.sizeToFit()
            updatedMonthLabel.alpha = 0
            updatedMonthLabel.center = self.monthLabel.center
            
            let offset = CGFloat(48)
            updatedMonthLabel.transform = CGAffineTransform(translationX: 0, y: offset)
            updatedMonthLabel.transform = CGAffineTransform(scaleX: 1, y: 0.1)
            
            UIView.animate(withDuration: 0.35, delay: 0, options: UIViewAnimationOptions.curveEaseIn, animations: {
                self.animationFinished = false
                self.monthLabel.transform = CGAffineTransform(translationX: 0, y: -offset)
                self.monthLabel.transform = CGAffineTransform(scaleX: 1, y: 0.1)
                self.monthLabel.alpha = 0
                
                updatedMonthLabel.alpha = 1
                updatedMonthLabel.transform = CGAffineTransform.identity
                
            }) { _ in
                
                self.animationFinished = true
                self.monthLabel.frame = updatedMonthLabel.frame
                self.monthLabel.text = updatedMonthLabel.text
                self.monthLabel.transform = CGAffineTransform.identity
                self.monthLabel.alpha = 1
                updatedMonthLabel.removeFromSuperview()
            }
            
            self.view.insertSubview(updatedMonthLabel, aboveSubview: self.monthLabel)
        }
    }
}

// MARK: - CVCalendarViewAppearanceDelegate

extension SelectTimeViewController: CVCalendarViewAppearanceDelegate {
    
    func dayLabelWeekdayDisabledColor() -> UIColor {
        return UIColor.lightGray
    }
    
    func dayLabelPresentWeekdayInitallyBold() -> Bool {
        return false
    }
    
    func spaceBetweenDayViews() -> CGFloat {
        return 0
    }
    
    func dayLabelFont(by weekDay: Weekday, status: CVStatus, present: CVPresent) -> UIFont { return UIFont.systemFont(ofSize: 14) }
    
    func dayLabelColor(by weekDay: Weekday, status: CVStatus, present: CVPresent) -> UIColor? {
        switch (weekDay, status, present) {
        case (_, .selected, _), (_, .highlighted, _): return Color.selectedText
        case (.sunday, .in, _): return Color.sundayText
        case (.sunday, _, _): return Color.sundayTextDisabled
        case (_, .in, _): return Color.text
        default: return Color.textDisabled
        }
    }
    
    func dayLabelBackgroundColor(by weekDay: Weekday, status: CVStatus, present: CVPresent) -> UIColor? {
        switch (weekDay, status, present) {
        case (.sunday, .selected, _), (.sunday, .highlighted, _): return Color.sundaySelectionBackground
        case (_, .selected, _), (_, .highlighted, _): return Color.selectionBackground
        default: return nil
        }
    }
}
extension Date{
    var day:Int {return Calendar.current.component(.day, from:self)}
    var month:Int {return Calendar.current.component(.month, from:self)}
    var year:Int {return Calendar.current.component(.year, from:self)}
}
