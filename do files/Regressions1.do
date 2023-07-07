svyset [pweight=wt06]

//Men, non parents
asdoc svy: regress in_public_sp_ marlegal same_sex marlegal_samesex if sex == 2 & kidund18 == 0, nested cnames(non-parents) save(file) replace

asdoc svy: regress in_public_sp_ marlegal same_sex marlegal_samesex co_age age2 co_education i.co_employed i.income if sex == 2 & kidund18 == 0, nested cnames(non-parents) save(file) append

asdoc svy: regress in_public_sp_ marlegal same_sex marlegal_samesex cohab co_age age2 co_education i.co_employed co_bipoc i.income i.region weekend if sex == 2 & kidund18 == 0, nested cnames(non-parents) save(file) append


//Men, parents
asdoc svy: regress in_public_sp_ marlegal same_sex marlegal_samesex if sex == 2 & kidund18 == 1, label nested cnames(parents) save(file) append 

asdoc svy: regress in_public_sp_ marlegal same_sex marlegal_samesex co_age age2 co_education i.co_employed i.income hh_numownkids if sex == 2 & kidund18 == 1, label nested cnames(parents) save(file) append

asdoc svy: regress in_public_sp_ marlegal same_sex marlegal_samesex cohab co_age age2 co_education i.co_employed co_bipoc i.income i.region hh_numownkids kidund5 weekend if sex == 2 & kidund18 == 1, label nested cnames(parents) save(file) append



//All Men

asdoc svy: regress in_public_sp_ marlegal same_sex marlegal_samesex if sex == 2, label nested cnames(parents) save(file) append 

asdoc svy: regress in_public_sp_ marlegal same_sex marlegal_samesex co_age age2 co_education i.co_employed i.income hh_numownkids if sex == 2, label nested cnames(parents) save(file) append

asdoc svy: regress in_public_sp_ marlegal same_sex marlegal_samesex cohab co_age age2 co_education i.co_employed co_bipoc i.income i.region weekend if sex == 2, nested label cnames(all) save(file) title(Total Time in Public with a Spouse or Partner Among Men: Federal-Level) fs(9) append
