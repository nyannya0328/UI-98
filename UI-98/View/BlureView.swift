//
//  BlureView.swift
//  UI-98
//
//  Created by にゃんにゃん丸 on 2021/01/08.
//

import SwiftUI

struct BlureView: NSViewRepresentable {
    func makeNSView(context: Context) -> NSVisualEffectView {
        
        let view = NSVisualEffectView()
        view.blendingMode = .behindWindow
        return view
        
    }
    
    func updateNSView(_ nsView: NSVisualEffectView, context: Context) {
        
    }
}

