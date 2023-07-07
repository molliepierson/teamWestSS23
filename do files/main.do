
* this is our main do file!
/*
changes to katie's code:
	renamed age variable
	changed day_week to a binary for weekend
		-add a friday/holiday
	expanded race categories
	generated bipoc category (includes hispanic)
	
Questions:
	do we want to change education?
	add urban/rural
	what age range do we want to limit to?
	Do we want to add a retired binary?
	should I label dummy variables?
	how do we deal with missings? (katie leaves as number 9, should we change to .)
*/


use "/Users/mollie/Desktop/Summer Scholars 23/teamWestSS23/data.dta", clear

//  use "/Users/kosbab/Documents/GitHub/teamWestSS23/data.dta", clear


drop if spousepres == 3  // getting rid of all respondents w/o a spouse or partner in the hh

/*10 year age categories*/
	* age: age of ATUS respondent
	* recoding age into 10 year categories
rename age age1 

gen age = 0
	replace age = 1 if age1<30
	replace age = 2 if age1>=30 & age1<40
	replace age = 3 if age1>=40 & age1<50
	replace age = 4 if age1>=50 & age1<60
	replace age = 5 if age1>=60
	
	label define age_lb 1 "Less than 30" 2 "30-39" 3 "40-49" 4 "50-59" 5 "60 and over"
		label values age age_lb	

		
		
		
/* income */
	* income: total family income of ATUS respondent 
	* recoding income into 4 categories + missing
gen income=0 
	replace income = . if famincome ==9  
	replace income = . if famincome ==996 
	replace income = . if famincome ==997 
	replace income = . if famincome == 998
	replace income=1 if famincome <= 7
	replace income=2 if famincome >=8 & famincome<=13
	replace income=3 if famincome >=14 & famincome <=15
	replace income=4 if famincome==16

	lab def inc_lb 1 "Less than 25000" 2 "25000-74999" 3 "75000-149999" 4 "150000 and over" 9 "missing"
	lab values income inc_lb

/* week & weekend */
	*weekend: binary of day surveyed, on if sat or sun
gen weekend = 0
	replace weekend =1 if day==1 | day==7
	
	
/* race categories*/
	*race: race of ATUS respondent
	*recode of race
rename race race1

gen race=5 if race1!=9999
	replace race=1 if race1==100 //white 
	replace race=2 if race1==110 //black
	replace race=3 if race1==120 //aian
	replace race=4 if race1==131 | race1 == 132 //asian & pacific islander
	
	
	lab def race_lb 1 "white" 2 "black" 3 "ai/an" 4 "asian & pacific islander" 5 "mixed race" 
	lab values race race_lb

	
/* bipoc */
	*bipoc: binary of race, on if respondent is non-white or hispanic
gen bipoc = 0
	replace bipoc = 1 if race != 1
	replace bipoc = 1 if hispan != 100
	lab def bipoc_lb 0 "not bipoc" 1 "bipoc" 
	lab values bipoc bipoc_lb

/* education */
	*education: education of ATUS respondents
	*education recode into categories
gen education=3 if educ!=999
	replace education=1 if educ<20
// TODO:	REVIEW
	replace education=2 if educ>=20 & educ<40 
	
	// 20: ged, 21: diploma
	
	lab def edu_lb 1 "less hs" 2 "hs & some coll" 3 "degree +"
	lab values education edu_lb
	
/* employment */
	*employed: binary for employment status of ATUS respondent
gen employed=0 if empstat!=99
	replace employed=1 if empstat<=2
	

	
/* state-level marriage equality */

gen marlegal = 0
replace marlegal = 1 if date>=20150627
// replace marlegal = 1 if date>=20040517&statefip==25
// replace marlegal = 1 if date>=20080616&date<=20081105&statefip==6
// replace marlegal = 1 if date>=20081112&statefip==9
// replace marlegal = 1 if date>=20090427&statefip==19
// replace marlegal = 1 if date>=20090902&statefip==50
// replace marlegal = 1 if date>=20100101&statefip==33
// replace marlegal = 1 if date>=20100309&statefip==11
// replace marlegal = 1 if date>=20110724&statefip==36
// replace marlegal = 1 if date>=20121206&statefip==53
// replace marlegal = 1 if date>=20121229&statefip==23
// replace marlegal = 1 if date>=20130101&statefip==24
// replace marlegal = 1 if date>=20130628&statefip==6
// replace marlegal = 1 if date>=20130701&statefip==10
// replace marlegal = 1 if date>=20130801&statefip==27
// replace marlegal = 1 if date>=20130801&statefip==44
// replace marlegal = 1 if date>=20131021&statefip==34
// replace marlegal = 1 if date>=20131202&statefip==15
// replace marlegal = 1 if date>=20131219&statefip==35
// replace marlegal = 1 if date>=20140519&statefip==41
// replace marlegal = 1 if date>=20140520&statefip==42
// replace marlegal = 1 if date>=20140601&statefip==17
// replace marlegal = 1 if date>=20141006&statefip==18
// replace marlegal = 1 if date>=20141006&statefip==40
// replace marlegal = 1 if date>=20141006&statefip==49
// replace marlegal = 1 if date>=20141006&statefip==51
// replace marlegal = 1 if date>=20141006&statefip==55
// replace marlegal = 1 if date>=20141007&statefip==08
// replace marlegal = 1 if date>=20141009&statefip==32
// replace marlegal = 1 if date>=20141009&statefip==54
// replace marlegal = 1 if date>=20141010&statefip==37
// replace marlegal = 1 if date>=20141015&statefip==16
// replace marlegal = 1 if date>=20141017&statefip==02
// replace marlegal = 1 if date>=20141017&statefip==04
// replace marlegal = 1 if date>=20141021&statefip==56
// replace marlegal = 1 if date>=20141119&statefip==30
// replace marlegal = 1 if date>=20141120&statefip==45
// replace marlegal = 1 if date>=20150106&statefip==12


/* same sex coding*/
	*same_sex: binary for ss, on if in a ss partnership
gen same_sex=(sex==spsex)

gen same_sex3=0
	*same_sex3: categorical for partnership type
	replace same_sex3=1 if same_sex==0 
	replace same_sex3=2 if same_sex==1 & sex==1
	replace same_sex3=3 if same_sex==1 & sex==2

	label define samesex3_lb 1 "Hetero"
	label define samesex3_lb 2 "Same sex men", add
	label define samesex3_lb 3 "Same sex women", add
	label values same_sex3 samesex3_lb
	
/* cohab dummy */
	*cohab: binary for partnership type, on if a unmarried partner is present 
gen cohab = 0
	replace cohab = 1 if spousepres == 2

	
/*spouse variables--race, educ, emp*/

/*10 year age categories - SPOUSE */
gen sp_age = 0
	replace sp_age = 1 if spage<30
	replace sp_age = 2 if spage>=30 & spage<40
	replace sp_age = 3 if spage>=40 & spage<50
	replace sp_age = 4 if spage>=50 & spage<60
	replace sp_age = 5 if spage>=60
	
// 	label define age_lb 1 "Less than 30" 2 "30-39" 3 "40-49" 4 "50-59" 5 "60 and over"
		label values sp_age age_lb

	
/* race categories - SPOUSE */
gen sp_race=5 if sprace!=9998
	replace sp_race=1 if sprace==100 //white 
	replace sp_race=2 if sprace==110 //black
	replace sp_race=3 if sprace==120 //aian
	replace sp_race=4 if sprace==131 | sprace == 132 //asian & pacific islander
	
	lab values sp_race race_lb
	
/* bipoc- SPOUSE */
gen sp_bipoc = 0 if sp_race != . & sphispan != 9998
	replace sp_bipoc = 1 if sprace != 100 & sp_race != .
	replace sp_bipoc = 1 if sphispan != 100 & sphispan != 9998 
	lab values sp_bipoc bipoc_lb

/* education - SPOUSE */
gen sp_education=3 if speduc!=998
	replace sp_education=1 if speduc<20
	replace sp_education=2 if speduc>=20 & speduc<40
	lab values sp_education edu_lb
	
/* employment - SPOUSE */
gen sp_employed=0 if spempstat!=99
	replace sp_employed=1 if spempstat<=2
	
//
// /*couple variables--race, educ, emp*/
// foreach v in age sp_age race sp_race education sp_education sex spsex {
// // 	gen _sp_`v'=`v'
// 	egen co_`v'=max(`v'),by(caseid)
// 	}
	

/* Couple Categories */
gen race_couple=.
	replace race_couple=0 if race==1 & sp_race==1 
	replace race_couple=1 if ((race!=1 & sp_race==1) | (race == 1 & sp_race !=1)) & sp_race!=.
	replace race_couple=1 if race !=1 & sp_race!=1 & sp_race!=.
	label define race_couple_lb 0 "Both white" 1 "At least one non white" 
// 	3 "Both non-white"
	label values race_couple race_couple_lb
	
	
/* couple employment*/
gen co_employed = 0
	replace co_employed = 1 if employed == 0 & sp_employed ==0
	replace co_employed = 2 if employed == 1 & sp_employed == 0
	replace co_employed = 2 if employed == 0 & sp_employed == 1
	replace co_employed = 3 if employed == 1 & sp_employed == 1

	label define co_employ_lb 1 "Neither Employed" 2 "One Employed" 3 "Both Employed"
	label values co_employed co_employ_lb
	
	
/* couple bipoc*/
gen co_bipoc = 0 
	replace co_bipoc =1 if bipoc == 1 | sp_bipoc ==1 
	
	
	
* loop for max age of couple *
gen co_age = .

if age1 >= spage {
	replace co_age = age1
}

else if age1 < spage {
	replace co_age = spage
}
	
order region statefip date weekend marst income sex age race bipoc education employed marlegal same_sex sp_age sp_race sp_bipoc sp_education sp_employed race_couple
 
 
rename same_sex3 partnership_type3

gen co_education = 0
replace co_education = 1 if educ >= 31
replace co_education = 1 if speduc >= 31

gen kidund5 = 0
replace kidund5 = 1 if kidund1 == 1
replace kidund5 = 1 if kid1to2 == 1
replace kidund5 = 1 if kid3to5 == 1

gen inc1 = 0 if famincome !=9 | famincome !=996 | famincome !=997 | famincome != 998
replace inc1 = 1 if income == 1	

gen inc2 = 0 if famincome !=9 | famincome !=996 | famincome !=997 | famincome != 998
replace inc2 = 1 if income == 2	

gen inc3 = 0 if famincome !=9 | famincome !=996 | famincome !=997 | famincome != 998
replace inc3 = 1 if income == 3

gen inc4 = 0 if famincome !=9 | famincome !=996 | famincome !=997 | famincome != 998
replace inc4 = 1 if income == 4	


gen age2 = co_age*co_age




gen marlegal_samesex = 0
replace marlegal_samesex = 1 if marlegal == 1 & same_sex == 1 

// TIME USE VARS

gen hhact_pk_or_sk = hhact_pk_merge + hhact_sk_merge

gen hhcare_pk_or_sk = hhcare_pk_merge + hhcare_sk_merge

gen religion_pk_or_sk = religion_pk_merge + religion_sk_merge

gen social_pk_or_sk = social_pk_merge + social_sk_merge

gen sports_pk_or_sk = sports_pk_merge + sports_sk_merge

drop hhact_pk_merge hhact_sk_merge hhcare_pk_merge hhcare_sk_merge religion_pk_merge religion_sk_merge social_pk_merge social_sk_merge sports_pk_merge sports_sk_merge

drop if age1 > 65
drop if age1 < 18	
	
gen leisure = social_spk_ + sports_spk_
	
	
	
	
	
	
	
	