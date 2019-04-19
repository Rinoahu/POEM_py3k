#!usr/bin/env python

import sys

if len(sys.argv[1:]) < 1:
    print 'python this.py foo.fsa'
    raise SystemExit()

qry = sys.argv[1]

f = open(qry, 'r')

for i in f:
    if i.startswith('>'):
        j = [elem.strip() for elem in i.split('#')][:4]
        #print j
        k = j[0].rfind('_')
        scf, qid = j[0][:k], j[0][k+1:]
        st, ed, strand = map(int, j[1:4])
        strand = strand == 1 and '+' or '-'
        print '>gene_%08d'%int(qid) + '|Prodigal|' + str(ed - st + 1)  + '_nt|' + strand + '|' + str(st) + '|' + str(ed) + '\t' + scf
    else:
        print i[:-1]
