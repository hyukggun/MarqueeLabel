//
//  DefaultSubLabelSizeStrategy.swift
//
//
//  Created by 최최광현 on 2/21/24.
//

#if canImport(UIKit)
import Foundation
import UIKit

struct DefaultSubLabelSizeStrategy: SubLabelSizeStrategy {
    var sizeFunction: SubLabelSizeFunction {
        { subLabel, rect  in
            return rect
        }
    }
    
    init() {
        print("DefaultSubLabel init")
    }
}

internal let defaultSubSizeStrategy = DefaultSubLabelSizeStrategy()
#endif
