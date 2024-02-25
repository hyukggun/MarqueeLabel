//
//  MarqueeText.swift
//
//
//  Created by 최최광현 on 2/20/24.
//

#if canImport(UIKit)
import SwiftUI
import UIKit

public struct MarqueeText<Animation>: UIViewRepresentable where Animation: MarqueeAnimationStrategy {
    @State
    public var title: String
    
    @State
    public var animation: Animation
    
    @Binding
    public var play: Bool
    
    public init(title: String, animation: Animation, play: Binding<Bool>) {
        self._title = State(initialValue: title)
        self._animation = State(initialValue: animation)
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

