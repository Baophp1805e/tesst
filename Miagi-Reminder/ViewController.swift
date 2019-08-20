//
//  ViewController.swift
//  Miagi-Reminder
//
//  Created by apple on 8/12/19.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    @IBOutlet weak var selectedDateLabel: UILabel!
    @IBOutlet weak var viewCalendar: CalendarView!
    var calendarCellView: CalendarCellView!

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Miagi Reminder"
        self.selectedDateLabel.text = viewCalendar.time
        viewCalendar.parentView = self
        tableView.delegate = self
        tableView.dataSource = self
        let nibName = UINib(nibName: "ListEvent", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "eventCell")
            }
    
    @IBAction func btnBack(_ sender: Any) {
        
        viewCalendar.rewindOneMonth()
        
    }

    @IBAction func btnToday(_ sender: Any) {
        viewCalendar.currentToday()
    }
    
    @IBAction func btnNext(_ sender: Any) {
        
        viewCalendar.advanceOneMonth()
    }
    @IBAction func btnAdd(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let commentVc = storyBoard.instantiateViewController(withIdentifier: "newEvent") as? NewEventClassViewController
        self.navigationController?.pushViewController(commentVc!, animated: true)
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath) as! ListEvent
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

