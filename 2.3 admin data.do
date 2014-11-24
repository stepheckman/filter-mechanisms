set more off 

log using "$results\admin data $date.smcl", replace

/* 
exploit admin data as far as we can

strata:
ALG1  1: BeH, mind. 1 LeH, kein LHG, kein XLHG
ALG2  2: BeH, mind. 1 LHG in 2010, LeH beliebig, XLHG beliebig
empl  3: BeH mit mind. 2 BNR, kein LeH, kein LHG, kein XLHG

strata 1 should have said YES to filter3_6
strata 2 should have said YES to filter3_5
strata 3 should have said YES to filter2_1 and 2_2
*/


use ffcase, replace
drop if varied

* indicator for full or part time work
gen full = (filter2_1==1)

* create error vars

* stratum 2 cases should report ALG2 in 2010
* stratum 1, 3 shoudl NOT report ALG2 in 2010
capture drop alg2_undererr alg2_overerr
gen alg2_undererr = (filter3_5!=1 & stratum==2)
gen alg2_overerr = (filter3_5==1 & stratum!=2)
tab2 stratum alg2_undererr alg2_overerr, firstonly

* stratum 3 should NOT report ALG1 in 2010
* error prone b/c q asked at HH level, admin data is for person only
capture drop emp_overerr
gen emp_overerr = (filter3_6==1 & stratum==3)

* ALL cases (in all strata) are in BEH, so most should have had full time job
capture drop emp_undererr
gen emp_undererr = (full != 1)



*********************************************************************
* look at underreporting error rates in ALG2 question

mean alg2_undererr, over(grouped)
lincom [alg2_undererr]Nein - [alg2_undererr]Ja

mean alg2_undererr if stratum==2, over(grouped)
lincom [alg2_undererr]Nein - [alg2_undererr]Ja

mean alg2_undererr if stratum==2, over(filterformat)
lincom [alg2_undererr]_subpop_2 - [alg2_undererr]_subpop_3 


* overreporting error rates in ALG2 question
mean alg2_overerr, over(grouped)
lincom [alg2_overerr]Nein - [alg2_overerr]Ja

mean alg2_overerr if inlist(stratum,1,3), over(grouped)
lincom [alg2_overerr]Nein - [alg2_overerr]Ja

mean alg2_overerr if inlist(stratum,1,3), over(filterformat)
lincom [alg2_overerr]_subpop_2 - [alg2_overerr]_subpop_3 



* underreporting error rates in full/part employment
mean emp_undererr, over(grouped)
lincom [emp_undererr]Nein - [emp_undererr]Ja

mean emp_undererr, over(filterformat)
lincom [emp_undererr]_subpop_2 - [emp_undererr]_subpop_3 


**** CONCLUSION
* burden hypothesis suggests MORE UNDERREPORTING ERROR in interleafed vs grouped
* acq hypothesis suggest MORE OVERREPORTING ERROR in interleafed vs grouped



* how many Rs reported fulltime employment spells that started <= 2010
* we can validate these
gen VZ_validate = (fu2_1_4yb <=2010 & !mi(fu2_1_4yb))
replace VZ_validate = . if mi(fu2_1_4yb)

* % validateable (of those answering)
tab VZ_validate

capture log close

exit


