# Final_coding_project
I wrote the python code and my stata code is based on the metrics assignment. In fact, I do not change my code after TA solved. I only send my answer. It includes tables and regressions.I explain about the code that I use in my stata and python.

**Understand folder structure. Perform operations on files in different folders.
cd c: users\Zohreh\oneDrive\Destktop\Assignment
dir( in window I cannot use ls -lF) to give me the details of contents of folders
**Automate repeating tasks using Python “for” loops
>>> for number in range(0,200):
... print(number)
... 
0
1
2
**Break up work into smaller components using Python functions.( I think as we have this code in the class, like this: 
def print_date (year, month, day)
    joined = str(year) + '/' +  str(month) + '/' + str (day)
    print(joinde)
print_date(2022, 4, 4)
2022/4/4

**Use Python “lists” and “dictionaries” appropriately. Demonstrate one of the two.( for writing my code I used list, in fact I list a number of integers and it will be stop until we write .)
**Automate repeating tasks using Stata “for” loops.
it is similar python we generate one loop like this in this paper:
gen white=1 if (race=="w")
replace white = 0 if (race=="B")
egen LWmean = mean(call) if (white==1) & (1==1)

**Read .csv data in in Stata. use this code(insheet using variable.csv, comma clear.)
**Fix common data quality errors in Stata (for example, string vs number, missing value).
(we can fix a missing value issue, we should replace the empty cells of the variable with zeros. Otherwise, when we e.g., create a dummy variable from a variable with missing values, STATA will generate “1” as opposed to zero, assuming the missing values have infinite values. such that: replace emp=0 if emp ==. )
**Prepare a sample for analysis by filtering observations and variables and creating transformations of variables. Demonstrate all three.
we can prepare a sample for analysis using the nls data (in this article), we should start preparing the seed for random numbers e.g., 123. This will allow us to reproduce a particular sequence of 'random' numbers. If we have a big data set with many variables, we can filter by dropping the variables that are not going to be used for the analysis and just keep the ones that will be needed. To transform the variable to another one for example daded( here it is the variable that showe the number of father education) gen dadlog = log(daded)

**Save data in Stata.( save nls.dta, replace) or we can open them from new folder and then they will be open and we can work on it and after that we can clear to remove them if you mean this.
Run ordinary least squares regression in Stata.( reg dependent variable independent variable(s), I save the tables and regressions in the separated pdf file and git add them in my github)
**Create a graph (of any type) in Stata.( I use twoway code and put two graphs in my github as graph 1 and 2)
Save regression tables and graphs as files. Demonstrate both.( i use outreg using code and graph export code, in my stata code I used them)
**Install a Stata package. (Can be the same as we already did in class.) ( ssc install)






