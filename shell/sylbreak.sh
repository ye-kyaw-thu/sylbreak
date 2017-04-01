#!/bin/bash
set -u

## syllable breaking tool for Myanmar language
## usage: ./sylbreak.pl <-i filename>  [-s separator] [-p 0 or 1]
## e.g. usage1: ./sylbreak.sh -i ../data/my-input.txt
##      usage2: cat ../data/my-input.txt | ./sylbreak.sh
##      usage3: ./sylbreak.sh --input ../data/my-input.txt --separator "_" --print 1 
##
## last updated: 25 July 2016
## Author: Ye Kyaw Thu, Visiting Researcher, Waseda University
## HP:https://sites.google.com/site/yekyawthunlp/

## Reference of Myanmar Unicode: http://unicode.org/charts/PDF/U1000.pdf

function help
{

   echo "Usage: ./syl-RE-break.sh <filename>  [separator] [print-option]"
   echo "<filename>: input file for syllable segmentation"
   echo "[separator]: the separator for syllables (e.g. -s "/"), default is \"|\""
   echo "[print-option]: for printing both input and syllable segmented sentences (0 or 1), default is 0"

}

# check filename argv and stdin
if [[ $# -lt 1  &&  -t 0 ]]; then
   help;
   exit 1
fi

#default values
sepOption="|";
pOption=0

while [[ $# -ge 1 ]]
do
key="$1"

   case $key in
      -i|--input)
         iOption="$2"
         shift ;;
      -s|--separator)
         sepOption="$2"
         shift ;;
      -p|--print)
         pOption="$2"
         shift ;;
      --default)
         #sepOption="|";
         #pOption=0 
         ;;
      *)
         echo "Unknown argument $1"; help;
         exit 1 ;;
   esac
shift
done


myConsonant="က-အ"
enChar="a-zA-Z0-9"
eChar="abcdefg"
otherChar="ဣဤဥဥဧဩဪဿ၌၍၏၀-၉၊။!-\/:-\@\[-\`{-~\\s"
ssSymbol="္"
aThat="်"
#ssSymbol='\341\200\271'
#aThat='\341\200\272'

#$line =~ s/((?<!$ssSymbol)[$myConsonant](?![$aThat$ssSymbol])|[$enChar$otherChar])/$sep$1/g;

# IFS for not trimming leading and trailing whitespaces
# -r for preventing backslash escapes from being interpreted
# || [[ -n "$line" ]] for preventing last line skipping if it doesn't end with a "\n"
while IFS='' read -r line || [[ -n "$line" ]]; do

if [[ $pOption -eq 1 ]]; then
   echo -e "input:\t$line"
   printf "output:\t"
   echo "$line" | perl -CSDA -Mutf8 -e ' while(<STDIN>){$_ =~ s/($ARGV[0])/$ARGV[1]$1/g; print $_;}' "((?<!$ssSymbol)[$myConsonant](?![$aThat$ssSymbol])|[$enChar$otherChar])" $sepOption

else

#Perl one line parameter Info:
#-e execute, -Mutf8 load utf8 module,
#-C perl unicode features: S is for STDIN+STDOUT+STDERR,
#D is for streams STDIN+STDOUT and A is for the @ARGV elements are expected to be strings encoded

   echo "$line" | perl -CSDA -Mutf8 -e ' while(<STDIN>){$_ =~ s/($ARGV[0])/$ARGV[1]$1/g; print $_;}' "((?<!$ssSymbol)[$myConsonant](?![$aThat$ssSymbol])|[$enChar$otherChar])" $sepOption

fi
done < "${iOption:-/dev/stdin}" #filename from command line argument or STDIN


