iOS2.1
============

UI Lab
------------

The goal of this lab is to replicate the UI and animation(s) below:

![glow](http://media.giphy.com/media/AxVvkbUFU8TKvxTXQ4/giphy.gif)

![bounce](http://media.giphy.com/media/AxVvjUDlPrj5qw9jiw/giphy.gif)

You should focus on the first 'glow' animation to begin with. If you succeed, then try the second 'bounce' animation, which is more difficult.

Helpful Reading
------------

We covered CoreAnimation briefly in iOS1, but if you are looking for a refresher, the following may be useful:
https://developer.apple.com/library/ios/documentation/Cocoa/Conceptual/CoreAnimation_guide/CreatingBasicAnimations/CreatingBasicAnimations.html#//apple_ref/doc/uid/TP40004514-CH3-SW3

What we are doing here is referred to as an `explicit animation`.

Tips
------------

- You will need to create a UIButton subclass first to represent your button. 
- You will need to figure out how to represent the glowing layer. A CALayer would be best practice.
- You will need to figure out how to round the corners of the button, and how to represent the circular shape of the glowing layer.
- The glowing layer consists of 2 animations, one is a fade in/out of the `alpha` property, one is of the `transform` property, adjusting the scale from 1, down to a smaller value, and back up to 1.
- This is an exercise in `CoreAnimation`, the documentation will help you, but feel free to ask for anything you need. You will need to use `CABasicAnimation`s to complete this lab.
- For the bounce, you may find it difficult to emulate the `springiness`, do not worry about this, simply make the button bounce down on press, and back up on release. We will cover `UIDynamics` and alternate libraries for this such as `pop` in future. 
- For the bounce, you will need to add selectors to the following UIButton events: `UIControlEventTouchDown`,`UIControlEventTouchUpInside`,`UIControlEventTouchUpOutside`
- To improve the feel of your animations, play with the `easing`.

