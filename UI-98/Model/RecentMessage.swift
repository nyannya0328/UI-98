//
//  RecentMessage.swift
//  UI-98
//
//  Created by にゃんにゃん丸 on 2021/01/08.
//

import SwiftUI

struct RecentMassage: Identifiable {
    var id = UUID().uuidString
    var lastmsg : String
    var lastmsgtime : String
    var lastpedingMsg : String
    var username : String
    var userimage : String
    var allmsg:[Message]
    
}

var resentmsg : [RecentMassage] = [

    RecentMassage(lastmsg: "バブ-", lastmsgtime: "19:00", lastpedingMsg: "9", username: "BabyMan", userimage: "p1", allmsg: Eachmsg.shuffled()),
    
    RecentMassage(lastmsg: "かくん", lastmsgtime: "15:15", lastpedingMsg: "2", username: "Cat Sleep", userimage: "p2", allmsg: Eachmsg.shuffled()),
    
    RecentMassage(lastmsg: "何見てんのよ！", lastmsgtime: "9:00", lastpedingMsg: "3", username: "KingCat", userimage: "p3", allmsg: Eachmsg.shuffled()),
    
    RecentMassage(lastmsg: "My name is king", lastmsgtime: "23:12", lastpedingMsg: "5", username: "King", userimage: "p4", allmsg: Eachmsg.shuffled()),
    
    RecentMassage(lastmsg: "Watch out", lastmsgtime: "22:10", lastpedingMsg: "4", username: "MotherKing", userimage: "p5", allmsg: Eachmsg.shuffled()),
    
    RecentMassage(lastmsg: "Above mountain", lastmsgtime: "20:35", lastpedingMsg: "6", username: "Speed", userimage: "p6", allmsg: Eachmsg.shuffled()),
    
    RecentMassage(lastmsg: "最高じゃない私？", lastmsgtime: "10:00", lastpedingMsg: "8", username: "Cool", userimage: "p7", allmsg: Eachmsg.shuffled()),
    
    RecentMassage(lastmsg: "King of the subscript", lastmsgtime: "18:30", lastpedingMsg: "0", username: "NetFlix", userimage: "p8", allmsg: Eachmsg.shuffled()),
    
    RecentMassage(lastmsg: "Please", lastmsgtime: "13:40", lastpedingMsg: "5", username: "Koalaman", userimage: "p9", allmsg: Eachmsg.shuffled()),
    
    RecentMassage(lastmsg: "Dash", lastmsgtime: "4:00", lastpedingMsg: "6", username: "Kuma", userimage: "p10", allmsg: Eachmsg.shuffled()),
    
    
    

]
