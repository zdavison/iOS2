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
- First focus on simply drawing the arc. Afterwards, try and animate it between values. To animate it, you will need to read up on `needsDisplayForKey:` and `actionForKey:`.
- To draw the arc, you will want to override the `drawInContext:` method of CALayer. 
- There are many helper functions to help you draw an arc in Core Graphics, have a look at `CGPathAddArc`.
