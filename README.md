# sylbreak
Syllable segmenation is an important preprocess for many natural language processing (NLP) such as romanization, transliteration and graphame-to-phoneme (g2p) conversion.

"sylbreak" is a syllable segmentation tool for Myanmar language (Burmese) text encoded with unicode.
I used only one line of regular expression (RE) as follow:
```perl
$line =~ s/((?<!$ssSymbol)[$myConsonant](?![$aThat$ssSymbol])|[$enChar$otherChar])/$sep$1/g;
```
(a consonant not after a subscript symbol AND a consonant is not followed by a-That character or a subscript symbol)

If you use shell (sylbreak.sh), perl (sylbreak.pl) and python (sylbreak.py) scripts, no need to make installation.
I plan to add sylbreak for some more programming languages such as C++, Ruby in the near future.

Enjoy syllable breaking!

Ye@Lab
