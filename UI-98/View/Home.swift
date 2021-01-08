//
//  Home.swift
//  UI-98
//
//  Created by にゃんにゃん丸 on 2021/01/08.
//

import SwiftUI

var screen = NSScreen.main!.visibleFrame

struct Home: View {
    
    @StateObject var model = HomeViewModel()
    
    @Namespace var animaton
    
    var body: some View {
        HStack{
            
            VStack{
                
                TabButtonView(title: "All Chats", image: "message", selected: $model.selected, animation: animaton)
                
                TabButtonView(title: "Walking", image: "figure.walk", selected: $model.selected, animation: animaton)
                
                TabButtonView(title: "Bots", image: "ellipsis.bubble.fill", selected: $model.selected, animation: animaton)
                
                TabButtonView(title: "Edit", image: "line.horizontal.3", selected: $model.selected, animation: animaton)
                
                Spacer()
                TabButtonView(title: "Setting", image: "gear", selected: $model.selected, animation: animaton)
                
            }
            .padding()
            .padding(.top,35)
            .background(BlureView())
          
            ZStack{
                
                
                switch model.selected{
                case "All Chats": NavigationView{ AllChatView()}
                case "Walking": Text("Walking")
                case "Bots": Text("Bots")
                case "Edit": Text("Edit")
                case "Setting": Text("Setting")
                    
                default: Text("")
                
                
                }
                
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
           
        }
        .ignoresSafeArea(.all, edges: .all)
        .frame(width: screen.width / 1.2, height: screen.height - 60)
        
        .environmentObject(model)
    }
}

