#!/usr/bin/env python

import sys
import ast

for line in sys.stdin:
	line = line.strip()
	data = line.split("/")
	nodeid = int(data[0])
	node = ast.literal_eval(data[1])
	adjacency_list, p = node
	page_rank=(p/len(adjacency_list))	
	print(str(nodeid)+"id"+str(node))
	for neighbour in adjacency_list:
		print(str(neighbour)+"id"+str(page_rank))