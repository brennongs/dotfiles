#!/usr/bin/env python3
from os import path


BASE_DIR = path.dirname(path.dirname(path.abspath(__file__))) + "/"

with open(BASE_DIR + '.zshrc') as zshrc:
    lines = zshrc.readlines()

edit = False
for line in lines:
    print(str(lines.index(line)))
       
    if ' @local' in line:
       print('local')
       edit = True 
    
    elif ' @remote' in line:
        print('remote')
        edit = True
    
    elif ' @_' in line:
        print('end ' + str(lines.index(line)))
        edit = False

    elif edit == True:
       print(line) 
    