# Valid-Boomerang

## Tip

Remember that you can calculate the slope of a line, having 2 points (x1,y1) and (x2,y2) like:

```
(y1-y2)
-------
(x1-x2)
```

So, to confirm 3 points are not in a straight line you should check if the slope created between the first point and the second is not the same as the one created between the first and the third.

```
(y1-y2)   (y1-y3)
------- = ------- -> (y1-y2)*(x1-x3) = (y1-y3)*(x1-x2)
(x1-x2)   (x1-x3)
```