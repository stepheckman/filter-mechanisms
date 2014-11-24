set more off

log using "$results\quality in FUs $date.smcl", replace


* data quality in follow ups

use ffitem, replace

* compare mean WN/KA rates in follow ups between formats 
* over all sections, all 4 formats
svy: mean funr if ysection, over(format)
lincom [funr]_subpop_2 - [funr]_subpop_3
lincom [funr]_subpop_1 - [funr]_subpop_3

* compare grouped to interleafed monotonous by section
drop if varied
forv s = 1/3 {
	capture drop section`s'
	gen section`s' = (section==`s')
	di
	di
	di "*************************** section " `s'
	svy, subpop(section`s'): mean funr, over(grouped)
	lincom [funr]Nein - [funr]Ja
}

* compare income heaping KA rates in follow ups between formats 
* income heaping defined as multiple of 100
* section 2 only
svy: mean income_heap, over(format)
lincom [income_heap]_subpop_2 - [income_heap]_subpop_3
lincom [income_heap]_subpop_1 - [income_heap]_subpop_3

* compare duration heaping KA rates in follow ups between formats 
* duration heaping defined as multiple of 6 months
* section 2 only
svy: mean duration_heap, over(format)
lincom [duration_heap]_subpop_2 - [duration_heap]_subpop_3
lincom [duration_heap]_subpop_1 - [duration_heap]_subpop_3

capture log close

exit
