//
//  MarqueeLabelUI.swift
//
//
//  Created by 최최광현 on 2/20/24.
//

#if canImport(UIKit)
import SwiftUI
import UIKit

public struct MarqueeLabelUI: UIViewRepresentable {
    @State
    public var title: String
    
    @Binding
    public var play: Bool
    
    public init(title: String, play: Binding<Bool>) {
        self.title = title
        self._play = play
    }
    
    public func makeUIView(context: Context) -> MarqueeLabel {
        let label = MarqueeLabel()
        label.text = title
        return label
    }
    
    public func updateUIView(_ uiView: MarqueeLabel, context: Context) {
        if play { uiView.start() }
        else { uiView.stop() }
    }
}
#endif

