iOS2.1
============

UI Lab
------------

The goal of this lab is to replicate the UI and animation(s) below:

![glow](http://media.giphy.com/media/AxVvkbUFU8TKvxTXQ4/giphy.gif)

![bounce](http://media.giphy.com/media/AxVvjUDlPrj5qw9jiw/giphy.gif)

You should focus on the first 'glow' animation to begin with. If you succeed, then try the second 'bounce' animation, which is more difficult.

Pay attention to details! Notice things like the small gap between the glowing ring and the button. Attention to detail is what distinguishes boring apps from great ones. 

Replicating the exact font is unnecessary, you can use `Helvetica Neue Condensed Black`, it is similar.

Helpful Reading
------------

We covered CoreAnimation briefly in iOS1, but if you are looking for a refresher, [the following  Documentation](https://developer.apple.com/library/ios/documentation/Cocoa/Conceptual/CoreAnimation_guide/CreatingBasicAnimations/CreatingBasicAnimations.html#//apple_ref/doc/uid/TP40004514-CH3-SW3) may be useful:

What we are doing here is referred to as an `explicit animation` in the above documentation.

Also, [this `objc.io` article](http://www.objc.io/issue-12/animations-explained.html) on animation will be extremely helpful:

Tips
------------

- You will need to create a UIButton subclass first to represent your button. 
- You will need to figure out how to represent the glowing layer. A CALayer would be best practice.
- You will need to figure out how to round the corners of the button, and how to represent the circular shape of the glowing layer.
- The glowing layer consists of 2 animations, one is a fade in/out of the `alpha` property, one is of the `transform` property, adjusting the scale from 1, down to a smaller value, and back up to 1.
- This is an exercise in `CoreAnimation`, the documentation will help you, but feel free to ask for anything you need. You will need to use `CABasicAnimation`s to complete this lab.
- For the bounce, you may find it difficult to emulate the `springiness`, do not worry about this, simply make the button bounce down on press, and back up on release. We will cover `UIDynamics` and alternate libraries for this such as `pop` in future. If you would like to attempt this now, I would recommend looking at [`pop`](https://github.com/facebook/pop), a powerful library that allows the use of `UIDynamics` style physics, using a `Core Animation` style API.
- For the bounce, you will need to add selectors to the following UIButton events: `UIControlEventTouchDown`,`UIControlEventTouchUpInside`,`UIControlEventTouchUpOutside`
- To improve the feel of your animations, play with the `easing`.

Useful Code Snippets
----------------

To create a `UIColor` with RGB values:
```objc
#define RGB(r, g, b)                                                           \
[UIColor colorWithRed : r / 255.0 green : g / 255.0 blue : b / 255.0 alpha : 1]
#define RGBA(r, g, b, a)                                                       \
[UIColor colorWithRed : r / 255.0 green : g / 255.0 blue : b / 255.0 alpha : a]
```
