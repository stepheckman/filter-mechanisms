* create BIG 5 personality measures
/* based on SPSS code available in:
Research Notes
Persönlichkeitsmerkmale im Sozio-oekonomischen Panel (SOEP)
Konzept, Umsetzung und empirische Eigenschaften
Max Dehne
Jürgen Schupp
*/

rename v60101 big5_1
rename v60102 big5_2
rename v60103 big5_3
rename v60104 big5_4
rename v60105 big5_5
rename v60106 big5_6
rename v60107 big5_7
rename v60108 big5_8
rename v60109 big5_9
rename v60110 big5_10
rename v60111 big5_11
rename v60112 big5_12
rename v60113 big5_13
rename v60114 big5_14
rename v60115 big5_15

egen big5miss = rowmiss(big5*)
replace big5miss = 1 if big5miss > 0
lab var big5miss "big5 cannot be computed due to missing data"

* these characteristics are negatively coded, need to be reversed
recode big5_15 (7=1)(6=2)(5=3)(3=5)(2=6)(1=7)
recode big5_12 (7=1)(6=2)(5=3)(3=5)(2=6)(1=7)
recode big5_7 (7=1)(6=2)(5=3)(3=5)(2=6)(1=7)
recode big5_3 (7=1)(6=2)(5=3)(3=5)(2=6)(1=7)

center big5_* if !big5miss

sum big5_* if !big5miss


* calc scale by averaging relevant items
* each 1 of the 5 scales associated with 3 items in 15 item battery
* SE determined which items belong to which scale by looking at largest loadings in SOEP code below
egen big5_o = rowmean(big5_4 big5_9 big5_14)
egen big5_c = rowmean(big5_1 big5_7 big5_11)
egen big5_e = rowmean(big5_2 big5_8 big5_12)
egen big5_a = rowmean(big5_3 big5_6 big5_13)
egen big5_n = rowmean(big5_5 big5_10 big5_15)

lab var big5_e "Big5: Extraversion"
lab var big5_a "Big5: Agreeableness (Verträglichkeit)"
lab var big5_c "Big5: Conscientiousness (Gewissenhaftigkeit)"
lab var big5_n "Big5: Neuroticism (Neurotizismus)"
lab var big5_o "Big5: Openness (Offenheit für Erfahrung)"

* big 5 questions
lab var big5_1 "Big 5:gründlich arbeitet"
lab var big5_2 "Big 5:mitteilsam, gesprächig ist"
lab var big5_3 "Big 5:manchmal etwas grob zu anderen ist"
lab var big5_4 "Big 5:originell ist, neue Ideen einbringt"
lab var big5_5 "Big 5:sich oft Sorgen macht"
lab var big5_6 "Big 5:verzeihen kann"
lab var big5_7 "Big 5:eher faul ist"
lab var big5_8 "Big 5:aus sich herausgehen kann, gesellig ist"
lab var big5_9 "Big 5:künstlerische Erfahrungen schätzt"
lab var big5_10 "Big 5:leicht nervös wird"
lab var big5_11 "Big 5:Aufgaben wirksam und effizient erledigt"
lab var big5_12 "Big 5:zurückhaltend ist"
lab var big5_13 "Big 5:rücksichtsvoll und freundlich mit anderen umgeht"
lab var big5_14 "Big 5:eine lebhafte Phantasie, Vorstellung hat"
lab var big5_15 "Big 5:entspannt ist, mit Stress gut umgehen kann"

drop big5_1 big5_2 big5_3 big5_4 big5_5 big5_6 big5_7 big5_8 ///
	big5_9 big5_10 big5_11 big5_12 big5_13 big5_14 big5_15

exit


** this code adapated from SOEP documentation (SPSS code)
* depends on hard coded loadings from fator analysis
* prob not appropriate for our very diffenet population

******** OFFENHEIT **************.
gen zoffen =  ///
-0.02832715982366	*c_big5_1 ///
-0.01046033536739	*c_big5_2 ///
-0.1845092656374	*c_big5_3 ///
+0.3387150950582	*c_big5_4 ///
+0.04943660468791	*c_big5_5 ///
+0.0626108402267	*c_big5_6 ///
-0.2547264198508	*c_big5_7 ///
+0.04958748769518	*c_big5_8 ///
+0.3765395450993	*c_big5_9 ///
+0.04001194052539	*c_big5_10 ///
+0.06016731873087	*c_big5_11 ///
-0.2046284986028	*c_big5_12 ///
+0.04544724948147	*c_big5_13 ///
+0.3938869075532	*c_big5_14 ///
-0.1627486230016	*c_big5_15


************* GEWISSENHAFTIGKEIT  ***********************.
gen zgewiss=  ///
+0.4946146164773	*c_big5_1 ///
+0.03019587260577	*c_big5_2 ///
-0.09613557119499	*c_big5_3 ///
+0.1024554094462	*c_big5_4 ///
+0.09268695602681	*c_big5_5 ///
-0.09161946971505	*c_big5_6 ///
+0.3760916611342	*c_big5_7 ///
-0.06581720998847	*c_big5_8 ///
-0.09678874296373	*c_big5_9 ///
-0.02378534356497	*c_big5_10 ///
+0.4096569962424	*c_big5_11 ///
-0.05910818675538	*c_big5_12 ///
-0.01406178244496	*c_big5_13 ///
-0.1111200994666	*c_big5_14 ///
-0.03981903173409	*c_big5_15

*************** EXTROVERTIERTHEIT  **************.
gen zextro =  ///
-0.05975120051592	*c_big5_1 ///
+0.4059905768925	*c_big5_2 ///
+0.0165029707398	*c_big5_3 ///
-0.01903028192229	*c_big5_4 ///
-0.02787988500476	*c_big5_5 ///
+0.01495977525352	*c_big5_6 ///
+0.07377616865182	*c_big5_7 ///
+0.3887719486968	*c_big5_8 ///
-0.1312665620116	*c_big5_9 ///
+0.03070226627138	*c_big5_10 ///
-0.07508095422926	*c_big5_11 ///
+0.5720457749475	*c_big5_12 ///
-0.04192110749127	*c_big5_13 ///
-0.04260765180518	*c_big5_14 ///
+0.139028234871	*	 c_big5_15



*********** VERTRAEGLICHKEIT  ***********.
gen zvertr = ///
-0.1336083302453	*c_big5_1 ///
+0.0652193584077	*c_big5_2 ///
+0.4939006738441	*c_big5_3 ///
-0.2033633993008	*c_big5_4 ///
+0.04760560092107	*c_big5_5 ///
+0.3678468806919	*c_big5_6 ///
+0.04665522193501	*c_big5_7 ///
+0.1007548179056	*c_big5_8 ///
+0.06055286840052	*c_big5_9 ///
-0.002395066572945  	*c_big5_10 ///
-0.09119585828771	*c_big5_11 ///
-0.1100879286947	*c_big5_12 ///
+0.4350656577656	*c_big5_13 ///
+0.02122519091007	*c_big5_14 ///
-0.03431126116987	*c_big5_15

********************** NEUROTIZISMUS  **************************.
gen zneuro = ///
+0.02215592276267	*c_big5_1 ///
+0.08385770165267	*c_big5_2 ///
-0.06728270636867	*c_big5_3 ///
-0.05062498820362	*c_big5_4 ///
+0.4364295975109	*c_big5_5 ///
+0.03573448008995	*c_big5_6 ///
+0.02509075339952	*c_big5_7 ///
+0.0491308593663	*c_big5_8 ///
+0.008399331096441  	*c_big5_9 ///
+0.4897491067319	*c_big5_10 ///
-0.01229134491374	*c_big5_11 ///
-0.03058711668782	*c_big5_12 ///
+0.04704833986464	*c_big5_13 ///
+0.0183654717288	*c_big5_14 ///
+0.4043792142645	*c_big5_15 


****************** Berechnung der normierten Skalenwerte	******************.
gen offen = (zoffen*10)+50
gen gewiss = (zgewiss*10)+50
gen extra = (zextro*10)+50
gen neuro = (zneuro*10)+50
gen vertr = (zvertr*10)+50

lab var offen  "BIG5: Offenheit f. Erfahrungen"
lab var gewiss  "BIG5: Gewissenhaftigkeit"
lab var extra  "BIG5: Extraversion"
lab var neuro  "BIG5: Neurotizismus"
lab var vertr "BIG5: Verträglichkeit"

sum offen gewiss extra neuro vertr

exit


* did not rerun factors here, just used loadings from SOEP documentation
factor big5_* if !big5miss, pcf mineigen(1) factors(5)
pca big5_* if big5miss!=1, components(5) mineigen(1) 

