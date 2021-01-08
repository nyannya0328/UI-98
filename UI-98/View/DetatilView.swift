//
//  DetatilView.swift
//  UI-98
//
//  Created by にゃんにゃん丸 on 2021/01/08.
//

import SwiftUI

struct DetatilView: View {
    var user : RecentMassage
    @EnvironmentObject var model : HomeViewModel
    var body: some View {
        HStack{
            
            VStack{
                HStack{
                    
                    
                    Text(user.username)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image(systemName: "magnifyingglass")
                            .font(.title2)
                    })
                    .buttonStyle(PlainButtonStyle())
                    
                    Button(action: {
                        
                        withAnimation{
                            
                            model.expand.toggle()
                           
                                
                        }
                        
                    }, label: {
                        Image(systemName: "sidebar.right")
                            .font(.title2)
                            . foregroundColor(model.expand ? .blue : .white)
                    })
                    .buttonStyle(PlainButtonStyle())
                    
                    
                }
                .padding()
                
                
              MessageView(user: user)
                
                HStack{
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image(systemName: "paperplane.fill")
                            .font(.title2)
                    })
                    .buttonStyle(PlainButtonStyle())
                    
                    TextField("Enter Message", text: $model.message, onCommit: {
                        
                        model.sendMessage(user: user)
                        
                    })
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding(.vertical,8)
                        .padding(.horizontal)
                        .background(Capsule().strokeBorder(Color.blue))
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        
                        Image(systemName: "face.smiling.fill")
                       
                    })
                    .buttonStyle(PlainButtonStyle() )
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        
                        Image(systemName: "mic")
                       
                    })
                    .buttonStyle(PlainButtonStyle() )
                    
                    
                    
                    
                }
                .padding([.horizontal,.bottom])
            }
                
                ExpandView(user: user)
                    .frame(width: model.expand ? nil : 0)
                    .opacity(model.expand ? 1 : 0)
                    .background(BlureView())
                
            
        }
    }
}

struct ExpandView : View {
    
    @EnvironmentObject var model : HomeViewModel
    
    var user : RecentMassage
    
    var body: some View{
        
        Divider()
        
        VStack(spacing:15){
            
            Image(user.userimage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 90, height: 90)
                .clipShape(Capsule())
                
            
            
            Text(user.username)
                .font(.title)
                .fontWeight(.bold)
            
            HStack{
                
                
                Button(action: {}, label: {
                    
                    VStack{
                        
                        Image(systemName: "bell.slash")
                            .font(.title)
                        
                        Text("Mute")
                        
                        
                    }
                    .contentShape(Rectangle())
                     
                })
                .buttonStyle(PlainButtonStyle())
                
                
                Spacer()
                
                Button(action: {}, label: {
                    
                    VStack{
                        
                        Image(systemName: "hand.raised.fill")
                            .font(.title)
                        
                        Text("Block")
                        
                        
                    }
                    .contentShape(Rectangle())
                     
                })
                .buttonStyle(PlainButtonStyle())
                
                
                Spacer()
                
                Button(action: {}, label: {
                    
                    VStack{
                        
                        Image(systemName: "exclamationmark.triangle")
                            .font(.title)
                        
                        Text("Report")
                        
                        
                    }
                    .contentShape(Rectangle())
                     
                })
                .buttonStyle(PlainButtonStyle())
                
            }
            .padding()
            
            Picker(selection: $model.recentPicker, label: Text("Picker"), content: {
               
                Text("Media")
                    .tag("Media")
                
                Text("Links")
                    .tag("Links")
                
                Text("Audio")
                    .tag("Audio")
                
                Text("Files")
                    .tag("Files")
                
            })
            .pickerStyle(SegmentedPickerStyle())
            .labelsHidden()
            .padding()
            
            
            ScrollView{
                
                if model.recentPicker == "Media"{
                    
                    LazyVGrid(columns:Array(repeating:GridItem(.flexible(),spacing:10),count:3),spacing:10,content:{
                        
                        ForEach(1...10,id:\.self){index in
                            
                            
                            Image("p\(index)")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 80, height: 80)
                                .cornerRadius(10)
                            
                            
                        }
                       
                        
                    })
                    
                    
                    
                    
                    
                }
                
                else{
                    
                    Text("No\(model.recentPicker)")
                    
                }
                
            }
            
            
            
        }
        .padding(.horizontal)
        .frame(width: 300)
        
    }
    
}


struct MessageView : View {
    var user : RecentMassage
    
    var body: some View{
        
        GeometryReader{ reader in
            
            ScrollView{
                
                ScrollViewReader{proxy in
                    
                    ForEach(user.allmsg){message in
                        
                        MessageCardView(message: message, user: user, width: reader.frame(in:.global).width)
                            .tag(message.id)
                        
                        
                    }
                    .onAppear(perform: {
                        
                        let lastID = user.allmsg.last!.id
                        
                        proxy.scrollTo(lastID, anchor: .bottom)
                        
                    })
                    .onChange(of: user.allmsg, perform: { value in
                        
                        let lastID = user.allmsg.last!.id
                        proxy.scrollTo(lastID, anchor: .bottom)
                      
                    })
                }
                
                
                
            }
            .padding(.bottom,30)
            
            
        }
        
    }
}


struct MessageCardView : View {
    
    var message : Message
    
    var user : RecentMassage
    
    var width : CGFloat
    
  
    var body: some View{
        
        HStack(spacing:15){
            
            if message.mymessage{
                
                
                Spacer()
                
                Text(message.message)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(10)
                    .background(Color.blue)
                    .frame(minWidth: 0, maxHeight: width / 2, alignment: .trailing)
                    .cornerRadius(10)
                   
                
            }
            
            else{
                
                Image(user.userimage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                    .offset(y: 20)
                
                
                Text(message.message)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(10)
                    .background(Color.blue)
                    .frame(minWidth: 0, maxHeight: width / 2, alignment: .leading)
                    .clipShape(MessageBundle())
                   
                
                Spacer()
                
                
                
                
            }
            
            
        }
        .padding()
        
        
        
        
    }
}

struct MessageBundle : Shape {
    func path(in rect: CGRect) -> Path {
        return Path {path in
            
            let p1 = CGPoint(x: 0, y: 0)
            let p2 = CGPoint(x: rect.width, y: 0)
            let p3 = CGPoint(x: rect.width, y: rect.height)
            let p4 = CGPoint(x: 0, y: rect.height)
            
            path.move(to: p4)
            
            path.addArc(tangent1End: p4, tangent2End: p1, radius: 15)
            path.addArc(tangent1End: p1, tangent2End: p2, radius: 15)
            path.addArc(tangent1End: p2, tangent2End: p3, radius: 15)
            path.addArc(tangent1End: p3, tangent2End: p4, radius: 15)
            
        }
    }
}

