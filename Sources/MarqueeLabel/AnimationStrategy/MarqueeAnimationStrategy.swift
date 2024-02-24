//
//  MarqueeAnimationStrategy.swift
//  
//
//  Created by 최최광현 on 2/24/24.
//

import UIKit

public protocol MarqueeAnimationStrategy {
    associatedtype MarqueeAnimation: CAAnimation
    var direction: MarqueeDirection { get }
    var speed: Double { get set }
    var delay: Double { get set }
    func animation(_ marqueeLabel: MarqueeLabel) -> MarqueeAnimation
}
