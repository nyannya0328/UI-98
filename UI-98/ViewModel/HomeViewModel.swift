//
//  HomeViewModel.swift
//  UI-98
//
//  Created by にゃんにゃん丸 on 2021/01/08.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    
    @Published var selected = "All Chats"
    @Published var search = ""
    @Published var message = ""
    
    @Published var msgs : [RecentMassage] = resentmsg
    
    @Published var selectedmsg:String? = resentmsg.first?.id
    
    @Published var expand = false
    
    @Published var recentPicker = "Media"
    
    
    func sendMessage(user : RecentMassage){
        
  
            
            
        if message != ""{
            let index = msgs.firstIndex{ (user) -> Bool in
                
                return user.id == user.id
            } ?? -1
            
            if index != -1{msgs[index].allmsg.append(Message(message:message,mymessage :true))
                
            }
        }
            
            
            
            
            
          
        }
        
        
    }
   


