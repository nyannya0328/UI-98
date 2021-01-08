//
//  TabButtonView.swift
//  UI-98
//
//  Created by にゃんにゃん丸 on 2021/01/08.
//

import SwiftUI

struct TabButtonView: View {
    
    
    var title : String
    var image : String
    @Binding var selected : String
    var animation : Namespace.ID
    var body: some View {
        Button(action: {
            withAnimation{selected = title}
            
        }, label: {
            
            VStack(spacing:15){
                
                HStack{
                    
                    Image(systemName: image)
                        .font(.system(size: 11, weight: .bold))
                       
                        .foregroundColor(selected == title ? .white : .gray)
                    
                    Text(title)
                        .font(.title2)
                        .font(.system(size: 10, weight: .bold))
                        .foregroundColor(selected == title ? .white : .gray)
                    
                    ZStack{
                        
                        Capsule()
                            .fill(Color.clear)
                            .frame(width: 5, height: 15)
                        
                        if selected == title{
                            
                            Capsule()
                                .fill(Color.green)
                                .frame(width: 5, height: 15)
                                .matchedGeometryEffect(id: "Tab", in: animation)
                            
                            
                            
                            
                        }
                        
                    }
                    
                    
                }
                .padding(.vertical,8)
                .frame(width: 95)
                .contentShape(Rectangle())
                
                .background(Color.primary.opacity(selected == title ? 0.3 : 0))
                .cornerRadius(10)
            }
            
        })
       .buttonStyle(PlainButtonStyle())
    }
}

