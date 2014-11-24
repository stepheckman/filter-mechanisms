set more off 

log using "$results\format effect $date.smcl", replace


* simple effect of 3 filter formats
* all three yes sections together
* grouped format led to more trigger responses in these sections

use ffitem, replace
$subset 

svy: logit trigger i.format, or
est sto format_all
lincom 2.format - 3.format, or

svy: mean trigger, over(format)
lincom [trigger]_subpop_1  - [trigger]_subpop_2
lincom [trigger]_subpop_2  - [trigger]_subpop_3


* format effect by section
* effect disappears in sections 2 and 3

forv s = 1/3 {
	svy: logit trigger i.format if section==`s', or
	est sto format_s`s'
	lincom 2.format - 3.format, or
	
	svy: mean trigger if section==`s', over(format)
	lincom [trigger]_subpop_1  - [trigger]_subpop_2
	lincom [trigger]_subpop_2  - [trigger]_subpop_3	
}
* we do get more triggering responses in clothing section for varied than monotonous

esttab format_all format_s*, stats(N) eform ///
	mtit(allsec sec1 sec2 sec3)

capture log close
