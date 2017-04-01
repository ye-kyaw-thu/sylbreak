#!/usr/bin/python
#-*- coding:utf-8 -*- 

import os, sys, codecs
import fileinput
import argparse
import re

## syllable breaking tool for Myanmar language
## usage: sylbreak.py -i input-file
## e.g. usage1: python ./sylbreak.py -i ../data/my-input.txt
##      usage2: cat ../data/my-input2.txt | ./sylbreak.py
##      usage3: ./sylbreak.py -i ../data/my-input.txt > out
##
## last updated: 21 July 2016
## Written by Ye Kyaw Thu, Visiting Researcher, Waseda University
## HP:https://sites.google.com/site/yekyawthunlp/

## Reference of Myanmar Unicode: http://unicode.org/charts/PDF/U1000.pdf

parser = argparse.ArgumentParser(description='Syllable segmentation for Myanmar language')
parser.add_argument('-i', '--input', type=str, help='input file')
parser.add_argument('-s', '--separator', type=str, default=ur'|', help='the separator option for syllable (e.g. -s "/"), default is "|"')
parser.add_argument('-p', '--print', type=bool, default=0, help='printing both input and syllable segmented sentences')
args = parser.parse_args()

inputFile = getattr(args, 'input')
sOption = getattr(args, 'separator')
pOption = getattr(args, 'print')

try:
   fSock = open('error.log', 'w')
   sys.stderr = fSock
except:
   raise SystemExit('error.log file cannot be opened!')

if not sys.stdin.isatty():
   utf8Reader = codecs.getreader('utf8')
   inputF = utf8Reader(sys.stdin)
else:
   try:
      inputF = codecs.open(inputFile, "rU", encoding='utf-8') #open with universal newline mode (i.e. U)
   except:
      print 'Input file cannot be opened:', inputFile
      raise SystemExit('Input file cannot be opened!')
   
myConsonant = ur"က-အ"
enChar = ur"a-zA-Z0-9"
otherChar = ur"ဣဤဥဥဧဩဪဿ၌၍၏၀-၉၊။!-/:-@[-`{-~\s"
ssSymbol = ur'္'
ngaThat = ur'င်'
aThat = ur'်'

#Regular expression pattern for Myanmar syllable breaking
#*** a consonant not after a subscript symbol AND a consonant is not followed by a-That character or a subscript symbol
BreakPattern = re.compile(ur"((?<!" + ssSymbol + ur")["+ myConsonant + ur"](?![" + aThat + ssSymbol + ur"])" + ur"|[" + enChar + otherChar + ur"])", re.UNICODE)


for line in inputF.read().splitlines():
   if pOption == 0:
      line = BreakPattern.sub(sOption + ur"\1", line)
      print line.encode('utf-8')
   elif pOption == 1:
      print "input:\t" + line
      line = "syl breaked:\t" + BreakPattern.sub(sOption + ur"\1", line)
      print line.encode('utf-8')

inputF.close()
fSock.close()

