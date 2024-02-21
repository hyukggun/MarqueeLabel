//
//  SubLabelSizeStrategy.swift
//
//
//  Created by 최최광현 on 2/21/24.
//
#if canImport(UIKit)
import Foundation
import UIKit

public typealias SubLabelSizeFunction = (_ subLabel: UILabel, _ mainBounds: CGRect) -> CGRect

public protocol SubLabelSizeStrategy {
    var sizeFunction: SubLabelSizeFunction { get }
}
#endif
