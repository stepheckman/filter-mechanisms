set more off

log using "$results\multilevel models.smcl", replace

use ffitem, replace
$drop

xtmelogit trigger i.format || intw_id: || intnr:, or
est sto xt_format_all
est save xt_format_all_$date, replace
mat b = e(b)
lincom 2.format - 3.format



*********************************************************************
* format effect by section
* effect disappears in sections 2 and 3

* section 1
xtmelogit trigger i.format if section==1 || intw_id: || intnr:, or from(b, skip)
est sto xt_format_s1
est save xt_format_s1_$date, replace
lincom 2.format - 3.format

* section 2
xtmelogit trigger i.format if section==2 || intw_id: || intnr:, or from(b, skip)
est sto xt_format_s2
est save xt_format_s2_$date, replace
lincom 2.format - 3.format

* section 3
xtmelogit trigger i.format if section==3 || intw_id: || intnr:, or from(b, skip)
est sto xt_format_s3
est save xt_format_s3_$date, replace
lincom 2.format - 3.format

esttab xt*, stats(N) eform constant ///
	mtit(allsec sec1 sec2 sec3)


capture log close
	
exit
