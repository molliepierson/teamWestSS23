svyset [pweight=wt06]



//Women, non parents
asdoc svy: regress work_spk_ marlegal same_sex marlegal_samesex if sex == 2 & kidund18 == 0, nested save(file) replace

asdoc svy: regress work_spk_ marlegal same_sex marlegal_samesex co_age age2 co_education co_employed income if sex == 2 & kidund18 == 0, nested save(file) append

asdoc svy: regress work_spk_ marlegal same_sex marlegal_samesex cohab co_age age2 co_education co_employed co_bipoc income region weekend if sex == 2 & kidund18 == 0, nested save(file) append



//Men, non parents
asdoc svy: regress work_spk_ marlegal same_sex marlegal_samesex if sex == 1 & kidund18 == 0, nested save(file) append

asdoc svy: regress work_spk_ marlegal same_sex marlegal_samesex co_age age2 co_education co_employed income if sex == 1 & kidund18 == 0, nested save(file) append

asdoc svy: regress work_spk_ marlegal same_sex marlegal_samesex cohab co_age age2 co_education co_employed co_bipoc income region weekend if sex == 1 & kidund18 == 0, nested save(file) append
