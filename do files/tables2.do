// Tables no 2: Time use //
clear
do "/Users/mollie/Desktop/Summer Scholars 23/teamWestSS23/main.do"

//Pop categories
* ds men
mean work_spk_ if work_spk_ > 0 & sex == 1 & same_sex == 0 // ds men

* ss men
mean work_spk_ if work_spk_ > 0 & sex == 1 & same_sex == 1 // ss men

* ds women
mean work_spk_ if work_spk_ > 0 & sex == 2 & same_sex == 0 // ds women

* ss women
mean work_spk_ if work_spk_ > 0 & sex == 2 & same_sex == 1 // ss women

* ds parents
mean work_spk_ if work_spk_ > 0 & same_sex == 0 & kidund18 == 1 // ds parents

* ss parents
mean work_spk_ if work_spk_ > 0 & same_sex == 1 & kidund18 == 1 // ss parents

* ds non parents
mean work_spk_ if work_spk_ > 0 & same_sex == 0 & kidund18 == 0 // ds nonparents

* ss non parents
mean work_spk_ if work_spk_ > 0 & same_sex == 1 & kidund18 == 0 // ss nonparents





