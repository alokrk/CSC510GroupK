'''
Code to do data pre-processing
and convert data to suit the data mining tasks
'''

from BeautifulSoup import BeautifulStoneSoup

fout =open("player-url-score.csv",'w')
soup = BeautifulStoneSoup(open("ydata-ysearch-location-entity-sources-athletes-v1_0.xml"))
regions = soup.findAll("region")
for region in regions:
#	allhosts = []
	#fout.write(region['name']+ ",")
	#hosts = region.find("entity").find("hosts")
	#urls = region.find("entity").find("urls")
	#url = urls.findAll("url")
	#for u in url:
	#	fout.write("{0},{1},{2}\n".format(region['name'],u.contents[0],u['score'])) 
	hosts = region.findAll("entity")
	for e in hosts[1:]:
		#fout.write("{0},{1},{2}\n".format(region['name'],e['name'].encode('utf-8'),e['score']))
		url = e.findAll("host")
		for u in url:
			if "," in region['name']:
				fout.write("{0},{1},{2},{3},{4}\n".format(region['name'],e['name'].encode('utf-8'),e['score'],u.contents[0],u['score'])) 
			else:
				fout.write("{0},{1},{2},{3},{4},{5}\n".format(region['name'],region['name'],e['name'].encode('utf-8'),e['score'],u.contents[0],u['score'])) 
#	urls = hosts.findAll("host")
#	for h in urls:
#		tmp = [x for x in h.contents if x not in allhosts]
#		allhosts.extend(tmp)
#	fout.write(str(len(allhosts)) + "\n")
#	del allhosts
#for host in allhosts:
#	print host

'''

'''
wikititle = ""
with open("regions.txt",'r') as fin:
	i = 0
	for line in fin:
		i = i + 1 
		if "," in line:
			wikititle = wikititle + line.strip().split(",")[0].title() + ", " + line.strip().split(",")[1].title() + "|"
		else:
			wikititle = wikititle + line.strip().split(",")[0].title() + "|"
		if i%10 == 0:
			print wikititle.rstrip("|")
		        wikititle = ""
'''
'''
wikititle = ""
errorlist=[]
with open("athletes-v1_0.txt",'r') as fin:
	i = 0
	for line in fin:
		i = i + 1 
		try:
			wikititle = wikititle + line.strip().title().encode('utf-8') + "|"
		except:
			errorlist.append(line)
		if i%10 == 0:
			print wikititle.rstrip("|")
		        wikititle = ""

print errorlist
'''
'''
fout =open("regionplayerlist.csv",'w')
soup = BeautifulStoneSoup(open("ydata-ysearch-location-entity-sources-athletes-v1_0.xml"))
regions = soup.findAll("region")
maxlength = 0
reg= ""
k=0
for region in regions:
	players=[]
	if "," not in region['name']:
		continue
	entities = region.findAll('entity')
	for each in entities[1:]:
		if each['name'].encode('utf-8') in players:
			print players
		players.append(each['name'].encode('utf-8'))
	#fout.write(region['name'].encode('utf-8'))
	if len(players) > maxlength:
		maxlength,reg = len(players),region['name'].encode('utf-8')
	if len(players) <2356:
		for i in range(2356-len(players)):
			players.append(str(0))
			k = k+1
	for val in players:
		fout.write(",{}".format(val))
	fout.write("\n")

print maxlength, reg
'''
'''
soup = BeautifulStoneSoup(open("ydata-ysearch-location-entity-sources-athletes-v1_0.xml"))
regions = soup.findAll("region")
states = []
for region in regions:
	if "," not in region['name'] and region['name'] not in states:
		states.append(region['name'].encode('utf-8'))
print states
'''
'''
from collections import defaultdict
with open("1.txt",'r') as fin:
	states = fin.readline().strip()
print states
soup = BeautifulStoneSoup(open("ydata-ysearch-location-entity-sources-athletes-v1_0.xml"))
regions = soup.findAll("region")
stateplayers = defaultdict(list)
for region in regions:
	if "," not in region['name']:
		continue
	entities = region.findAll('entity')
	players = [each['name'].encode('utf-8') for each in entities[1:]]
	stateplayers[region['name'].split(",")[1].encode('utf-8')].append(players)

for k in stateplayers.keys():	
	maxlength = len(max(stateplayers[k],key=len))
	val = 0
	with open("state\\" + k + ".txt",'w') as fout:
		for region in stateplayers[k]:
			for r in region:
				fout.write(",{}".format(r))
			for i in range(maxlength - len(region)):
				fout.write(",{}".format(str(val)))
				val = val + 1
			fout.write("\n")		

