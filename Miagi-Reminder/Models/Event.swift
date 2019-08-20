//
//  Event.swift
//  Miagi-Reminder
//
//  Created by apple on 8/16/19.
//  Copyright © 2019 apple. All rights reserved.
//

import Foundation
class Event {
    var uid: String?
    var titleEvent:String?
    var describe:String?
    var city: String?
    var time:Int?
    var timeStart:Int?
    var timeEnd:Int?
    
    init(uid:String, titleEvent:String, describe:String, city:String, time:Int, timeStart: Int, timeEnd: Int) {
        self.uid = uid
        self.titleEvent = titleEvent
        self.describe = describe
        self.city = city
        self.time = time
        self.timeStart = timeStart
        self.timeEnd = timeEnd
    }
//
//    init(id:String, imgPost:String, uid:String, post:String, timeStamp:Int,countLikes:String?) {
//        self.idM = id
//        self.postTextM = post
//        self.imgPostM = imgPost
//        self.timeStamp = timeStamp
//        self.uid = uid
//        self.countLikes = countLikes
//    }
}
