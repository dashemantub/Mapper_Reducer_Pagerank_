#!/usr/bin/env python

import sys
import ast

s = 0
l1 = []
node_2 = 0
p = 0
flag=0
for line in sys.stdin:
	line = line.strip().split("id")
	nodeid = int(line[0])
	node = ast.literal_eval(line[1])
	if(nodeid != node_2):
		s=0
		node_2 = nodeid
	if isinstance(node, list):
		l1, p = node
		flag=1	
	else:
		s = s + node

	l2 = list()
	l2.append(l1)
	l2.append(s)
	if flag==1 :
		print(str(nodeid)+"/"+str(l2))
	flag=0