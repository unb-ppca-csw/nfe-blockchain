#!/usr/bin/python

import sys

option= sys.argv[1] 
inputdata= sys.argv[2] 

if option == '-e':
   print inputdata.encode("hex")
if option == '-d':
   print inputdata.decode("hex")
