//
//  SelectTimeViewController.swift
//  Whoop
//
//  Created by ACMEUNIVERSE MAC-2 on 11/12/17.
//  Copyright © 2017 Abdul Baseer. All rights reserved.
//

import UIKit
import FSCalendar

class SelectTimeViewController: UIViewController,FSCalendarDataSource,FSCalendarDelegate, FSCalendarDelegateAppearance  {
    
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
    @IBOutlet var calendarBookOnline: FSCalendar!
    
    var selectedSlot = ""
    var year = "2017"
    var day = ""
    var dayOfWeek = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        calendarBookOnline.dataSource = self
        calendarBookOnline.delegate = self
        calendarBookOnline.register(DIYCalendarCell.self, forCellReuseIdentifier: "cell")
        
        btnMorning.layer.borderWidth = 2
        btnMorning.layer.borderColor = UIColor.white.cgColor
        btnMorning.backgroundColor = UIColor.red
        
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
        
        calendarBookOnline.select(Date(), scrollToDate: true)
//        calendarBookOnline.ty
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK:- FSCalendarDataSource
    
    func calendar(_ calendar: FSCalendar, cellFor date: Date, at position: FSCalendarMonthPosition) -> FSCalendarCell {
        let cell = calendar.dequeueReusableCell(withIdentifier: "cell", for: date, at: position)
        return cell
    }
    
    func calendar(_ calendar: FSCalendar, willDisplay cell: FSCalendarCell, for date: Date, at position: FSCalendarMonthPosition) {
        self.configure(cell: cell, for: date, at: position)
    }
    
    func calendar(_ calendar: FSCalendar, titleFor date: Date) -> String? {
//        if self.gregorian.isDateInToday(date) {
//            return "Today"
//        }
        return nil
    }
    
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
        return 0
    }
    
    // MARK:- FSCalendarDelegate
    
    func calendar(_ calendar: FSCalendar, boundingRectWillChange bounds: CGRect, animated: Bool) {
        self.calendarBookOnline.frame.size.height = bounds.height
//        self.eventLabel.frame.origin.y = calendarBookOnline.frame.maxY + 10
    }
    
    func calendar(_ calendar: FSCalendar, shouldSelect date: Date, at monthPosition: FSCalendarMonthPosition)   -> Bool {
        let currentPageDate = calendar.currentPage
        
        if let monthName = date.monthName(){
            print(date.day)
            lblMonthAndDate.text = "\(date.day) " + monthName
        }
        year = "\(NSCalendar.current.component(.year, from: date))"
        
        if let dayOfWeekItem = date.dayOfWeek(){
            lblDayName.text = "\(dayOfWeekItem)"
        }
        
        print(lblDayName.text)
        print(lblMonthAndDate.text)
        print(year)
        
        
        return monthPosition == .current
    }
    
    func calendar(_ calendar: FSCalendar, shouldDeselect date: Date, at monthPosition: FSCalendarMonthPosition) -> Bool {
        
        return monthPosition == .current
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        print("did select date \(self.formatter.string(from: date))")
        
        self.configureVisibleCells()
    }
    
    func calendar(_ calendar: FSCalendar, didDeselect date: Date) {
        print("did deselect date \(self.formatter.string(from: date))")
        
        self.configureVisibleCells()
    }
    
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, eventDefaultColorsFor date: Date) -> [UIColor]? {
        if self.gregorian.isDateInToday(date) {
            return [UIColor.orange]
        }
        return [appearance.eventDefaultColor]
    }
    
    // MARK: - Private functions
    
    private func configureVisibleCells() {
        calendarBookOnline.visibleCells().forEach { (cell) in
            let date = calendarBookOnline.date(for: cell)
            let position = calendarBookOnline.monthPosition(for: cell)
            self.configure(cell: cell, for: date!, at: position)
        }
    }
    
    private func configure(cell: FSCalendarCell, for date: Date, at position: FSCalendarMonthPosition) {
        
        let diyCell = (cell as! DIYCalendarCell)
        // Custom today circle
//        diyCell.circleImageView.isHidden = !self.gregorian.isDateInToday(date)
        // Configure selection layer
        if position == .current {
            
            var selectionType = SelectionType.none
            
            if calendarBookOnline.selectedDates.contains(date) {
                let previousDate = self.gregorian.date(byAdding: .day, value: -1, to: date)!
                let nextDate = self.gregorian.date(byAdding: .day, value: 1, to: date)!
                if calendarBookOnline.selectedDates.contains(date) {
                    if calendarBookOnline.selectedDates.contains(previousDate) && calendarBookOnline.selectedDates.contains(nextDate) {
                        selectionType = .middle
                    }
                    else if calendarBookOnline.selectedDates.contains(previousDate) && calendarBookOnline.selectedDates.contains(date) {
                        selectionType = .rightBorder
                    }
                    else if calendarBookOnline.selectedDates.contains(nextDate) {
                        selectionType = .leftBorder
                    }
                    else {
                        selectionType = .single
                    }
                }
            }
            else {
                selectionType = .none
            }
            if selectionType == .none {
                diyCell.selectionLayer.isHidden = true
                return
            }
            diyCell.selectionLayer.isHidden = false
            diyCell.selectionType = selectionType
            
        } else {
//            diyCell.circleImageView.isHidden = true
            diyCell.selectionLayer.isHidden = true
        }
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
extension Date{
    var day:Int {return Calendar.current.component(.day, from:self)}
    var month:Int {return Calendar.current.component(.month, from:self)}
    var year:Int {return Calendar.current.component(.year, from:self)}
}
