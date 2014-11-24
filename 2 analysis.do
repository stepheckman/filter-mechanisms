set more off
capture log close
clear all

* only these cases used in this paper
global subset "drop if varied | section==4"


do "$code\2.0 response rates.do"

do "$code\2.1.0 trigger rates.do"

do "$code\2.1.1 simple format effects.do"

do "$code\2.1.2 position effects.do"

do "$code\2.1.3 resetting.do"

do "$code\2.3 admin data.do"

do "$code\2.5 quality in FUs.do"


capture log close

exit

