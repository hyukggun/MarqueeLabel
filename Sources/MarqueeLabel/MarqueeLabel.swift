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
    
    private var subLabel = UILabel()
    
    private var animationKey: String { "marqueeAnimation" }
    
    private var colorStorageKey: UInt8 = 1
    
    public var autoScroll: Bool = false
    
    public var duration: Double = 7.5
    
    public var subLabelSizeStrategy: SubLabelSizeStrategy? {
        didSet {
            setSubLabelFrame()
        }
    }
    
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
        guard subLabel.layer.animation(forKey: animationKey) == nil else { return }
        let animation = CABasicAnimation(keyPath: "position.x")
        let homeOrigin = frame.maxX
        let awayOrigin = -(subLabel.frame.size.width / 2)
        animation.fromValue = homeOrigin
        animation.toValue = awayOrigin
        animation.duration = duration
        animation.repeatCount = .infinity
        animation.isRemovedOnCompletion = false
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
    
    private func updateAndScroll() {
        let expectedLabelSize = subLabel.desiredSize()
        invalidateIntrinsicContentSize()
        subLabel.textColor = super.textColor
        subLabel.textAlignment = super.textAlignment
        subLabel.lineBreakMode = super.lineBreakMode
        subLabel.adjustsFontSizeToFitWidth = super.adjustsFontSizeToFitWidth
        subLabel.minimumScaleFactor = super.minimumScaleFactor
    }
}


fileprivate extension UILabel {
    func desiredSize() -> CGSize {
        // Bound the expected size
        let maximumLabelSize = CGSize(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude)
        // Calculate the expected size
        var expectedLabelSize = self.sizeThatFits(maximumLabelSize)
        
        #if os(tvOS)
            // Sanitize width to 16384.0 (largest width a UILabel will draw on tvOS)
            expectedLabelSize.width = min(expectedLabelSize.width, 16384.0)
        #else
            // Sanitize width to 5461.0 (largest width a UILabel will draw on an iPhone 6S Plus)
            expectedLabelSize.width = min(expectedLabelSize.width, 5461.0)
        #endif

        // Adjust to own height (make text baseline match normal label)
        expectedLabelSize.height = bounds.size.height
        return expectedLabelSize
    }
}
#endif
