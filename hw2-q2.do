use "C:\Users\Nguyen_Khanh\Downloads\nls.dta", clear


set seed 1234

regress lwage76 ed76

outreg2 using hw2-q2, excel replace ctitle("No measurement error") label

gen noise = rnormal(0,2)

gen lwage = lwage76 + noise

regress lwage ed76

outreg2 using hw2-q2, excel append ctitle("Measurement error in wages") label

gen education = ed76+ noise

regress lwage76 education

outreg2 using hw2-q2, excel append ctitle("Measurement error in education") label

drop education lwage

gen noise2 = rnormal(0,4)

summarize kww

gen education = ed76 + noise if kww<=r(mean)

replace education = ed76+ noise2 if kww>r(mean)

regress  lwage76 education

outreg2 using hw2-q2, excel append ctitle("Measurement error in education 2") label

summarize kww

gen lwage = lwage76 + noise if kww>=r(mean)

replace lwage = lwage76 + noise2 if kww<r(mean)

regress lwage ed76

outreg2 using hw2-q2, excel append ctitle("Measurement error in wages 2") label

codebook noise

codebook noise2