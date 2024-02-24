//
//  RightToLeftMarqueeAnimationStrategy.swift
//
//
//  Created by 최최광현 on 2/24/24.
//

import UIKit

public struct RightToLeftMarqueeAnimationStrategy: MarqueeAnimationStrategy {
    public typealias MarqueeAnimation = CABasicAnimation
    public var direction: MarqueeDirection { .leftToRight }
    public var speed: Double
    public var delay: Double

    public init(speed: Double = 30.0, delay: Double = 2.0) {
        self.speed = speed
        self.delay = delay
    }

    private func calculateDuration(_ width: Double) -> Double {
        width / speed + delay
    }
    
    private func homeOrigin(_ marqueeLabel: MarqueeLabel) -> Double {
        -marqueeLabel.subLabel.frame.size.width  / 2
    }
    
    private func awayOrigin(_ marqueeLabel: MarqueeLabel) -> Double {
        marqueeLabel.frame.minX + marqueeLabel.subLabel.frame.size.width
    }

    public func animation(_ marqueeLabel: MarqueeLabel) -> MarqueeAnimation {
        let animation = MarqueeAnimation(keyPath: "position.x")
        animation.fromValue = homeOrigin(marqueeLabel)
        animation.toValue = awayOrigin(marqueeLabel)
        animation.duration = calculateDuration(marqueeLabel.subLabel.frame.width)
        animation.repeatCount = .infinity
        return animation
    }
}
