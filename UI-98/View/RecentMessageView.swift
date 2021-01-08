//
//  RecentMessageView.swift
//  UI-98
//
//  Created by にゃんにゃん丸 on 2021/01/08.
//

import SwiftUI

struct RecentMessageView: View {
    
    var rmsg : RecentMassage
    var body: some View {
        
        HStack{
            
            Image(rmsg.userimage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 40, height: 40)
                .clipShape(Circle())
            
            VStack(spacing:5){
                
                HStack{
                    
                    VStack(alignment:.leading,spacing:5){
                        
                        
                        Text(rmsg.username)
                            .fontWeight(.bold)
                            .foregroundColor(.blue)
                        
                        Text(rmsg.lastpedingMsg)
                            
                            .foregroundColor(.purple)
                        
                    }
                        
                        Spacer()
                        
                        VStack{
                        Text(rmsg.lastmsgtime)
                            .font(.title2)
                        
                        Text(rmsg.lastpedingMsg)
                            .font(.title3)
                        }
                    }
                    
                    
                    
                
                
                
                
            }
        }
        
    }
}

