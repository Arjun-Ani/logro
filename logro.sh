#!/bin/bash
for i in `cat logs.txt`
do
	b=`echo $i |awk -F"/" '{a=NF;print $a}'`
	c=`echo $i |awk -F"/" '{a=NF;for(k=1;k<NF;k++) print $k"/"}'`
	d=`echo $c|tr -d " "`
	cd $d
	ls -lt |awk '{print $9}'| grep "$b.*" > a.txt
	i=0
	while read line
	do
		if [ $i -gt 2 ]
		then
			rm -rf "$d$line"
		fi
		i=$((i+1))
	done < a.txt
done
