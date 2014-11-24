
******************************************************************
* missing values
/* missing data codes:
.a filter skip
.c randomization skip
.d weiss nicht
.e keine angabe
.f as said above (needed in SD section)

 	recode missings according to email from Feder 22/7
	There are two different kinds of SYSMIS.
     -1 => No possibility to go to this question (e.g. Filtering)
     -3 => Possibility to go to this question, but not choosen in the variant 
             (e.g. 210.01 (2.1 1) yes, but not 211.00(2.1a) )
*/
qui: recode td* te* tb* (-3=.c) (-1=.a) 

foreach v in $intrvars0 {
	mvdecode v`v', mv(-3=.c \ -1=.a)
	capture mvdecode h`v', mv(-3=.c \ -1=.a)
}



gen intw_dt = mdy(emon, etag, 2011)
format intw_dt %td

* WN, KA responses

foreach s in $vars89 {
	recode v`s' (8=.d) (9=.e)
	capture label def v`s' $misslabs, add
}

foreach s in $vars8899 {
	recode v`s' (88=.d) (99=.e)
	capture lab def v`s' $misslabs, add
}

foreach s in $vars888999{	
	recode v`s' (888=.d) (999=.e)
	capture lab def v`s' $misslabs, add
}

/*21416bt 22416bt 23416bt 24416bt 25416bt 26416bt ///
	21416dt 22416dt 23416dt 24416dt 25416dt 26416dt ///
	51600 52600 53600 54600 55600 56100 56600*/
	
foreach s in $vars88889999{	
	recode v`s' (8888=.d) (9999=.e)
	label def v`s' $misslabs, add
}

* variables that use 88888 and 99999
foreach s in 21601 22601 23601 24601 25601 26601 {	
	mvdecode v`s', mv(88888=.d \ 99999=.e)
	lab drop v`s'
	label def v`s' $misslabs
}

* variables that use 888888 and 999999
foreach s in 11601 12601 13601 14601 15601 16601 90801 {
	replace v`s' =  .d if v`s' == 888888
	replace v`s' =  .e if v`s' == 999999
}

foreach s in 21601 23601 {
	replace v`s' =  .d if v`s' == 88888
	replace v`s' =  .e if v`s' == 99999
}

foreach s in 26601w 26601w 26601w 26601w 26601w 26601w {
	replace v`s' =  ".d" if v`s' == "8"
	replace v`s' =  ".e" if v`s' == "9"
}


* recode filters to no=0, rather than no=2
foreach s in $filters {
	recode v`s' h`s' (2=0)	
}

lab def currency 1 "Deutsch Marks" 2 "Euros" 3 "Ost Marks" 4 "Other" $misslabs

foreach v in v21601w v21606w v22601w v22606w v23601w v23606w v24601w v24606w v25601w v25606w v26601w v26606w {
	gen `v'c = 0
	copydesc `v' `v'c

	replace `v'c = 1 if `v'=="D" | `v'=="DD"
	replace `v'c = 2 if `v'=="E" | `v'=="EE"
	replace `v'c = 3 if `v'=="O" | `v'=="OO"
	replace `v'c = 4 if `v'=="X" | `v'=="XX"
	replace `v'c = .c if `v'=="-3"
	replace `v'c = .a if `v'=="-1"
	replace `v'c = .d if `v'=="8" | `v'=="88" | `v'==".d"
	replace `v'c = .e if `v'=="9" | `v'=="99" | `v'==".e"
	
	lab val `v'c currency
	assert `v'c != 0
}


* fix missing values in demongraphics section
mvdecode v90700, mv(77=.f)
mvdecode v90801, mv(777777=.f)

lab drop v90801 v90700
lab def v90801 $misslabs
lab def v90700 $misslabs


