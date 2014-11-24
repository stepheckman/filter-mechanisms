set more off 

capture log close
log using "$results\rr breakoffs $date.smcl", replace


* trigger rates by section -- by question, order, and format
use ffitem, replace
$subset

d, short
unique intnr

table qnumber section, c(mean filter) row col format(%5.2f) 

table qnumber section if inlist(format,1,2,3), c(mean trigger) row col format(%5.2f) 

table order section, c(mean filter) row col format(%5.2f)

table format section, c(mean trigger) row col format(%5.2f)

* avg filters triggered by section
collapse (mean) filter trigger, by(section fq)
collapse (sum) filter trigger, by(section)
replace filter = round(filter,.01)
replace trigger = round(trigger,.01)
li section filter trigger, noobs 

capture log close

exit 
