read -p "Patch number `echo $'\n> '`" num
read -p "Dose per frame `echo $'\n> '`" dose
read -p "Pix size `echo $'\n> '`" pix


for f in *mrc
do
/usr/local/motioncor2/MotionCor2-10-19-2016 -InMrc $f -OutMrc sum/$f -Patch $num $num -FmDose $dose > ${f}_log.out

	while grep Repeat ${f}_log.out
	do
	count=$num
	count--
	/usr/local/motioncor2/MotionCor2-10-19-2016 -InMrc $f -OutMrc sum/$f -Patch $count $count -FmDose $dose 
	done

done
