'''
Script for generating R code for each state.
The generated R code is run and the results are stored.
The results contain Top 10 ranking of athletes in that
particular state.
'''

import os
from collections import defaultdict

# below code assigns weightage to each region
# taking attributes population of region,
# searched url type: sports/nonsports and regional/nonregional
# weightage assigned as follows:
# population: population/50000
# URL type: Sports=0.2, Non sports=0.1
# Regional=0.2 Nonregional=0.1
states = defaultdict(list)
regions = dict()
with open("Final Data.csv",'r') as fin:
	for line in fin:
		reg,st,pop,url,sports,regional = line.strip().split(",")
		if reg == st:
			continue
		if " " in pop:
			pop = pop.split(" ")[0]
		if pop == "#N/A":
			pop = 0 
		if reg+st in regions:
			wturl = regions[reg+st][1]
			if sports == "S":
				wturl = wturl + .2
			else:
				wturl = wturl + .1
			if regional.lower() == "regional":
				wturl = wturl + .2
			else:
				wturl = wturl + .1
			regions[reg+st][1] = wturl
		else:
			wtpop = float(pop)/50000.0
			wturl = 0.0
			if sports == "S":
				wturl = wturl + .2
			else:
				wturl = wturl + .1
			if regional.lower() == "regional":
				wturl = wturl + .2
			else:
				wturl = wturl + .1
			regions[reg+st] = [reg,wtpop+wturl]
			states[st.lower()].append(regions[reg+st])

		
def get_weightage(name):
	weight = []
	reglist = states[name]	
	for reg in reglist:
		weight.append(reg[1])
	return weight

# function to generate R code for each state to run and generate top 10 athletes in each state 
def create_r_file(infile,weight):
	with open(infile.split("\\")[-1].split(".")[0] + "-state.R",'w') as fout:
		pngfile = infile.split(".")[0].replace("\\","/").lstrip("\"") + "Top10.png"
		fout.write("library(RankAggreg)\n")
		fout.write("x <-as.matrix(read.table('{}',header=FALSE,sep=\",\",fill=TRUE,quote=\"\\\"\"))\n".format(infile.replace("\\","/").strip("\"")))
		fout.write("nrow(x)\n")
		fout.write("weight <- matrix(c({}),ncol={})\n".format(str(weight).strip("[]"),len(weight)))
		fout.write("(CESW <- RankAggreg(x, 10, method=\"CE\", distance=\"Spearman\", convIn=5, rho=.1,seed=123,importance=weight))\n")
		fout.write("png('{}')\n".format(pngfile))
		fout.write("plot(CESW)\n")
		fout.write("dev.off()\n")

# function to run R code of each state
def run_r_file(infile):
	routfile = "\"" + infile.split(".")[0] + "-Top10.out\""
	print ("Rscript.exe \"{}-state.R\" > {}".format(infile.split("\\")[-1].split(".")[0],routfile))
	os.system("Rscript.exe \"{}-state.R\" > {}".format(infile.split("\\")[-1].split(".")[0],routfile))

for root,dirs,files in os.walk(os.getcwd()):
	for f in files:
		if (".txt" in f):
			weight = get_weightage(f.split(".")[0])
			create_r_file(os.path.join(root,f),weight)
			run_r_file(os.path.join(root,f))
