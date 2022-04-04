use "C:\Users\Zohreh\Downloads\nls.dta"

lab var lwage76 "Log wage in 1976"
lab var ed76 "Education level (1976)"
lab var lwage76 "Log wage (1976)"
lab var black "Black (1 = yes)"
lab var daded "Father Education"
lab var momed "Mother Education"
lab var kww "KWW score"
lab var smsa76 "Living in metropolitan area (1976)"
lab var smsa76 "Metropolitan area (1976) (1 = yes)"

reg lwage76 ed76

outreg2 using hw2-table1, excel replace ctitle("(1)") addtext(RegionFE, NO) label

reg lwage76 ed76 black daded momed kww

outreg2 using hw2-table1, excel append ctitle("(2)") addtext(RegionFE, NO) label

gen region = "1" if reg661 == 1

forvalues i = 2/9 {
replace region = region + "`i'" if reg66`i' ==1 
}

codebook region

tabulate region, generate(regionfe)

xi: reg lwage76 ed76 black daded momed kww regionfe* smsa76

outreg2 using hw2-table1, excel append ctitle("(3)") drop(regionfe*) addtext(RegionFE, YES) label

gen exper = age76 - ed76 -6
gen exper2 = exper^2

lab var exper "Experience"
lab var exper2 "Experience squared"

xi: reg lwage76 ed76 exper exper2 black regionfe*

outreg2 using hw2-table2, excel replace ctitle("1") drop(regionfe*) addtext(RegionFE, YES) label

xi: reg lwage76 ed76 exper exper2 black regionfe* momed daded

outreg2 using hw2-table2, excel append ctitle("1") drop(regionfe*) addtext(RegionFE, YES) label

xi: reg lwage76 ed76 exper exper2 black regionfe* momed daded kww smsa76

outreg2 using hw2-table3, excel replace ctitle("(1)") drop(regionfe*) addtext(RegionFE, YES) label

predict res_ed, residuals

lab var res_ed "Residuals"

reg lwage76 res_ed

outreg2 using hw2-resid, excel replace ctitle("(1)") label

reg lwage76 ed76 kww

outreg2 using hw2-table4, excel replace ctitle("(1)") addtext(RegionFE, NO) label

correlate kww ed76

reg lwage76 ed76

outreg2 using hw2-ques3, excel replace label

reg ed76 lwage76

outreg2 using hw2-ques3, excel append label
