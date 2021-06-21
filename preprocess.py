import json
import math
import re,os
if __name__ == '__main__':

	NUMBER_RE = re.compile(r"[-?\d']+")
	input_file = 'sampleinput.txt'
	with open(input_file, 'r') as out_file:
        	data = [x.split() for x in out_file.read().splitlines()]

   	nodes = {}
    	for line in data:
        	nodes[int(line[0])] = [] 

        
    	for line in data:
        	if line[1:] == []:
            		nodes[int(line[0])] = [] 
        	else:
            		nodes[int(line[0])].append(int(line[1:][0]))
    
	unique_node_count = len(nodes.keys()) 
	initial_pagerank = (1/float(unique_node_count))

	file1 = open("preprocess.txt", "w+")
	for _id, adj in nodes.items():
        	l2=list()
        	l2.append(adj)
        	l2.append(initial_pagerank)
        	l3=str(_id)+"/"+str(l2)+"\n"
        	file1.write(l3)