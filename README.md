# TrebuchetSort
 Alphabetically sort items in Android's Trebuchet app folders

Run as root (in termux).

cellX and cellY parameters seem to be ignored in folders despite being set properly 
by Trebuchet (no arbitrary/floating icon placements), and rank is the true sort order.  
But why not just do it right, right?

Upgraded from LineageOS 19 to 20 (android 11 to 13) and lost your meticulous desktop folders and icon layouts???  Trebuchet now stores the layouts in launcher_X_by_Y.db and you can restore your old layout by copying launcher.db over the corresponding XbyY.db.  You will lose your widgets, however.

-Erik Johnson - EkriirkE
