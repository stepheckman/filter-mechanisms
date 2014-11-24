set more off
capture log close
clear all



*****************************************************************
* data quality in follow ups

* code heaping in income and duration
use ffcase, replace

forv filter = 1/6 {
	* flag heaping in income var
	gen income_heap2_`filter' = (round(fu2_`filter'_7a/100,1)==fu2_`filter'_7a/100) ///
		if filter2_`filter'==1 & !inlist(fu2_`filter'_7a,.a,.c,.d,.e)
	replace income_heap2_`filter' = 0 if fu2_`filter'_7a==0
	
	* flag heaping in duration var
	* 7777 (ongoing) should be missing on heaping var -- no opportunity to heap
	gen duration_heap2_`filter' = (round(fu2_`filter'_4d/6,1)==fu2_`filter'_4d/6) ///
		if filter2_`filter'==1 & !inlist(fu2_`filter'_4d,.a,.c,.d,.e, 7777)
	replace duration_heap2_`filter' = 0 if fu2_`filter'_4d==0
}

sum *heap*

keep *heap* intnr

preserve
	drop income*
	reshape long duration_heap, i(intnr) j(q) string
	tempfile heap1
	save `heap1'
restore

drop duration*
reshape long income_heap, i(intnr) j(q) string

merge 1:1 q intnr using `heap1'

gen fq0 = substr(q,1,strpos(substr(q,3,.),"_")-1+2)
replace fq0 = q if length(q) < 5
gen fq1 = subinstr(fq0,"_",".",.)
destring fq1, gen(fq)
replace fq = 4.11 if fq0=="4_10"
drop fq0 fq1

capture drop _merge

tempfile heap
save `heap'



* code WN/KA to follow ups in each filter

/* missing data codes:
.a filter skip
.c randomization skip
.d weiss nicht
.e keine angabe

 	recode missings according to email from Feder 22/7
	There are two different kinds of SYSMIS.
     -1 => No possibility to go to this question (e.g. Filtering)
     -3 => Possibility to go to this question, but not choosen in the variant 
             (e.g. 210.01 (2.1 1) yes, but not 211.00(2.1a) )
*/

use ffcase, replace

forv section = 1/3 {
	forv filter = 1/6 {
		* make .d .e valid answers so they can be counted
		qui: mvencode fu`section'_`filter'_*, mv(.d=-88 \ .e=-99)
		
		* count WN, KA answers to follow ups for this filter
		egen funr`section'_`filter' = anycount(fu`section'_`filter'_*), v(-88 -99)
		replace funr`section'_`filter' = 4 if funr`section'_`filter' > 4
		replace funr`section'_`filter' = . if mi(filter`section'_`filter') | filter`section'_`filter'==0
		gen funr`section'_`filter'_pct = funr`section'_`filter'/4
		lab var funr`section'_`filter' "# WN/KA to follow ups to this filter"
		lab var funr`section'_`filter'_pct "% WN/KA to FUs to this filter"
		*tab funr`section'_`filter' 
	}
}


forv filter = 1/10 {
	* make .d .e valid answers so they can be counted
	qui: mvencode fu4_`filter'_*, mv(.d=-88 \ .e=-99)
	
	* count WN, KA answers to follow ups for this filter
	egen funr4_`filter' = anycount(fu4_`filter'_*), v(-88 -99)
	replace funr4_`filter' = 4 if funr4_`filter' > 4
	replace funr4_`filter' = . if mi(filter4_`filter') | filter4_`filter'==0
	gen funr4_`filter'_pct = funr4_`filter'/4
	lab var funr4_`filter' "# WN/KA to follow ups to this filter"
	lab var funr4_`filter'_pct "% WN/KA to FUs to this filter"
	*tab funr4_`filter' 
}

sum funr*




preserve

	keep filter* interleafed monotonous grouped varied intnr intw_* ///
		consent fconspo filterform f?intra fyesno f1f2f3 yestrig notrig stratum ///
		big5_* age v90300 
	
	rename filterformat format
	rename v90300 education
	
	lab var format "filter question format 1-4"

	reshape long filter, i(intnr) j(q) string

	gen changed = strmatch(q,"*_changed")
	gen hist = strmatch(q,"*_hist")

	gen fq0 = substr(q,1,strpos(substr(q,3,.),"_")-1+2)
	replace fq0 = q if length(q) < 5
	gen fq1 = subinstr(fq0,"_",".",.)
	destring fq1, gen(fq)
	replace fq = 4.11 if fq0=="4_10"
	drop fq0 fq1

	capture drop _merge

	tempfile reshape_filter
	save `reshape_filter'
restore

* back to follow up nonresponse dataset here
keep intnr funr*_pct
	
reshape long funr, i(intnr) j(q) string

gen fq0 = substr(q,1,strpos(substr(q,3,.),"_")-1+2)
replace fq0 = q if length(q) < 5
gen fq1 = subinstr(fq0,"_",".",.)
destring fq1, gen(fq)
replace fq = 4.11 if fq0=="4_10"
drop fq0 fq1

capture drop _merge

tempfile reshape_funr
save `reshape_funr'



* make version of reshaped data with indicator of answer changed
use `reshape_filter'

keep if changed & !hist

gen filter_changed = filter

keep intnr filter_changed fq

tempfile fc
save `fc'


* reshaped data (at filter level)
use `reshape_filter'

keep if !changed & !hist
drop changed hist

capture drop _merge
merge 1:1 intnr fq using `fc'
capture drop _merge
merge 1:1 intnr fq using `reshape_funr'
capture drop _merge
merge 1:1 intnr fq using `heap'
capture drop _merge

gen section = floor(fq)
gen ysection = (section <= 3)
lab var ysection "q part of a yes filter section"

sum filter
sum funr*

gen trigger = filter if section <= 3
replace trigger = 1-filter if section > 3 & notrig
replace trigger = filter if section > 3 & yestrig
lab var trigger "filter answered with triggering response"
lab val trigger filter

egen itag = tag(intnr)


** rename variables to match Annettes analysis doc
gen grpall = (format==1)
gen grptopic = (format==2)
gen interlmon = (format==3)
gen interlvar = (format==4)

gen nofilt = (ysection==0)
gen yesfilt = (ysection==1)

gen nofirst = (fyesno==2)
gen yesfirst = 1-nofirst

gen clothfirst = inlist(f1f2f3,1,2) * yesfirst


***********************************************************************
* ordering of quetions

* order within section
gen section_order = f1intra if section==1 
replace section_order = f2intra if section==2
replace section_order = f3intra if section==3
*replace section_order= f4intra if section==4
*lab copy F1intra section_order 
lab val section_order section_order


* order of filters within sections 1,2,3
gen order = (fq-section)*10 if inlist(section,1,2,3) & section_order==1
replace order = 7-(fq-section)*10 if inlist(section,1,2,3) & section_order==2

* order of filters within section 4
gen templtr = (fq-section)*10 if section==4 
replace templtr = 10 if templtr>1 & templtr< 2

* make orders for section 4 filters
forv l = 1/10 {
	replace order = 1 if substr(f4intra, templtr, 1)=="A" & templtr==`l'
	replace order = 2 if substr(f4intra, templtr, 1)=="B" & templtr==`l'
	replace order = 3 if substr(f4intra, templtr, 1)=="C" & templtr==`l'
	replace order = 4 if substr(f4intra, templtr, 1)=="D" & templtr==`l'
	replace order = 5 if substr(f4intra, templtr, 1)=="E" & templtr==`l'
	replace order = 6 if substr(f4intra, templtr, 1)=="F" & templtr==`l'
	replace order = 7 if substr(f4intra, templtr, 1)=="G" & templtr==`l'
	replace order = 8 if substr(f4intra, templtr, 1)=="H" & templtr==`l'
	replace order = 9 if substr(f4intra, templtr, 1)=="J" & templtr==`l'
	replace order = 10 if substr(f4intra, templtr, 1)=="K" & templtr==`l'
}


gen ysectionpos = 0 if ysection
replace ysectionpos = 1 if ysection & f1f2f3==1 & section==1
replace ysectionpos = 2 if ysection & f1f2f3==1 & section==2
replace ysectionpos = 3 if ysection & f1f2f3==1 & section==3
replace ysectionpos = 1 if ysection & f1f2f3==2 & section==1
replace ysectionpos = 2 if ysection & f1f2f3==2 & section==3
replace ysectionpos = 3 if ysection & f1f2f3==2 & section==2
replace ysectionpos = 1 if ysection & f1f2f3==3 & section==2
replace ysectionpos = 2 if ysection & f1f2f3==3 & section==1
replace ysectionpos = 3 if ysection & f1f2f3==3 & section==3
replace ysectionpos = 1 if ysection & f1f2f3==4 & section==2
replace ysectionpos = 2 if ysection & f1f2f3==4 & section==3
replace ysectionpos = 3 if ysection & f1f2f3==4 & section==1
replace ysectionpos = 1 if ysection & f1f2f3==5 & section==3
replace ysectionpos = 2 if ysection & f1f2f3==5 & section==1
replace ysectionpos = 3 if ysection & f1f2f3==5 & section==2
replace ysectionpos = 1 if ysection & f1f2f3==6 & section==3
replace ysectionpos = 2 if ysection & f1f2f3==6 & section==2
replace ysectionpos = 3 if ysection & f1f2f3==6 & section==1

gen sectionpos = ysectionpos if fyesno==1 & ysection 
replace sectionpos = ysectionpos+1 if fyesno==2 & ysection
replace sectionpos = 1 if fyesno==2 & !ysection
replace sectionpos = 4 if fyesno==1 & !ysection

gen tp = sectionpos*100 + order
sort intnr tp
bys intnr: gen totalpos = _n

gen filterpos=order

gen qnumber = (fq-section)*10
replace qnumber = 10 if qnumber>1 & qnumber<2

* make cum number of triggers overall and by section for this R
sort intnr totalpos
by intnr: gen cum_triggers = sum(trigger)


tostring fq, gen (fqitem)
lab var fq "filter question number, int var"
lab var fqitem "filter question number, str var"
lab var interleafed "case in one of interleafed formats"
lab var grouped "case in one of grouped formats"
lab var monotonous "case received monotonous follow ups (grouped or interleafed)"
lab var varied "case received varied follow ups (interleafed only)"
lab var section "filter question section"
lab var grpall "grouped overall filter format"
lab var grptopic "grouped by topic filter format"
lab var interlmon "interleafed monotonous filter format"
lab var interlvar "interleafed varied filter format"
lab var nofilt "fq is triggered by no"
lab var yesfilt "fq is triggered by yes"
lab var sectionpos "position of section for R"
lab var ysectionpos "position of section within yes block for R"
lab var order "Order of question within section (as administered)"
lab var filter "Value of answer to filter question"
lab var filterpos "order within section of fq for R (same as order)"
lab var totalpos "order of fq across all sections, for R"
lab var nofirst "no sections occur before yes sections"
lab var yesfirst "yes sections occur before no sections"
lab var section_order "Order of filters (up or Down) w/in section"
lab var qnumber "question in section, refers to paper quex, regardless of order asked"
lab var filter_changed "answer to filter question changed"

drop f?intra tp templtr q

* remove label from this var
lab val trigger 

svyset intnr

compress
save ffitem, replace


exit







