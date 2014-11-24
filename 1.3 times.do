* calc response times

* entire time
egen t_all = rowtotal(td*) 
gen tm_all = t_all/60 
drop t_all
lab var tm_all "total time spent answering questions, in minutes"


* timings by section
forv i = 1/5 {
	egen t_fq`i' = rowtotal(td`i'*)
	gen tm_fq`i' = t_fq`i'/60
	lab var t_fq`i' "duration of section `i', in seconds"
	lab var tm_fq`i' "duration of section `i', in minutes"
}


* consent timings
egen t_consent = rowtotal(td021*) 
gen tm_consent = t_consent/60
lab var tm_consent "time of conent question, in minutes"
lab var t_consent "time of conent question, in seconds"

* filter section timings
forv s = 1/3 {
	egen t_filter`s' = rowtotal(td`s'*)
	gen tm_filter`s' = t_filter`s'/60
	drop t_filter`s'
	lab var tm_filter`s' "time in filter section `s', in minutes"
}
egen t_filter4 = rowtotal(td4* td5*)
gen tm_filter4 = t_filter4/60
drop t_filter4
lab var tm_filter4 "time in filter section 4, in minutes"

* total time in filter sections
gen tm_filter = tm_filter1 + tm_filter2 + tm_filter3 + tm_filter4



** total time from start to end
gen hb=floor(tb00100/10000)
gen mb=floor((tb00100-hb*10000)/100)
gen sb=tb00100-hb*10000-mb*100
gen he=floor(te99999/10000)
gen me=floor((te99999-he*10000)/100)
gen se=te99999-he*10000-me*100

gen tb = hb*60*60+mb*60+sb
gen te = he*60*60+me*60+se

gen total_time = (te-tb)/60
drop hb mb sb he me se
lab var total_time "total admin time"




***************************************************************
* filter timings by trigger answers

forv s = 1/4 {
	gen tm_trigger`s' = tm_filter`s'/trigger_filter`s'
	lab var tm_trigger`s' "duration per triggered filter in section `s', in minutes"
}
gen tm_trigger = tm_filter/trigger_all
lab var tm_trigger "duration per triggered filter across all sections, in minutes"


drop td* tb* te*
