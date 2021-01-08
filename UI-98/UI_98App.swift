//
//  UI_98App.swift
//  UI-98
//
//  Created by にゃんにゃん丸 on 2021/01/08.
//

import SwiftUI

@main
struct UI_98App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .windowStyle(HiddenTitleBarWindowStyle())
    }
}

extension NSTextField{
    
    open override var focusRingType: NSFocusRingType{
        
        get{.none}
        set{}
    }
    
}

