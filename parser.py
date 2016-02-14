import json

f = open("/home/nrangas/Downloads/Tags.json","r+")
string = f.readline()
obj = json.loads(string)
print obj['tags']['row'][1]['@Count']
#print obj['tags']['row']['@attributes']['Count']




