#!/usr/bin/perl

## syllable breaking tool for Myanmar language
## usage: ./sylbreak.pl <-i filename>  [-s separator] [-p {0} or 1]
## e.g. usage1: ./sylbreak.pl -i ../data/my-input
##      usage2: cat ../data/my-input2 | ./sylbreak.pl
##      usage3: ./sylbreak.pl -i ../data/my-input -s "/" -p=1
##
## last updated: 22 July 2016
## added space cleaning parts: 23 May 2022
## Author: Ye Kyaw Thu, Visiting Researcher, Waseda University
## HP:https://sites.google.com/site/yekyawthunlp/

## Reference of Myanmar Unicode: http://unicode.org/charts/PDF/U1000.pdf

use strict;
use warnings;
use utf8;
use Getopt::Long qw(GetOptions);

binmode STDIN, ":encoding(UTF-8)";
binmode STDOUT, ":encoding(UTF-8)";

my $iOption; #input filename
my $sOption; my $sep = "\|"; #separator
my $pOption; my $printInput = 0; #default value false for print option
my $fh;

GetOptions(
   'help|h|?' => \&help,
   'input-file|i=s' => \$iOption,
   'separator|s=s' => \$sOption,
   'print|p=i' => \$pOption,
) or die "Usage: ./syl-RE-break.pl <-i filename>  [-s separator] [-p {0} or 1]\n";


if ($iOption)
{
  open($fh, '<:encoding(UTF-8)', $iOption) or die "Could not open file '$iOption $!";
}elsif (!defined $iOption )
{
  $fh = *STDIN;
}
else
{
   help();
}


my $myConsonant = "က-အ";
my $enChar = "a-zA-Z0-9";
my $otherChar = "ဣဤဥဦဧဩဪဿ၌၍၏၀-၉၊။!-\/:-\@\[-`{-~\\s";
my $ssSymbol = "္";
my $aThat = "်";


$sep = $sOption if defined ($sOption);
$printInput = $pOption if defined ($pOption);

sub help 
{
    print "Usage: ./syl-RE-break.pl <-i filename>  [-s separator] [-p {0} or 1]\n";
    exit(0);
}


while (my $line = <$fh>)
{
   chomp $line;
   if ($printInput == 0)
   {
      
      #Regular expression pattern for Myanmar syllable breaking
      #*** a consonant not after a subscript symbol AND a consonant is not followed by a-That character or a subscript symbol
      $line =~ s/((?<!$ssSymbol)[$myConsonant](?![$aThat$ssSymbol])|[$enChar$otherChar])/$sep$1/g;
      $line =~ s/^\s+|\s+$//g;
      $line =~ s/ +/ /g;      
      print "$line\n";
   }elsif ($printInput == 1)
   {
      print "input: $line\n";
      $line =~ s/((?<!$ssSymbol)[$myConsonant](?![$aThat$ssSymbol])|[$enChar$otherChar])/$sep$1/g;
      $line =~ s/^\s+|\s+$//g;
      $line =~ s/ +/ /g;      
      print "output: $line\n";
   }

}

close($fh); 
