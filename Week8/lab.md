iOS 2.8
=================

The goal of this lab is to create a 'speedometer' like arc view component that can be adjusted like a progress bar, as below:
Do not focus too heavily on making your progress bar appear as nice as the one below, the functionality is the most important part.

![arc](http://www.code4app.net/photo/1421139318_1.gif)

Goals
=================

- Create a UIView subclass that can render an arc based on a progress value.
- Provide some mechanism to adjust this progress value to see the arc update in realtime. (A UISlider would be a simple solution).

Hints
================

- This is non-trivial. You will need to subclass CALayer, in addition to UIView. There are many guides on the web on how to do this. Ask questions if you are unsure of how to proceed.
- First focus on simply drawing the arc. Afterwards, try and animate it between values. To animate it, you will need to read up on `needsDisplayForKey:` and `actionForKey:`, and `initWithLayer:`.
- To draw the arc, you will want to override the `drawInContext:` method of CALayer. 
- There are many helper functions to help you draw an arc in Core Graphics, have a look at `CGPathAddArc`.
-  If you have trouble getting your layer to draw (eg: `drawInContext:` does not get called), try calling `setNeedsDisplay` on the layer.

Step by Step 
===============

- First get a CALayer added to your UIViewController's view, set it's backgroundColor property to something so you can see it.
- Now subclass CALayer and use that class instead. Override `drawInContext` and try performing a simple drawing operation (filling an ellipse, for example)
- Now try drawing a slice of a pie chart.
- Now try drawing an arc, rather than a pie slice.
- Now implement a `progress` property that you can set that will set the length of the arc.
- Now try making it re-draw whenever this property changes.
- Now try binding this to some control so you can update it in real time (eg: a UISlider)
- Now try and implement the `needsDisplayForKey:` and `actionForKey:` methods to make it automatically animate. You will also need to implement `initWithLayer:` to copy across your properties. A detailed guide on animating custom properties is [here](http://www.objc.io/issue-12/animating-custom-layer-properties.html).
