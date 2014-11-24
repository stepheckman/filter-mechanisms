set more off


*******************************************************
* merge in data from call history

use $intw\callhist_final, replace

egen everrefused = max(refusal), by(intnr)

keep if disp1==1
keep intnr callspercase* callsperintw* time iab_id // avgwill everref

tempfile ch
save `ch'


*******************************************************
* prep currency data for merge
* separate delivery when currency not one offered in survey
* from Aleksa 3/11/2011

insheet using "\\N2030017\dfs\Ablagen\D01700-Projekte\D01700-Filterfragen\5_Data\maindata\data\currency_data.txt", clear

lab var frage "question number using irregular currency"
lab var currency "response to question using irregular currency"

save currency, replace


*******************************************************
* read in delivered SPSS file
* only need to do this once
*usespss using "$data\5305_IAB_Experiment_Filterführung_MAIN_Final_V01.sav", clear
*save ff_delivery

* this is spss file translated to stata format 28/10/2011 by SE
use ff_delivery, clear

* change var names to lower case
rename IntNr intnr
rename Variant variant
rename FYesNo fyesno
rename F1F2F3 f1f2f3
rename Filterformat filterformat
rename F1intra f1intra
rename F2intra f2intra
rename F3intra f3intra
rename F4intra f4intra
rename FRespOp frespop
rename FConsPo fconspo
rename PLZ plz
rename LAND land
rename BIK7 bik7
rename POL pol
rename BIK10 bik10
rename ETAG etag
rename EMON emon
rename EJAHR ejahr
rename PERSNR intw_id
rename teAusfall teausfall
rename STRATUM stratum
rename ORGID iab_id

lab def strat ///
	1 "ALG1" 2 "ALG2" 3 "employed"
lab val stratum strat

recode iab_id (-1=.)
gen miss_iabid = mi(iab_id)


* recode missing values
* note that this is done before variable combining below (in 1.1)
do "$code\1.0 recodes.do"


* make experimental condition flags
gen interleafed = 1 if filterformat==3 | filterformat==4
replace interleafed = 0 if filterformat==1 | filterformat==2
gen grouped = 1-interleafed

gen varied = 1 if filterformat==4
replace varied = 0 if filterformat!=4
gen monotonous = 1-varied

gen yestrigger = varied
gen notrigger = monotonous

* consent to record linkage
* collapse into one var
gen consent = v02101 if fconspo==1
replace consent = v02106 if fconspo == 2 | fconspo == 3
lab val consent v02101
recode consent (2=0) (7=0)


* agree to be contacted again
gen panel = 1 if v95100==1 | v95200==1
replace panel = 0 if v95100==0
replace panel = 0 if mi(panel) & !mi(v95100) & !mi(v95200)


* split the yyyy.mm string variables into 2 vars: yyyy and mm
* make new vars numeric
* drop old string var
foreach v in v21411b v22411b v23411b v24411b v25411b v26411b ///
	v21411e v22411e v23411e v24411e v25411e v26411e ///
	v21421b v22421b v23421b v24421b v25421b v26421b ///
	v21421e v22421e v23421e v24421e v25421e v26421e  {
	split `v', p(.)
	destring `v'1, replace
	destring `v'2, replace
	mvdecode `v'1 `v'2, mv(-3=.c \ -1=.a \ 88=.d \99=.e \8888=.d\9999=.d)
	drop `v'
}

do "$code\1.1 rename.do"

do "$code\1.2 drop variables.do"

do "$code\1.3 times.do"

sort intw_id


************************************
* number interviews from first to last within interviewer
rename iab_id iab_id_somemiss

capture drop _merge
merge 1:1 intnr using `ch'
assert _merge==3

bys intw_id (intw_dt time): gen intw_ct = _n

/* making sure we have IAB_ID for all cases, merged in from callhistory
gen idprob = (iab_id_somemiss != iab_id)
lab var iab_id_somemiss "IAB_ID delivered on response dataset, missing when consent refused"
tab idprob consent, mis nol
sum iab* if idprob
sum iab* if consent != 1
li iab* if idprob
yes, we have iab_id for nonconsenting cases from call history dataset
*/





/*******************************************************************
* these cases completed via 
* see email from Aleksa Dec 5, 2011

3007000
2613400
2939100
2941800
2618600
2740400  

FROM FINAL REPORT:

3.3. Poolaufbau
Im Pool für die telefonische Befragung wurde jeweils eine Nummer hinterlegt. Wenn mehre-re Telefonnummern zur Verfügung standen, wurde folgende Priorisierung für die Auswahl der Telefonnummer vorgenommen:
1) Telefonnummer, die von Prodata für die aktuellste Adresse gefunden wurde
2) Vorhandene Telefonnummer aus der Adressstichprobe des IAB
3) Telefonnummer, die von Prodata für die zweite Adresse gefunden wurde (wenn keine Telefonnummer zur aktuellsten Adressen vorhanden/ ermittelbar war)*/

gen phone_source = 12
replace phone_source = 3 if inlist(intnr, 3007000, 2613400, 2939100, 2941800, 2618600, 2740400)

* Prodata is LINK's telephone number research vendor
lab def phone 12 "Telefonnummer Prodata ODER Nummer aus der stichprobe" 3 "Prodata für die zweite Adresse gefunden wurde"
lab val phone_source phone

/*******************************************************************/

* calc big 5 personality traits
do "$code\1.4 big5.do"


* read in frame data for completed cases from brutto sample file
preserve
	use "$samp\delivery", replace

	keep CASE_ID birthdate gender replicate NO_ADR PHONE_RESEARCH
	rename CASE_ID iab_id
	rename NO_ADR no_adr 
	rename PHONE_RESEARCH phone_research

	lab var iab_id ""
	lab var birthdate "R birthdate from ITM sample file"
	lab var gender "R gender from ITM sample file"
	lab var replicate "replicate assigned by IAB"
	lab var phone_research "case flagged for research before delivery to LINK"
	lab var no_adr "case had no address at time of delivery to LINK"

	tempfile brutto
	save `brutto'
restore

capture drop _merge
merge 1:1 iab_id using `brutto'
keep if _merge==3
capture drop _merge
drop no_adr

gen age = (intw_dt - birthdate)/365
lab var age "Age of R in years as on interview, calc from frame data"



lab var intw_ct "Running count of number of intws completed by intwer"
lab var interleafed "Case in interleafed condition"
lab var grouped "Case in grouped condition"
lab var varied "Case in varied condition"
lab var monotonous "Case in monotonous condition"
lab var consent "Consented to record linkage"
lab var panel "Consented to be contacted again"
lab var yestrig "Case received yes-triggered FUs in section 4"
lab var notrig "Case received no-triggered FUs in section 4"
lab var intw_dt "Date of interview"


lab var phone_source "source of phone number where completed"
lab var v90100 "Personen in Haushalt"
lab var v90200 "Familienstand"
lab var v90300 "Höchster Schulabschluss"
lab var v90400 "Geburtsort der Eltern/Großeltern außerhalb von Deutschland"
lab var v90600 "Erwerbstatus"
lab var v90700 "Arbeitszeit inklusive Überstunden"
lab var v90801 "Letztes monatliches Arbeitseinkommen (brutto)"
lab var v95100 "Zukünftige Untersuchungen zu diesem Thema"
lab var v95200 "Erneute Meldung"
lab var v97100 "Intw Frage: Einstufung der Deutschkenntnisse"
lab var v97200 "Intw Frage: Interesse des Befragten an der Studie"
lab var v97230 "Intw Frage: Bereitschaft des Befragten Fragen zu beantworten"
lab var v97300 "Intw Frage: Muster in den Filterfragen"


capture drop _merge callsper*will v10001 v10002 v40001 v40002 iab_id_somemiss miss_iabid

compress
save ffcase, replace

capture log close
set more off
use ffcase, replace
log using "$results\codebook_$date.smcl", replace
codebook, prob
codebook
capture log close

* don't need this right now, just checking that merge works!
capture drop _merge
merge 1:m intnr using currency


* filter question level dataset
qui do "$code\1.5 filter level.do"

*do "$code\1.5 address dataset.do"

*do "$code\1.6 incomplete cases.do"



exit






capture log close
set more off
log using "$results\describe.smcl", replace
d
log close

capture log close
set more off
log using "$results\codebook.smcl", replace
codebook
log close
