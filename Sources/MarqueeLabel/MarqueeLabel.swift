// The Swift Programming Language
// https://docs.swift.org/swift-book

#if canImport(UIKit)
import UIKit

public class MarqueeLabel: UILabel {
    
    // Present the status for sub lable active status.
    private enum MarqueeSubLabelState: Equatable, Hashable {
        case active
        case inactive
    }
    
    private(set) var subLabel = UILabel()
    
    private var animationKey: String { "marqueeAnimation" }
    
    private var colorStorageKey: UInt8 = 1
    
    public var autoScroll: Bool = false
    
    public var scrollSpeed: Double = 30

    public var bufferSecond: Double = 2
    
    public var subLabelSizeStrategy: SubLabelSizeStrategy? {
        didSet {
            setSubLabelFrame()
        }
    }
    
    public var animationStrategy: (any MarqueeAnimationStrategy)?
    
    override public var text: String? {
        get {
            subLabel.text
        }
        set {
            if subLabel.text == newValue { return }
            subLabel.text = newValue
            super.text = text
        }
    }
    
    public var storedColor: UIColor? {
        get {
            guard let color = objc_getAssociatedObject(self, &colorStorageKey) as? UIColor else { return UIColor.black }
            return color
        }
        set {
            objc_setAssociatedObject(self, &colorStorageKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    override public var font: UIFont? {
        didSet {
            subLabel.font = font
        }
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        addSubview(subLabel)
        subLabel.numberOfLines = 1
        subLabel.isHidden = true
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        setSubLabelFrame()
        createAnimation()
    }

    private func createAnimation() {
        guard let animationStrategy, subLabel.layer.animation(forKey: animationKey) == nil else { return }
        let animation = animationStrategy.animation(self)
        subLabel.layer.speed = .zero
        subLabel.layer.add(animation, forKey: animationKey)
    }
    
    private func toggleSubLabelState(_ state: MarqueeSubLabelState) {
        subLabel.isHidden = state == .active ? false : true
        if state == .active {
            createAnimation()
            subLabel.layer.speed = 1.0
        } else {
            subLabel.layer.speed = .zero
        }
    }
    
    private func removeAnimation() {
        subLabel.layer.removeAnimation(forKey: animationKey)
    }
    
    public func start() {
        textColor = .clear
        toggleSubLabelState(.active)
    }
    
    public func stop() {
        textColor = .black
        toggleSubLabelState(.inactive)
    }
    
    private func setSubLabelFrame() {
        if let subLabelSizeStrategy {
            subLabel.frame = subLabelSizeStrategy.sizeFunction(subLabel, bounds)
        } else {
            subLabel.frame = defaultSubSizeStrategy.sizeFunction(subLabel, bounds)
        }
    }
}
#endif
