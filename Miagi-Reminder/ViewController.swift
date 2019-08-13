//
//  ViewController.swift
//  Miagi-Reminder
//
//  Created by apple on 8/12/19.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var selectedDateLabel: UILabel!
    @IBOutlet weak var viewCalendar: CalendarView!
//    var calendarView: CalendarView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        let formatter = DateFormatter()
//        // initially set the format based on your datepicker date / server String
//        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
//        
//        let myString = formatter.string(from: Date()) // string purpose I add here
//        // convert your string to date
//        let yourDate = formatter.date(from: myString)
//        //then again set the date format whhich type of output you need
//        formatter.dateFormat = "MM-yyyy"
//        // again convert your date to string
//        let myStringafd = formatter.string(from: yourDate!)
//        
//        print(myStringafd)
//       
//        self.selectedDateLabel.text = myStringafd
        viewCalendar.parentView = self
            }
    
    @IBAction func btnBack(_ sender: Any) {
        
        viewCalendar.rewindOneMonth()
        
    }

    @IBAction func btnToday(_ sender: Any) {
//        viewCalendar.currentDate
    }
    
    @IBAction func btnNext(_ sender: Any) {
        
        viewCalendar.advanceOneMonth()
    }
}

//extension ViewController: ClickBackNextTime {
//
//    func clickBack(){
//        let swipeLeftGR = UISwipeGestureRecognizer(target: self, action: #selector(advanceOneMonth))
//        swipeLeftGR.direction = .left
//        self.addGestureRecognizer(swipeLeftGR)
//    }
//
//    func clickNext(){
//        let swipeRightGR = UISwipeGestureRecognizer(target: self, action: #selector(rewindOneMonth))
//        swipeRightGR.direction = .right
//        self.addGestureRecognizer(swipeRightGR)
//    }
//
//
//}

