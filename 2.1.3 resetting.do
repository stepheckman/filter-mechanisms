set more off 

log using "$results\resetting $date.smcl", replace


* look at first question in each section, test for diffs between 
* formats 1,2,3
* ratio graphs suggest grouped by topic and interleafed the same for 1st q
* but may both be underreporting compared to grouped overall 
* if there is across section learning (no resetting)
use ffitem, replace
$subset
keep if order==1

* drop first filter question, no format effect or resetting possible
* keep only 2 questions per respondent
svy: logit trigger i.format if ysectionpos!=1, or
lincom 2.format - 3.format

* looks like support for resetting!



* does format effect vary with section positon?
* 	resetting says no -- no across section effects
*	if Rs learn over sections -- stronger effects in later sections
use ffitem, replace
$subset
keep if format==2 | format==3

svy: reg trigger i.format i.ysectionpos i.format##i.ysectionpos 
svy: logit trigger i.format i.ysectionpos i.format##i.ysectionpos, or

* looks like support for resetting!


* overall position in quex, across all sections
use ffitem, replace
$subset
keep if format==1


svy: logit filter totalpos

svy: logit filter totalpos if section==1

svy: logit filter totalpos if section==1 & qnumber==1

svy: logit filter totalpos if section==1 & qnumber==6


capture log close

exit
