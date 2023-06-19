clear
do "/Users/mollie/Desktop/Summer Scholars 23/teamWestSS23/main.do"
 

 
//tab income marlegal co_bipoc, by()
//tabstat both_employed one_employed neither_employed, by(partnership_type) stat(percent)
//   table (co_employed) (partnership_type), statistic(fvpercent) 
//   table (race_couple) (partnership_type), statistic(fvpercent) 
//  
//   tab co_employed partnership_type, row nofreq
//tabstat both_employed one_employed neither_employed, by(partnership_type)
// tabform co_age income co_employed race_couple cohab [aw=wt06] using "Graphs and Table 1a.xls", vertical by(partnership_type) mtest  mtbdec(3)
//
// tabform  race_couple [aw=wt06] using "Graphs and Tables/Table 7b.xls", vertical by(same_sex) mtest mtprob mtbdec(3)



//Rough Rough sum stats

*Table 1.1: Yearly Observations by Coupling type

//
// count if marlegal == 1 & partnership_type3 == 1 & spousepres == 2 //DS COHAB 
// count if marlegal == 1 & partnership_type3 == 1 & spousepres == 1 //DS MARRIED
//
// count if marlegal == 1 & partnership_type3 == 3 & spousepres == 2 //SS F COHAB
// count if marlegal == 1 & partnership_type3 == 3 & spousepres == 1 //SS F MARRIED
//
// count if marlegal == 1 & partnership_type3 == 2 & spousepres == 2 //SS M COHAB
// count if marlegal == 1 & partnership_type3 == 2 & spousepres == 1 //SS M MARRIED
//

//
// count if year == 2021 & partnership_type3 == 1 & spousepres == 2 //DS COHAB
// count if year == 2021 & partnership_type3 == 1 & spousepres == 1 //DS MARRIED
//
// count if year == 2021 & partnership_type3 == 3 & spousepres == 2 //SS F COHAB
// count if year == 2021 & partnership_type3 == 3 & spousepres == 1 //SS F MARRIED
//
// count if year == 2021 & partnership_type3 == 2 & spousepres == 2 //SS M COHAB
// count if year == 2021 & partnership_type3 == 2 & spousepres == 1 //SS M MARRIED

// sum co_age if partnership_type3 == 1 & spousepres == 2 //DS COHAB
// sum co_age if partnership_type3 == 1 & spousepres == 1 //DS MARRIED
//
// sum co_age if partnership_type3 == 3 & spousepres == 2 //SS F COHAB
// sum co_age if partnership_type3 == 3 & spousepres == 1 //SS F MARRIED
//
// sum co_age if partnership_type3 == 2 & spousepres == 2 //SS M COHAB
// sum co_age if partnership_type3 == 2 & spousepres == 1 //SS M MARRIED
//
// sum co_bipoc if partnership_type3 == 1 & spousepres == 2 //DS COHAB
// sum co_bipoc if partnership_type3 == 1 & spousepres == 1 //DS MARRIED
//
// sum co_bipoc if partnership_type3 == 3 & spousepres == 2 //SS F COHAB
// sum co_bipoc if partnership_type3 == 3 & spousepres == 1 //SS F MARRIED
//
// sum co_bipoc if partnership_type3 == 2 & spousepres == 2 //SS M COHAB
// sum co_bipoc if partnership_type3 == 2 & spousepres == 1 //SS M MARRIED
//
//
// sum co_education if partnership_type3 == 1 & spousepres == 2 //DS COHAB
// sum co_education if partnership_type3 == 1 & spousepres == 1 //DS MARRIED
//
// sum co_education if partnership_type3 == 3 & spousepres == 2 //SS F COHAB
// sum co_education if partnership_type3 == 3 & spousepres == 1 //SS F MARRIED
//
// sum co_education if partnership_type3 == 2 & spousepres == 2 //SS M COHAB
// sum co_education if partnership_type3 == 2 & spousepres == 1 //SS M MARRIED

// sum kidund18 if partnership_type3 == 1 & spousepres == 2 //DS COHAB
// sum kidund18 if partnership_type3 == 1 & spousepres == 1 //DS MARRIED
//
// sum kidund18 if partnership_type3 == 3 & spousepres == 2 //SS F COHAB
// sum kidund18 if partnership_type3 == 3 & spousepres == 1 //SS F MARRIED
//
// sum kidund18 if partnership_type3 == 2 & spousepres == 2 //SS M COHAB
// sum kidund18 if partnership_type3 == 2 & spousepres == 1 //SS M MARRIED

// sum hh_numownkids if kidund18 == 1 & partnership_type3 == 1 & spousepres == 2 //DS COHAB
// sum hh_numownkids if kidund18 == 1 & partnership_type3 == 1 & spousepres == 1 //DS MARRIED
//
// sum hh_numownkids if kidund18 == 1 & partnership_type3 == 3 & spousepres == 2 //SS F COHAB
// sum hh_numownkids if kidund18 == 1 & partnership_type3 == 3 & spousepres == 1 //SS F MARRIED
//
// sum hh_numownkids if kidund18 == 1 & partnership_type3 == 2 & spousepres == 2 //SS M COHAB
// sum hh_numownkids if kidund18 == 1 & partnership_type3 == 2 & spousepres == 1 //SS M MARRIED

// sum kidund5 if kidund18 == 1 & partnership_type3 == 1 & spousepres == 2 //DS COHAB
// sum kidund5 if kidund18 == 1 & partnership_type3 == 1 & spousepres == 1 //DS MARRIED
//
// sum kidund5 if kidund18 == 1 & partnership_type3 == 3 & spousepres == 2 //SS F COHAB
// sum kidund5 if kidund18 == 1 & partnership_type3 == 3 & spousepres == 1 //SS F MARRIED
//
// sum kidund5 if kidund18 == 1 & partnership_type3 == 2 & spousepres == 2 //SS M COHAB
// sum kidund5 if kidund18 == 1 & partnership_type3 == 2 & spousepres == 1 //SS M MARRIED

sum inc4 if partnership_type3 == 1 & spousepres == 2 //DS COHAB
sum inc4 if partnership_type3 == 1 & spousepres == 1 //DS MARRIED

sum inc4 if partnership_type3 == 3 & spousepres == 2 //SS F COHAB
sum inc4 if partnership_type3 == 3 & spousepres == 1 //SS F MARRIED

sum inc4 if partnership_type3 == 2 & spousepres == 2 //SS M COHAB
sum inc4 if partnership_type3 == 2 & spousepres == 1 //SS M MARRIED

sum inc4

