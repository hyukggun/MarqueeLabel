<img src="./marqueeLabel-icon.webp" width="30%"/>

# MarqueeLabel

MarqueeLabel is a library used to create moving text labels in iOS applications.

## Key Features

* Allows control over the movement of text labels.
* Provides functionality to create and update moving text labels.

## Installation
* This project is managed using the Swift Package Manager. Therefore, you can add this library to your project using the Swift Package Manager.

## Usage
* 1. add an marquee label to a UIViewController or a UIView.
* 2. set the animation strategy making the marquee animation such as the scrolling direction, the animation speed and the delay seconds.
* 3. call the `start` function to start an animation. 

### UIKit exmaple
A simple usage example is written in Example/MarqueeExample/ViewController.swift
```swift
class ViewController: UIViewController {
    // marquee labels.
    let leftToRightMarqueeLabel = MarqueeLabel()
    
    let leftToRightMarqueeLabel = MarqueeLabel()
    
    let pinnedMarqueeLabel = MarqueeLabel()

    //...

    // setup animation strategies for marquee labels.
    private func setupMarqueeAnimation() {
        // setting left to right animation with 30px/seconds and 2 delay seconds
        leftToRightMarqueeLabel.animationStrategy = LeftToRightMarqueeAnimationStrategy(speed: 30, delay: 2)
        // setting left to right animation with 50px/seconds and 3 delay seconds
        rightToLeftMarqueeLabel.animationStrategy = RightToLeftMarqueeAnimationStrategy(speed: 50, delay: 3)
    }    

    // setup marquee label's sublabel size startegy.
    private func setupMarqueeSizeStrategy() {
        // if the text is too long, the text in the marquee label is clipped like 'abcedfghi...'
        // FullLengthSubLabelSizeStrategy is the subLabelSizeStrategy setting sub label not clipped.
        rightToLeftMarqueeLabel.subLabelSizeStrategy = FullLengthSubLabelSizeStrategy()
    }
}
```

### SwiftUI Exmaple
```swift
//
//  MarqueeLabelExmaplePage.swift
//  MarqueeLabelExmaple
import SwiftUI
import MarqueeLabel

struct MarqueeLabelExmaplePage: View {
    
    @State
    var playing: Bool = false
    
    var body: some View {
        VStack {
            MarqueeText(title: "lorem ipsum", animation: LeftToRightMarqueeAnimationStrategy(), play: $playing)
            Button(action: {
                playing = true
            }, label: {
                Text("Play")
            })
        }
    }
}

#Preview {
    MarqueeLabelExmaplePage()
}
```
## License
MIT License
