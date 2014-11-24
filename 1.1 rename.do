set more off 

label define months 21 "Winter" 24 "Frühjahr" 27 "Sommer" 30 "Herbst" $misslabs ///
	1 "January" 2 "February" 3 "March" 4 "April" 5 "May" 6 "June" ///
	7 "July" 8 "August" 9 "September" 10 "October" 11 "November" 12 "December" ///
	32 "Jahresende"

rename v11000 filter1_1
label variable filter1_1 "filter 1, question 1"

rename h11000 filter1_1_hist 
lab var filter1_1_hist "filter 1, question 1 -- historical value"
 
rename v11100 fu1_1_1 
label variable fu1_1_1 "filter 1, question 1, varied fu 1" 

rename v11200 fu1_1_2
label variable fu1_1_2 "filter 1, question 1, varied fu 2"

rename v11300 fu1_1_3
label variable fu1_1_3 "filter 1, question 1, varied fu 3"

gen fu1_1_4 = v11410 if grouped
replace fu1_1_4 = v11420 if interleafed
lab copy v11410 fu1_1_4, replace
lab val fu1_1_4 fu1_1_4 
label variable fu1_1_4 "filter 1, question 1, Monotonous fu"

rename v11500 fu1_1_5
label variable fu1_1_5 "filter 1, question 1, Monotonous fu 2"

rename v11601 fu1_1_7
label variable fu1_1_7 "filter 1, question 1, Constant fu"

rename v11700 fu1_1_6
label variable fu1_1_6 "filter 1, question 1, Monotonous fu 3"

// Filter 1, Question 2

rename v12000 filter1_2
label variable filter1_2 "filter 1, question 2"

rename h12000 filter1_2_hist 
lab var filter1_2_hist "filter 1, question 2 -- historical value"
 
rename v12100 fu1_2_1 
label variable fu1_2_1 "filter 1, question 2, varied fu 1" 

rename v12200 fu1_2_2
label variable fu1_2_2 "filter 1, question 2, varied fu 2"

rename v12300 fu1_2_3
label variable fu1_2_3 "filter 1, question 2, varied fu 3"

gen fu1_2_4 = v12410 if grouped
replace fu1_2_4 = v12420 if interleafed
lab copy v12410 fu1_2_4, replace
lab val fu1_2_4 fu1_2_4 
label variable fu1_2_4 "filter 1, question 2, Monotonous fu"

rename v12500 fu1_2_5
label variable fu1_2_5 "filter 1, question 2, Monotonous fu 2"

rename v12601 fu1_2_7
label variable fu1_2_7 "filter 1, question 2, Constant fu"

rename v12700 fu1_2_6
label variable fu1_2_6 "filter 1, question 2, Monotonous fu 3"

// Filter 1, Question 3

rename v13000 filter1_3
label variable filter1_3 "filter 1, question 3"

rename h13000 filter1_3_hist 
lab var filter1_3_hist "filter 1, question 3 -- historical value"
 
rename v13100 fu1_3_1 
label variable fu1_3_1 "filter 1, question 3, varied fu 1" 

rename v13200 fu1_3_2
label variable fu1_3_2 "filter 1, question 3, varied fu 2"

rename v13300 fu1_3_3
label variable fu1_3_3 "filter 1, question 3, varied fu 3"

gen fu1_3_4 = v13410 if grouped
replace fu1_3_4 = v13420 if interleafed
lab copy v13410 fu1_3_4, replace
lab val fu1_3_4 fu1_3_4 
label variable fu1_3_4 "filter 1, question 3, Monotonous fu"

rename v13500 fu1_3_5
label variable fu1_3_5 "filter 1, question 3, Monotonous fu 2"

rename v13601 fu1_3_7
label variable fu1_3_7 "filter 1, question 3, Constant fu"

rename v13700 fu1_3_6
label variable fu1_3_6 "filter 1, question 3, Monotonous fu 3"

// Filter 1, Question 4

rename v14000 filter1_4
label variable filter1_4 "filter 1, question 4"

rename h14000 filter1_4_hist 
lab var filter1_4_hist "filter 1, question 4 -- historical value"
 
rename v14100 fu1_4_1 
label variable fu1_4_1 "filter 1, question 4, varied fu 1" 

rename v14200 fu1_4_2
label variable fu1_4_2 "filter 1, question 4, varied fu 2"

rename v14300 fu1_4_3
label variable fu1_4_3 "filter 1, question 4, varied fu 3"

gen fu1_4_4 = v14410 if grouped
replace fu1_4_4 = v14420 if interleafed
lab copy v14410 fu1_4_4, replace
lab val fu1_4_4 fu1_4_4 
label variable fu1_4_4 "filter 1, question 4, Monotonous fu"

rename v14500 fu1_4_5
label variable fu1_4_5 "filter 1, question 4, Monotonous fu 2"

rename v14601 fu1_4_7
label variable fu1_4_7 "filter 1, question 4, Constant fu"

rename v14700 fu1_4_6
label variable fu1_4_6 "filter 1, question 4, Monotonous fu 3"

// Filter 1, Question 5

rename v15000 filter1_5
label variable filter1_5 "filter 1, question 5"

rename h15000 filter1_5_hist 
lab var filter1_5_hist "filter 1, question 5 -- historical value"
 
rename v15100 fu1_5_1 
label variable fu1_5_1 "filter 1, question 5, varied fu 1" 

rename v15200 fu1_5_2
label variable fu1_5_2 "filter 1, question 5, varied fu 2"

rename v15300 fu1_5_3
label variable fu1_5_3 "filter 1, question 5, varied fu 3"

gen fu1_5_4 = v15410 if grouped
replace fu1_5_4 = v15420 if interleafed
lab copy v15410 fu1_5_4, replace
lab val fu1_5_4 fu1_5_4 
label variable fu1_5_4 "filter 1, question 5, Monotonous fu"

rename v15500 fu1_5_5
label variable fu1_5_5 "filter 1, question 5, Monotonous fu 2"

rename v15601 fu1_5_7
label variable fu1_5_7 "filter 1, question 5, Constant fu"

rename v15700 fu1_5_6
label variable fu1_5_6 "filter 1, question 5, Monotonous fu 3"

// Filter 1, Question 6

rename v16000 filter1_6
label variable filter1_6 "filter 1, question 6"

rename h16000 filter1_6_hist 
lab var filter1_6_hist "filter 1, question 6 -- historical value"
 
rename v16100 fu1_6_1 
label variable fu1_6_1 "filter 1, question 6, varied fu 1" 

rename v16200 fu1_6_2
label variable fu1_6_2 "filter 1, question 6, varied fu 2"

rename v16300 fu1_6_3
label variable fu1_6_3 "filter 1, question 6, varied fu 3"

gen fu1_6_4 = v16410 if grouped
replace fu1_6_4 = v16420 if interleafed
lab copy v16410 fu1_6_4, replace
lab val fu1_6_4 fu1_6_4 
label variable fu1_6_4 "filter 1, question 6, Monotonous fu"

rename v16500 fu1_6_5
label variable fu1_6_5 "filter 1, question 6, Monotonous fu 2"

rename v16601 fu1_6_7
label variable fu1_6_7 "filter 1, question 6, Constant fu"

rename v16700 fu1_6_6
label variable fu1_6_6 "filter 1, question 6, Monotonous fu 3"

// Filter 2, Question 1

rename v21000 filter2_1
label variable filter2_1 "filter 2, question 1"

rename h21000 filter2_1_hist 
lab var filter2_1_hist "filter 2, question 1 -- historical value" 
 
rename v21100 fu2_1_1 
label variable fu2_1_1 "filter 2, question 1, varied fu 1" 

rename v21200 fu2_1_2
label variable fu2_1_2 "filter 2, question 1, varied fu 2"

rename v21300 fu2_1_3
label variable fu2_1_3 "filter 2, question 1, varied fu 3"

gen fu2_1_4yb1 = v21411b1 if grouped
replace fu2_1_4yb1 = v21421b1 if interleafed
gen fu2_1_4yb2 = v21416b if grouped  
replace fu2_1_4yb2 = v21426b if interleafed
gen fu2_1_4yb = fu2_1_4yb1
replace fu2_1_4yb = fu2_1_4yb2 if fu2_1_4yb2 > 1000 & fu2_1_4yb2 < 10000  
label variable fu2_1_4yb "filter 2, question 1, Monotonous fu (begin, year)"

gen fu2_1_4ye = v21411e1 if grouped
replace fu2_1_4ye = v21421e1 if interleafed
label variable fu2_1_4ye "filter 2, question 1, Monotonous fu (end, year)"

/*replace v21411b2 = v21411b1 if mi(v21411b2)
replace v21421b2 = v21421b1 if mi(v21421b2)
replace v21411e2 = v21411e1 if mi(v21411e2)
replace v21421e2 = v21421e1 if mi(v21421e2)
*/

gen fu2_1_4mb = v21411b2 if grouped
replace fu2_1_4mb = v21421b2 if interleafed
label variable fu2_1_4mb "filter 2, question 1, Monotonous fu (begin, month)"

gen fu2_1_4me = v21411e2 if grouped
replace fu2_1_4me = v21421e2 if interleafed
label variable fu2_1_4me "filter 2, question 1, Monotonous fu (end, month)"

gen fu2_1_4d = v21416d if grouped
replace fu2_1_4d = v21426d if interleafed
label variable fu2_1_4d "filter 2, question 1, Monotonous fu (duration)"

rename v21500 fu2_1_5
label variable fu2_1_5 "filter 2, question 1, Monotonous fu 2"

rename v21601 fu2_1_7a
label variable fu2_1_7a "filter 2, question 1, Constant fu option1"

rename v21606 fu2_1_7b
label variable fu2_1_7b "filter 2, question 1, Constant fu option2"

rename v21700 fu2_1_6
label variable fu2_1_6 "filter 2, question 1, Monotonous fu 3"

// Filter 2, Question 2

rename v22000 filter2_2
label variable filter2_2 "filter 2, question 2"

rename h22000 filter2_2_hist 
lab var filter2_2_hist "filter 2, question 2 -- historical value" 
 
rename v22100 fu2_2_1 
label variable fu2_2_1 "filter 2, question 2, varied fu 1" 

rename v22200 fu2_2_2
label variable fu2_2_2 "filter 2, question 2, varied fu 2"

rename v22300 fu2_2_3
label variable fu2_2_3 "filter 2, question 2, varied fu 3"

gen fu2_2_4yb1 = v22411b1 if grouped
replace fu2_2_4yb1 = v22421b1 if interleafed
gen fu2_2_4yb2 = v22416b if grouped  
replace fu2_2_4yb2 = v22426b if interleafed 
gen fu2_2_4yb = fu2_2_4yb1
replace fu2_2_4yb = fu2_2_4yb2 if fu2_2_4yb2 > 1000 & fu2_2_4yb2 < 10000 
label variable fu2_2_4yb "filter 2, question 2, Monotonous fu (begin, year)"

gen fu2_2_4ye = v22411e1 if grouped
replace fu2_2_4ye = v22421e1 if interleafed
label variable fu2_2_4ye "filter 2, question 2, Monotonous fu (end, year)"

/*replace v22411b2 = v22411b1 if v22411b2 == .
replace v22421b2 = v22421b1 if v22421b2 == .
replace v22411e2 = v22411e1 if v22411e2 == .
replace v22421e2 = v22421e1 if v22421e2 == .
*/

gen fu2_2_4mb = v22411b2 if grouped
replace fu2_2_4mb = v22421b2 if interleafed
label variable fu2_2_4mb "filter 2, question 2, Monotonous fu (begin, month)"

gen fu2_2_4me = v22411e2 if grouped
replace fu2_2_4me = v22421e2 if interleafed
label variable fu2_2_4me "filter 2, question 2, Monotonous fu (end, month)"

gen fu2_2_4d = v22416d if grouped
replace fu2_2_4d = v22426d if interleafed
label variable fu2_2_4d "filter 2, question 2, Monotonous fu (duration)"

rename v22500 fu2_2_5
label variable fu2_2_5 "filter 2, question 2, Monotonous fu 2"

rename v22601 fu2_2_7a
label variable fu2_2_7a "filter 2, question 2, Constant fu option1"

rename v22606 fu2_2_7b
label variable fu2_2_7b "filter 2, question 2, Constant fu option2"

rename v22700 fu2_2_6
label variable fu2_2_6 "filter 2, question 2, Monotonous fu 3"

// Filter 2, Question 3

rename v23000 filter2_3
label variable filter2_3 "filter 2, question 3"

rename h23000 filter2_3_hist 
lab var filter2_3_hist "filter 2, question 3 -- historical value" 
 
rename v23100 fu2_3_1 
label variable fu2_3_1 "filter 2, question 3, varied fu 1" 

rename v23200 fu2_3_2
label variable fu2_3_2 "filter 2, question 3, varied fu 2"

rename v23300 fu2_3_3
label variable fu2_3_3 "filter 2, question 3, varied fu 3"

gen fu2_3_4yb1 = v23411b1 if grouped
replace fu2_3_4yb1 = v23421b1 if interleafed
gen fu2_3_4yb2 = v23416b if grouped  
replace fu2_3_4yb2 = v23426b if interleafed 
gen fu2_3_4yb = fu2_3_4yb1
replace fu2_3_4yb = fu2_3_4yb2 if fu2_3_4yb2 > 1000 & fu2_3_4yb2 < 10000 
label variable fu2_3_4yb "filter 2, question 3, Monotonous fu (begin, year)"

gen fu2_3_4ye = v23411e1 if grouped
replace fu2_3_4ye = v23421e1 if interleafed
label variable fu2_3_4ye "filter 2, question 3, Monotonous fu (end, year)"

/*replace v23411b2 = v23411b1 if v23411b2 == .
replace v23421b2 = v23421b1 if v23421b2 == .
replace v23411e2 = v23411e1 if v23411e2 == .
replace v23421e2 = v23421e1 if v23421e2 == .
*/

gen fu2_3_4mb = v23411b2 if grouped
replace fu2_3_4mb = v23421b2 if interleafed
label variable fu2_3_4mb "filter 2, question 3, Monotonous fu (begin, month)"

gen fu2_3_4me = v23411e2 if grouped
replace fu2_3_4me = v23421e2 if interleafed
label variable fu2_3_4me "filter 2, question 3, Monotonous fu (end, month)"

gen fu2_3_4d = v23416d if grouped
replace fu2_3_4d = v23426d if interleafed
label variable fu2_3_4d "filter 2, question 3, Monotonous fu (duration)"

rename v23500 fu2_3_5
label variable fu2_3_5 "filter 2, question 3, Monotonous fu 2"

rename v23601 fu2_3_7a
label variable fu2_3_7a "filter 2, question 3, Constant fu option1"

rename v23606 fu2_3_7b
label variable fu2_3_7b "filter 2, question 3, Constant fu option2"

rename v23700 fu2_3_6
label variable fu2_3_6 "filter 2, question 3, Monotonous fu 3"

// Filter 2, Question 4

rename v24000 filter2_4
label variable filter2_4 "filter 2, question 4"

rename h24000 filter2_4_hist 
lab var filter2_4_hist "filter 2, question 4 -- historical value" 
 
rename v24100 fu2_4_1 
label variable fu2_4_1 "filter 2, question 4, varied fu 1" 

rename v24200 fu2_4_2
label variable fu2_4_2 "filter 2, question 4, varied fu 2"

rename v24300 fu2_4_3
label variable fu2_4_3 "filter 2, question 4, varied fu 3"

gen fu2_4_4yb1 = v24411b1 if grouped
replace fu2_4_4yb1 = v24421b1 if interleafed
gen fu2_4_4yb2 = v24416b if grouped  
replace fu2_4_4yb2 = v24426b if interleafed 
gen fu2_4_4yb = fu2_4_4yb1
replace fu2_4_4yb = fu2_4_4yb2 if fu2_4_4yb2 > 1000 & fu2_4_4yb2 < 10000 
label variable fu2_4_4yb "filter 2, question 4, Monotonous fu (begin, year)"

gen fu2_4_4ye = v24411e1 if grouped
replace fu2_4_4ye = v24421e1 if interleafed
label variable fu2_4_4ye "filter 2, question 4, Monotonous fu (end, year)"

/*replace v24411b2 = v24411b1 if v24411b2 == .
replace v24421b2 = v24421b1 if v24421b2 == .
replace v24411e2 = v24411e1 if v24411e2 == .
replace v24421e2 = v24421e1 if v24421e2 == .
*/

gen fu2_4_4mb = v24411b2 if grouped
replace fu2_4_4mb = v24421b2 if interleafed
label variable fu2_4_4mb "filter 2, question 4, Monotonous fu (begin, month)"

gen fu2_4_4me = v24411e2 if grouped
replace fu2_4_4me = v24421e2 if interleafed
label variable fu2_4_4me "filter 2, question 4, Monotonous fu (end, month)"

gen fu2_4_4d = v24416d if grouped
replace fu2_4_4d = v24426d if interleafed
lab copy v24416d fu2_4_4d, replace
lab val fu2_4_4d fu2_4_4d
label variable fu2_4_4d "filter 2, question 4, Monotonous fu (duration)"

rename v24500 fu2_4_5
label variable fu2_4_5 "filter 2, question 4, Monotonous fu 2"

rename v24601 fu2_4_7a
label variable fu2_4_7a "filter 2, question 4, Constant fu option1"

rename v24606 fu2_4_7b
label variable fu2_4_7b "filter 2, question 4, Constant fu option2"

rename v24700 fu2_4_6
label variable fu2_4_6 "filter 2, question 4, Monotonous fu 3"

// Filter 2, Question 5

rename v25000 filter2_5
label variable filter2_5 "filter 2, question 5"

rename h25000 filter2_5_hist 
lab var filter2_5_hist "filter 2, question 5 -- historical value" 
 
rename v25100 fu2_5_1 
label variable fu2_5_1 "filter 2, question 5, varied fu 1" 

rename v25200 fu2_5_2
label variable fu2_5_2 "filter 2, question 5, varied fu 2"

rename v25300 fu2_5_3
label variable fu2_5_3 "filter 2, question 5, varied fu 3"

gen fu2_5_4yb1 = v25411b1 if grouped
replace fu2_5_4yb1 = v25421b1 if interleafed
gen fu2_5_4yb2 = v25416b if grouped  
replace fu2_5_4yb2 = v25426b if interleafed 
gen fu2_5_4yb = fu2_5_4yb1
replace fu2_5_4yb = fu2_5_4yb2 if fu2_5_4yb2 > 1000 & fu2_5_4yb2 < 10000 
label variable fu2_5_4yb "filter 2, question 5, Monotonous fu (begin, year)"

gen fu2_5_4ye = v25411e1 if grouped
replace fu2_5_4ye = v25421e1 if interleafed
label variable fu2_5_4ye "filter 2, question 5, Monotonous fu (end, year)"

/*replace v25411b2 = v25411b1 if v25411b2 == .
replace v25421b2 = v25421b1 if v25421b2 == .
replace v25411e2 = v25411e1 if v25411e2 == .
replace v25421e2 = v25421e1 if v25421e2 == .
*/

gen fu2_5_4mb = v25411b2 if grouped
replace fu2_5_4mb = v25421b2 if interleafed
label variable fu2_5_4mb "filter 2, question 5, Monotonous fu (begin, month)"

gen fu2_5_4me = v25411e2 if grouped
replace fu2_5_4me = v25421e2 if interleafed
label variable fu2_5_4me "filter 2, question 5, Monotonous fu (end, month)"

gen fu2_5_4d = v25416d if grouped
replace fu2_5_4d = v25426d if interleafed
label variable fu2_5_4d "filter 2, question 5, Monotonous fu (duration)"

rename v25500 fu2_5_5
label variable fu2_5_5 "filter 2, question 5, Monotonous fu 2"

rename v25601 fu2_5_7a
label variable fu2_5_7a "filter 2, question 5, Constant fu option1"

rename v25606 fu2_5_7b
label variable fu2_5_7b "filter 2, question 5, Constant fu option2"

rename v25700 fu2_5_6
label variable fu2_5_6 "filter 2, question 5, Monotonous fu 3"

// Filter 2, Question 6

rename v26000 filter2_6
label variable filter2_6 "filter 2, question 6"

rename h26000 filter2_6_hist 
lab var filter2_6_hist "filter 2, question 6 -- historical value" 
 
rename v26100 fu2_6_1 
label variable fu2_6_1 "filter 2, question 6, varied fu 1" 

rename v26200 fu2_6_2
label variable fu2_6_2 "filter 2, question 6, varied fu 2"

rename v26300 fu2_6_3
label variable fu2_6_3 "filter 2, question 6, varied fu 3"

gen fu2_6_4yb1 = v26411b1 if grouped
replace fu2_6_4yb1 = v26421b1 if interleafed
gen fu2_6_4yb2 = v26416b if grouped  
replace fu2_6_4yb2 = v26426b if interleafed 
gen fu2_6_4yb = fu2_6_4yb1
replace fu2_6_4yb = fu2_6_4yb2 if fu2_6_4yb2 > 1000 & fu2_6_4yb2 < 10000 
label variable fu2_6_4yb "filter 2, question 6, Monotonous fu (begin, year)"

gen fu2_6_4ye = v26411e1 if grouped
replace fu2_6_4ye = v26421e1 if interleafed
label variable fu2_6_4ye "filter 2, question 6, Monotonous fu (end, year)"

/*replace v26411b2 = v26411b1 if v26411b2 == .
replace v26421b2 = v26421b1 if v26421b2 == .
replace v26411e2 = v26411e1 if v26411e2 == .
replace v26421e2 = v26421e1 if v26421e2 == .
*/

gen fu2_6_4mb = v26411b2 if grouped
replace fu2_6_4mb = v26421b2 if interleafed
label variable fu2_6_4mb "filter 2, question 6, Monotonous fu (begin, month)"

gen fu2_6_4me = v26411e2 if grouped
replace fu2_6_4me = v26421e2 if interleafed
label variable fu2_6_4me "filter 2, question 6, Monotonous fu (end, month)"

gen fu2_6_4d = v26416d if grouped
replace fu2_6_4d = v26426d if interleafed
label variable fu2_6_4d "filter 2, question 6, Monotonous fu (duration)"

rename v26500 fu2_6_5
label variable fu2_6_5 "filter 2, question 6, Monotonous fu 2"

rename v26601 fu2_6_7a
label variable fu2_6_7a "filter 2, question 6, Constant fu option1"

rename v26606 fu2_6_7b
label variable fu2_6_7b "filter 2, question 6, Constant fu option2"

rename v26700 fu2_6_6
label variable fu2_6_6 "filter 2, question 6, Monotonous fu 3"


// Filter 3, Question 1

gen filter3_1 = v31001 if f3intra==1
replace filter3_1 = v31002 if f3intra==2
lab copy v31001 filter3_1, replace
lab val filter3_1 filter3_1
label variable filter3_1 "filter 3, question 1"

gen filter3_1_hist = 0
replace filter3_1_hist = h31001 if h31001 == -1 | h31001>0
replace filter3_1_hist = h31002 if h31002 == -1 | h31002>0
lab copy v31001 filter3_1_hist, replace
lab val filter3_1_hist filter3_1_hist
lab var filter3_1_hist "filter 3, question 1-- historical value"

rename v31100 fu3_1_1
label variable fu3_1_1 "filter 3, question 1, varied fu 1" 

rename v31200 fu3_1_2
label variable fu3_1_2 "filter 3, question 1, varied fu 2" 

rename v31300 fu3_1_3
label variable fu3_1_3 "filter 3, question 1, varied fu 3"

* this FU question differnt for interleafed and grouped formats
* two ersion stored in two diff variables
* collapse for analysis
* just do all 6 filters here, it's easier
forv q = 1/6 {
	gen fu3_`q'_4 = v3`q'410 if grouped 
	replace fu3_`q'_4 = v3`q'420 if interleafed
	lab copy v3`q'410 fu3_`q'_4, replace
	lab val fu3_`q'_4 fu3_`q'_4
	label variable fu3_`q'_4 "filter 3, question `q', monotonous fu 1"
}

rename v31500 fu3_1_5
label variable fu3_1_5 "filter 3, question 1, monotonous fu 2"

rename v31601 fu3_1_6a
label variable fu3_1_6a "filter 3, question 1, monotonous fu 3 option1"

rename v31606 fu3_1_6b
label variable fu3_1_6b "filter 3, question 1, monotonous fu 3 option2"

rename v31701 fu3_1_7
label variable fu3_1_7 "filter 3, question 1, constant fu"

// Filter 3, Question 2

rename v32000 filter3_2
label variable filter3_2 "filter 3, question 2"

rename h32000 filter3_2_hist 
lab var filter3_2_hist "filter 3, question 2 -- historical value" 

rename v32100 fu3_2_1
label variable fu3_2_1 "filter 3, question 2, varied fu 1" 

rename v32200 fu3_2_2
label variable fu3_2_2 "filter 3, question 2, varied fu 2" 

rename v32300 fu3_2_3
label variable fu3_2_3 "filter 3, question 2, varied fu 3"

rename v32500 fu3_2_5
label variable fu3_2_5 "filter 3, question 2, monotonous fu 2"

rename v32601 fu3_2_6a
label variable fu3_2_6a "filter 3, question 2, monotonous fu 3 option1"

rename v32606 fu3_2_6b
label variable fu3_2_6b "filter 3, question 2, monotonous fu 3 option2"

rename v32701 fu3_2_7
label variable fu3_2_7 "filter 3, question 2, constant fu"

// Filter 3, Question 3

rename v33000 filter3_3
label variable filter3_3 "filter 3, question 3"

rename h33000 filter3_3_hist 
lab var filter3_3_hist "filter 3, question 3 -- historical value" 

rename v33100 fu3_3_1
label variable fu3_3_1 "filter 3, question 3, varied fu 1" 

rename v33200 fu3_3_2
label variable fu3_3_2 "filter 3, question 3, varied fu 2" 

rename v33300 fu3_3_3
label variable fu3_3_3 "filter 3, question 3, varied fu 3"

rename v33500 fu3_3_5
label variable fu3_3_5 "filter 3, question 3, monotonous fu 2"

rename v33601 fu3_3_6a
label variable fu3_3_6a "filter 3, question 3, monotonous fu 3 option1"

rename v33606 fu3_3_6b
label variable fu3_3_6b "filter 3, question 3, monotonous fu 3 option2"

rename v33701 fu3_3_7
label variable fu3_3_7 "filter 3, question 3, constant fu"

// Filter 3, Question 4

rename v34000 filter3_4
label variable filter3_4 "filter 3, question 4"

rename h34000 filter3_4_hist 
lab var filter3_4_hist "filter 3, question 4 -- historical value" 

rename v34100 fu3_4_1
label variable fu3_4_1 "filter 3, question 4, varied fu 1" 

rename v34200 fu3_4_2
label variable fu3_4_2 "filter 3, question 4, varied fu 2" 

rename v34300 fu3_4_3
label variable fu3_4_3 "filter 3, question 4, varied fu 3"

rename v34500 fu3_4_5
label variable fu3_4_5 "filter 3, question 4, monotonous fu 2"

rename v34601 fu3_4_6a
label variable fu3_4_6a "filter 3, question 4, monotonous fu 3 option1"

rename v34606 fu3_4_6b
label variable fu3_4_6b "filter 3, question 4, monotonous fu 3 option2"

rename v34701 fu3_4_7
label variable fu3_4_7 "filter 3, question 4, constant fu"

// Filter 3, Question 5

rename v35000 filter3_5
label variable filter3_5 "filter 3, question 5"

rename h35000 filter3_5_hist 
lab var filter3_5_hist "filter 3, question 5 -- historical value" 

rename v35100 fu3_5_1
label variable fu3_5_1 "filter 3, question 5, varied fu 1" 

rename v35200 fu3_5_2
label variable fu3_5_2 "filter 3, question 5, varied fu 2" 

rename v35300 fu3_5_3
label variable fu3_5_3 "filter 3, question 5, varied fu 3"

rename v35500 fu3_5_5
label variable fu3_5_5 "filter 3, question 5, monotonous fu 2"

rename v35601 fu3_5_6a
label variable fu3_5_6a "filter 3, question 5, monotonous fu 3 option1"

rename v35606 fu3_5_6b
label variable fu3_5_6b "filter 3, question 5, monotonous fu 3 option2"

rename v35701 fu3_5_7
label variable fu3_5_7 "filter 3, question 5, constant fu"

// Filter 3, Question 6
gen filter3_6 = v36001 if f3intra==1
replace filter3_6 = v36002 if f3intra==2
lab copy v36001 filter3_6, replace
lab val filter3_6 filter3_6
label variable filter3_6 "filter 3, question 6"

gen filter3_6_hist = 0
replace filter3_6_hist = h36001 if h36001 == -1 | h36001>0
replace filter3_6_hist = h36002 if h36002 == -1 | h36002>0
lab copy v36001 filter3_6_hist, replace
lab val filter3_6_hist filter3_6_hist
lab var filter3_6_hist "filter 3, question 6 -- historical value"

rename v36100 fu3_6_1
label variable fu3_6_1 "filter 3, question 6, varied fu 1" 

rename v36200 fu3_6_2
label variable fu3_6_2 "filter 3, question 6, varied fu 2" 

rename v36300 fu3_6_3
label variable fu3_6_3 "filter 3, question 6, varied fu 3"

rename v36500 fu3_6_5
label variable fu3_6_5 "filter 3, question 6, monotonous fu 2"

rename v36601 fu3_6_6a
label variable fu3_6_6a "filter 3, question 6, monotonous fu 3 option1"

rename v36606 fu3_6_6b
label variable fu3_6_6b "filter 3, question 6, monotonous fu 3 option2"

rename v36701 fu3_6_7
label variable fu3_6_7 "filter 3, question 6, constant fu"

// Filter 4, Question 1

rename v41000 filter4_1
label variable filter4_1 "filter 4, question 1"

rename h41000 filter4_1_hist 
lab var filter4_1_hist "filter 4, question 1 -- historical value" 

gen fu4_1_no = v41410 if grouped
replace fu4_1_no = v41420 if interleafed
lab copy v41410 fu4_1_no, replace
lab val fu4_1_no fu4_1_no 
label variable fu4_1_no "filter 4, question 1, No fu"

rename v41900 fu4_1_yes
label variable fu4_1_yes "filter 4, question 1, Yes fu"
 
// Filter 4, Question 2

rename v42000 filter4_2
label variable filter4_2 "filter 4, question 2"

rename h42000 filter4_2_hist 
lab var filter4_2_hist "filter 4, question 2 -- historical value" 

gen fu4_2_no = v42410 if grouped
replace fu4_2_no = v42420 if interleafed
lab copy v42410 fu4_2_no, replace
lab val fu4_2_no fu4_2_no 
label variable fu4_2_no "filter 4, question 2, No fu"

rename v42900 fu4_2_yes
label variable fu4_2_yes "filter 4, question 2, Yes fu"

// Filter 4, Question 3

rename v43000 filter4_3
label variable filter4_3 "filter 4, question 3"

rename h43000 filter4_3_hist 
lab var filter4_3_hist "filter 4, question 3 -- historical value" 

gen fu4_3_no = v43410 if grouped
replace fu4_3_no = v43420 if interleafed
lab copy v43410 fu4_3_no, replace
lab val fu4_3_no fu4_3_no 
label variable fu4_3_no "filter 4, question 3, No fu"

rename v43900 fu4_3_yes
label variable fu4_3_yes "filter 4, question 3, Yes fu"

// Filter 4, Question 4

rename v44000 filter4_4
label variable filter4_4 "filter 4, question 4"

rename h44000 filter4_4_hist 
lab var filter4_4_hist "filter 4, question 4 -- historical value" 

gen fu4_4_no = v44410 if grouped
replace fu4_4_no = v44420 if interleafed
lab copy v44410 fu4_4_no, replace
lab val fu4_4_no fu4_4_no 
label variable fu4_4_no "filter 4, question 4, No fu"

rename v44900 fu4_4_yes
label variable fu4_4_yes "filter 4, question 4, Yes fu"

// Filter 4, Question 5

rename v46000 filter4_5
label variable filter4_5 "filter 4, question 5"

rename h46000 filter4_5_hist 
lab var filter4_5_hist "filter 4, question 5 -- historical value" 

gen fu4_5_no = v46410 if grouped
replace fu4_5_no = v46420 if interleafed
lab copy v46410 fu4_5_no, replace
lab val fu4_5_no fu4_5_no 
label variable fu4_5_no "filter 4, question 5, No fu"

rename v46900 fu4_5_yes
label variable fu4_5_yes "filter 4, question 5, Yes fu"

// Filter 4, Question 6

rename v47000 filter4_6
label variable filter4_6 "filter 4, question 6"

rename h47000 filter4_6_hist 
lab var filter4_6_hist "filter 4, question 7 -- historical value" 

gen fu4_6_no = v47410 if grouped
replace fu4_6_no = v47420 if interleafed
lab copy v47410 fu4_6_no, replace
lab val fu4_6_no fu4_6_no 
label variable fu4_6_no "filter 4, question 6, No fu"

rename v47900 fu4_6_yes
label variable fu4_6_yes "filter 4, question 6, Yes fu"

// Filter 4, Question 7

rename v53000 filter4_7
label variable filter4_7 "filter 4, question 7"

rename h53000 filter4_7_hist 
lab var filter4_7_hist "filter 4, question 7 -- historical value" 

gen fu4_7_no = v53810 if grouped
replace fu4_7_no = v53820 if interleafed
lab copy v53810 fu4_7_no, replace
lab val fu4_7_no fu4_7_no 
label variable fu4_7_no "filter 4, question 7, No fu"

rename v53900 fu4_7_yes
label variable fu4_7_yes "filter 4, question 7, Yes fu"

// Filter 4, Question 8

rename v54000 filter4_8
label variable filter4_8 "filter 4, question 8"

rename h54000 filter4_8_hist 
lab var filter4_8_hist "filter 4, question 8 -- historical value" 

gen fu4_8_no = v54810 if grouped
replace fu4_8_no = v54820 if interleafed
lab copy v54810 fu4_8_no, replace
lab val fu4_8_no fu4_8_no 
label variable fu4_8_no "filter 4, question 8, No fu"

rename v54900 fu4_8_yes
label variable fu4_8_yes "filter 4, question 8, Yes fu"

// Filter 4, Question 9

rename v55000 filter4_9
label variable filter4_9 "filter 4, question 9"

rename h55000 filter4_9_hist 
lab var filter4_9_hist "filter 4, question 9 -- historical value" 

gen fu4_9_no = v55810 if grouped
replace fu4_9_no = v55820 if interleafed
lab copy v55810 fu4_9_no, replace
lab val fu4_9_no fu4_9_no 
label variable fu4_9_no "filter 4, question 9, No fu"

rename v55900 fu4_9_yes
label variable fu4_9_yes "filter 4, question 9, Yes fu"

// Filter 4, Question 10

rename v56000 filter4_10
label variable filter4_10 "filter 4, question 10"

rename h56000 filter4_10_hist 
lab var filter4_10_hist "filter 4, question 10 -- historical value" 

gen fu4_10_no = v56810 if grouped
replace fu4_10_no = v56820 if interleafed
lab copy v56810 fu4_10_no, replace
lab val fu4_10_no fu4_10_no 
label variable fu4_10_no "filter 4, question 10, No fu"

rename v56900 fu4_10_yes
label variable fu4_10_yes "filter 4, question 10, Yes fu"



/// Triggers

* count yes answers to yes filters
foreach s in filter1 filter2 filter3 {
	egen trigger_`s' = anycount(`s'*), v(1)
	
	gen mtrigger_`s' = trigger_`s'/6
	
	lab var trigger_`s' "Ct of trigger answers to yes filters in section `s'"
}

* count no answers to no filters
foreach s in filter4 {
	egen trigger_novar_`s' = anycount(`s'*) if !yestrig, v(2)
	egen trigger_var_`s' = anycount(`s'*) if yestrig, v(1)
	
	* yestrig controls whether yes or no triggered FUs in section 4
	gen trigger_`s' = trigger_novar_`s' if !yestrig
	replace trigger_`s' = trigger_var_`s' if yestrig
	
	gen mtrigger_`s' = trigger_`s'/10
	
	drop trigger_novar_`s' trigger_var_`s'
	lab var trigger_`s' "Ct of trigger answers to no filters in section `s'"
}

* count trigger answers in all filters
egen trigger_all = rowtotal(trigger_*)
gen mtrigger_all = trigger_all/28
lab var trigger_all "Ct of trigger answers in all filter sections"
lab var mtrigger_all "Mean number of trigger answers across all filter sections"

* count trigger answers in all YES filters
egen trigger_123 = rowtotal(trigger_filter1 trigger_filter2 trigger_filter3)
gen mtrigger_123 = trigger_123/18
lab var trigger_123 "Ct of trigger answers in filter sections 123"
lab var mtrigger_123 "Mean number of trigger answers across filter sections 123"

* flag each filter as triggered or not

* sections 1-3
forv s = 1/3 {
	forv q = 1/6 {
		gen tfilter`s'_`q' = (filter`s'_`q'==1)
		lab var tfilter`s'_`q' "Indicates answer led to follow ups, filter`s'-`q'"
	}
}

* section 4
forv q = 1/10 {
	* yestrig controls whether yes or no triggered FUs in section 4
	gen tfilter4_`q' = (filter4_`q'==1) if yestrig
	replace tfilter4_`q' = (filter4_`q'==2) if !yestrig
	lab var tfilter4_`q' "Indicates answer led to follow ups, filter4-`q'"
}





/// Calculate whether filter answer changed
* sections 1-3
forv s = 1/3 {
	forv q = 1/6 {
		gen filter`s'_`q'_changed = 1 if ~mi(filter`s'_`q'_hist) & filter`s'_`q' != filter`s'_`q'_hist
		replace filter`s'_`q'_changed = 0 if mi(filter`s'_`q'_changed)
		lab var filter`s'_`q'_changed "response to filter q changed after answering"
	}
}

* section 4
forv q = 1/10 {
	* yestrig controls whether yes or no triggered FUs in section 4
	gen filter4_`q'_changed = 1 if ~mi(filter4_`q'_hist) & filter4_`q' != filter4_`q'_hist
	replace filter4_`q'_changed = 0 if mi(filter4_`q'_changed)
	lab var filter4_`q'_changed "response to filter q changed after answering"
}



rename v21601wc fu2_1_7ac
rename v21606wc fu2_1_7bc
rename v22601wc fu2_2_7ac
rename v22606wc fu2_2_7bc
rename v23601wc fu2_3_7ac
rename v23606wc fu2_3_7bc
rename v24601wc fu2_4_7ac
rename v24606wc fu2_4_7bc
rename v25601wc fu2_5_7ac
rename v25606wc fu2_5_7bc
rename v26601wc fu2_6_7ac
rename v26606wc fu2_6_7bc

* standardize labels for yes/no questions

lab def ja_nein 0 "Nein" 1 "Ja" $misslabs

* recode yes-nos to 0,1 not 1,2
recode v95200 v90400 v01100 (2=0)

lab val filter?_*  v95200 v90400 v01100 interleafed grouped varied monotonous ///
	yestrigger notrigger panel consent tfilter* ja_nein

lab val fu*mb fu*me months
