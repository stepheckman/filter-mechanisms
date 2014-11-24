set more off 

capture log close
log using "$results\rr breakoffs $date.smcl", replace

qui {

use addressdt, replace

*drop adr* ort* plz* bundesland* vorname* nachname* tel?_number

gen complete = (main_status_code==1)

* count completes by replicate
egen repcomplete = sum(complete), by(replicate stratum)

* these are the replicates not used
drop if repcomplete==0

* flag dead respondents, take out of RR
gen deadr = (sub_status_code=="93") 

preserve
	collapse (sum) num_rr = complete (sum) deadr (count) count=case_id, by(stratum)

	gen denom_rr = count-deadr

	* RR by stratum
	gen rr = num_rr/denom_rr
	
	tempfile rr_strat
	save `rr_strat'
restore

collapse (sum) num_rr = complete (sum) deadr (count) count=case_id

gen denom_rr = count-deadr

* RR by stratum
gen rr = num_rr/denom_rr
	
tempfile rr
save `rr'
}


* RR by stratum
use `rr_strat'
li stratum num_rr rr

* overall RR
use `rr'
li num_rr rr


qui {
use incompletes, clear
drop *_changed

* look for any valid answer to any filter q
mvencode filter?_*, mv(.d=8 \ .e=9)
egen filterresp = anymatch(filter?_*), values(1 2 8 9)
tab filterresp

gen breakoff=1

* keep only cases that answered at least 1 filter question
keep if filterresp


* append these breakoffs to full dataset
qui: append using ffcase, gen(app)
replace breakoff=0 if app==1

drop if varied
}

tab breakoff

mean breakoff, over(filterformat)
	
logit breakoff i.filterformat, or


capture log close
exit
