//
//  AllChatView.swift
//  UI-98
//
//  Created by にゃんにゃん丸 on 2021/01/08.
//

import SwiftUI

struct AllChatView: View {
    
    @EnvironmentObject var model : HomeViewModel
    
    var body: some View {
        
        VStack{
            
            
            HStack{
                
                Spacer()
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "plus")
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                })
                .buttonStyle(PlainButtonStyle())
            }
            .padding(.horizontal)
                
                HStack{
                    
                    Image(systemName: "magnifyingglass")
                    TextField("Search", text: $model.search)
                        .textFieldStyle(PlainTextFieldStyle() )
                    
                }
                .padding(.vertical,8)
                .padding(.horizontal)
                .background(Color.primary.opacity(0.15))
                .cornerRadius(10)
                .padding()
                
                
                
            
        
        
        List(selection:$model.selectedmsg){
            ForEach(model.msgs){message in
                
              NavigationLink(
                destination: DetatilView(user: message),
               
                label: {
                    RecentMessageView(rmsg: message)
                })
                
            }
            
            
        }
        .listStyle(SidebarListStyle())
            
        }
    }
}

