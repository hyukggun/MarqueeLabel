//
//  FullLengthSubLabelStrategy.swift
//
//
//  Created by 최최광현 on 2/21/24.
//

import Foundation

public struct FullLengthSubLabelSizeStrategy: SubLabelSizeStrategy {
    public var sizeFunction: SubLabelSizeFunction {
        { subLabel, bounds in
            // calculate the estimated size of the subLabel
            let estimatedSize = subLabel.sizeThatFits(CGSize(width: .greatestFiniteMagnitude, height: bounds.height))
            var newBounds = bounds
            newBounds.size.width = estimatedSize.width
            return newBounds
        }
    }
    
    public init() {
        print("FullLengthSubLabelSizeStrategy init")
    }
}

let fullLengthSubLabelSizeStrategy = FullLengthSubLabelSizeStrategy()
