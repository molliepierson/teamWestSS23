
* this is our main do file!
/*
changes to katie's code:
	renamed age variable
	changed day_week to a binary for weekend
	expanded race categories
	generated bipoc category (includes hispanic)
	
Questions:
	do we want to change education?
	what age range do we want to limit to?
	Do we want to add a retired binary
	should I label dummy variables?
	
*/

drop if spousepres == 3

use "/Users/mollie/Desktop/Summer Scholars 23/teamWestSS23/data.dta", clear

/*10 year age categories*/
gen age_recode = 0
	replace age_recode = 1 if age<30
	replace age_recode = 2 if age>=30 & age<40
	replace age_recode = 3 if age>=40 & age<50
	replace age_recode = 4 if age>=50 & age<60
	replace age_recode = 5 if age>=60
	
	label define age_lb 1 "Less than 30" 2 "30-39" 3 "40-49" 4 "50-59" 5 "60 and over"
		label values age_recode age_lb

/* income */
gen income=9
	replace income=1 if famincome <= 7
	replace income=2 if famincome >=8 & famincome<=13
	replace income=3 if famincome >=14 & famincome <=15
	replace income=4 if famincome==16

	lab def inc_lb 1 "Less than 25000" 2 "25000-74999" 3 "75000-149999" 4 "150000 and over" 9 "missing"
	lab values income inc_lb

/* week & weekend */
gen weekend = 0
	replace weekend =1 if day==1 | day==7
	
/* race categories*/
gen race_recode=5 if race!=9999
	replace race_recode=1 if race==100 //white 
	replace race_recode=2 if race==110 //black
	replace race_recode=3 if race==120 //aian
	replace race_recode=4 if race==131 | race == 132 //asian & pacific islander
	
	lab def race_lb 1 "white" 2 "black" 3 "ai/an" 4 "asian & pacific islander" 5 "mixed race"
	lab values race_recode race_lb
	
/* bipoc */
gen bipoc = 0
	replace bipoc = 1 if race != 100
	replace bipoc = 1 if hispan != 100

/* education */
gen educ_recode=3 if educ!=999
	replace educ_recode=1 if educ<20
	replace educ_recode=2 if educ>=20 & educ<40
	
	lab def edu_lb 1 "less hs" 2 "hs & some coll" 3 "degree +"
	lab values educ_recode edu_lb
	
/* employment */
gen employed=0 if empstat!=99
	replace employed=1 if empstat<=2
	

	
/* state-level marriage equality */

gen marlegal = 0
replace marlegal = 1 if date>=20150627
replace marlegal = 1 if date>=20040517&statefip==25
replace marlegal = 1 if date>=20080616&date<=20081105&statefip==6
replace marlegal = 1 if date>=20081112&statefip==9
replace marlegal = 1 if date>=20090427&statefip==19
replace marlegal = 1 if date>=20090902&statefip==50
replace marlegal = 1 if date>=20100101&statefip==33
replace marlegal = 1 if date>=20100309&statefip==11
replace marlegal = 1 if date>=20110724&statefip==36
replace marlegal = 1 if date>=20121206&statefip==53
replace marlegal = 1 if date>=20121229&statefip==23
replace marlegal = 1 if date>=20130101&statefip==24
replace marlegal = 1 if date>=20130628&statefip==6
replace marlegal = 1 if date>=20130701&statefip==10
replace marlegal = 1 if date>=20130801&statefip==27
replace marlegal = 1 if date>=20130801&statefip==44
replace marlegal = 1 if date>=20131021&statefip==34
replace marlegal = 1 if date>=20131202&statefip==15
replace marlegal = 1 if date>=20131219&statefip==35
replace marlegal = 1 if date>=20140519&statefip==41
replace marlegal = 1 if date>=20140520&statefip==42
replace marlegal = 1 if date>=20140601&statefip==17
replace marlegal = 1 if date>=20141006&statefip==18
replace marlegal = 1 if date>=20141006&statefip==40
replace marlegal = 1 if date>=20141006&statefip==49
replace marlegal = 1 if date>=20141006&statefip==51
replace marlegal = 1 if date>=20141006&statefip==55
replace marlegal = 1 if date>=20141007&statefip==08
replace marlegal = 1 if date>=20141009&statefip==32
replace marlegal = 1 if date>=20141009&statefip==54
replace marlegal = 1 if date>=20141010&statefip==37
replace marlegal = 1 if date>=20141015&statefip==16
replace marlegal = 1 if date>=20141017&statefip==02
replace marlegal = 1 if date>=20141017&statefip==04
replace marlegal = 1 if date>=20141021&statefip==56
replace marlegal = 1 if date>=20141119&statefip==30
replace marlegal = 1 if date>=20141120&statefip==45
replace marlegal = 1 if date>=20150106&statefip==12

//
// /*atus respondent's cps line number*/
// gen _resp_line_cps8=lineno_cps8 if lineno==1
// egen resp_line_cps8=max(_resp_line_cps8),by(caseid)
// /*partner's cps line number*/
// gen _part_line_cps8=lineno_cps8 if pecohab==resp_line_cps8 & relate>=28 & relate<=997
// egen part_line_cps8=max(_part_line_cps8),by(caseid)
// /*partner's relate codes from atus and cps*/
// gen _part_cps_relate=relate_cps8 if part_line_cps8==lineno_cps8
// egen part_cps_relate=max(_part_cps_relate),by(caseid)
// 	label values part_cps_relate relate_cps8_lbl
// gen _part_atus_relate=relate if part_line_cps8==lineno_cps8
// egen part_atus_relate=max(_part_atus_relate),by(caseid)
// 	label values part_atus_relate relate_lbl
//	
//
// /* partnering categories*/
//
// gen _temp=spousepres if spousepres!=99
// egen spousepres_on_all=max(_temp),by(caseid)
//
// /*so we know how many couples come from atus directly and from cps pointer code*/
// gen _couple_type=.
// 	replace _couple_type=0 if (spousepres_on_all==1 | spousepres_on_all==2) & lineno_cps8==999 & (relate==20 | relate==21)
//
// 	replace _couple_type=1 if (spousepres_on_all==1 | spousepres_on_all==2) & lineno_cps8!=999 & (relate==20 | relate==21)
//
// 	replace _couple_type=2 if spousepres==3 & part_line_cps8!=. & _couple_type==.
//
//
// egen couple_type=max(_couple_type),by(caseid)
//
// gen marr_cohab=spousepres
// 	replace marr_cohab=. if spousepres>=3
// 	replace marr_cohab=2 if couple_type==2 //identify R as having a cohab parter if they're in couple_type=2 (assigned based on PECOHAB) and SPOUSEPRES=3 (not in partnership)

// 	lab def marr_cohab_lb 1 "married" 2 "cohab"
// 	lab values marr_cohab marr_cohab_lb

/* couple categories- identifying same sex couples */

gen same_sex=(sex==sp_sex)

gen same_sex3=0;
	replace same_sex3=1 if same_sex==0 ;
	replace same_sex3=2 if same_sex==1 & sex==1;
	replace same_sex3=3 if same_sex==1 & sex==2;

	label define samesex3_lb 1 "Hetero";
	label define samesex3_lb 2 "Same sex men", add;
	label define samesex3_lb 3 "Same sex women", add;
	label values same_sex3 samesex3_lb;
	
/* cohab dummy */
gen cohab = 0
	replace cohab = 1 if spousepres == 2

	
/*spouse variables--race, educ, emp*/
gen ispart=0;
	replace ispart=1 if (relate==20 | relate==21);
	replace ispart=1 if _part_line_cps8!=. & couple_type==2;

/*couple variables--race, educ, emp*/
foreach v in age age2 race_red educ_red sex {;
	gen _sp_`v'=`v' if ispart==1;
	egen sp_`v'=max(_sp_`v'),by(caseid);
	};
	

/* Couple Categories */

gen race_couple=.
	replace race_couple=1 if race_recode==1 & sp_race_red==1 ;
	replace race_couple=2 if ((race_recode !=1 & sp_race_red==1) | (race_red == 1 & sp_race_red !=1)) & sp_race_red!=.;
	replace race_couple=3 if race_recode !=1 & sp_race_red !=1 & sp_race_red!=.;
	label define race_couplel 1 "Both white" 2 "One non white" 3 "Both non-white";
	label values race_couple race_couplel;
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	