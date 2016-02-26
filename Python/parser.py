import json

f = open("/home/nrangas/Downloads/js1","r+")
try:
        list_in = []
	string = f.readline()
	while ']' not in string:
		string = f.readline()
		if "Attributes" in string:
			dict_in = {}
			while "}" not in string:
				string = f.readline()
				if "}" in string:	
					continue
				string = string.strip()
				string = string.replace(",","")
				if " " in string:
					string = string.replace(" ","")
				words = (string.split(":"))
				dict_in[words[0]] = words[1]
			list_in.append(dict_in)
	print list_in
except EOFError as e:
	print e




