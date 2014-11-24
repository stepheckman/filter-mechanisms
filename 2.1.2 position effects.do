set more off 

log using "$results\position effects $date.smcl", replace
	
* position effects

	

* does format effect vary within section (bigger diff bw formats later in section)?

use ffitem, replace
$subset

* make interaction term manually
gen format2order = (format==2)*order
gen format3order = (format==3)*order
*tab2 format3order format order, firstonly

svy: reg trigger i.format order format2order format3order
svy: logit trigger i.format order format2order format3order, or
est sto order

forv s = 1/3 {
	svy: logit trigger i.format order format2order format3order if section==`s', or
	est sto order`s'
}

esttab order*, nomtitle eform


capture log close
