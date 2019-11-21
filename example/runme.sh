#!/bin/bash

rm -rf read* *_output

#bunzip2 test.fasta.bz2
#bzcat test.fasta.bz2 > test.fasta

if [ ! $1 ]
then
	bzcat $1 > test.fasta
else
	bzcat ecoli.fasta.bz2 > test.fsa

genome=test.fasta

if [ ! $1 ]
then
    echo 'reads' $1
    art_illumina -ss HS25 -i $genome -na -p -l 150 -f 10 -m 200 -s 10 -o read
    fq2fa --merge read1.fq read2.fq reads.fa
    bash ../bin/run_poem.sh -f reads.fa -a y -p pro
else
    echo 'genome' $1
    bash ../bin/run_poem.sh -f $genome -a n -p pro

fi

rm test.fasta
