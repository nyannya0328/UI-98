//
//  Message.swift
//  UI-98
//
//  Created by にゃんにゃん丸 on 2021/01/08.
//

import SwiftUI

struct Message: Identifiable,Equatable {
    var id = UUID().uuidString
    var message : String
    var mymessage : Bool
    
    
}

var Eachmsg = [

    Message(message:"ああああああああ", mymessage: true),
    Message(message:"いいいいいいいい", mymessage: false),
    Message(message:"うううううううう", mymessage: true),
    Message(message:"ええええええええ", mymessage: true),
    Message(message:"おおおおおおおお", mymessage: false),
    Message(message:"aaaaaaaaaaaaa", mymessage: true),
    Message(message:"bbbbbbbbbbbbb", mymessage: false),
]
