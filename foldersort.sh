#!/bin/bash
db="/data/data/com.android.launcher3/databases/launcher.db"

read mx my <<< $(sqlite3 -tabs $db "SELECT MAX(cellX),MAX(cellY) FROM favorites WHERE container>0;")
echo Using folder grid of $mx"x"$my

sqlite3 -tabs $db "SELECT c.title,i._id,i.title FROM favorites i INNER JOIN favorites c ON c._id=i.container ORDER BY c.title,LOWER(i.title);" | while read f r i; do
	if [ ! "$f" = "$of" ]; then
		echo Entering $f
		of="$f"
		x=0
		y=0
		k=0
	fi
	if [ $x -gt $mx ]; then
		x=0
		((y=y+1))
	fi
	[ $y -gt $my ] && y=0
	sqlite3 $db "UPDATE favorites SET cellX=$x,cellY=$y,rank=$k WHERE _id=$r"
	echo "	$x,$y:$k=$i"
	((x=x+1))
	((k=k+1))
done
pkill launcher3

