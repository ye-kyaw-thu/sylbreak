# sylbreak
Syllable segmenation is an important preprocess for many natural language processing (NLP) such as romanization, transliteration and graphame-to-phoneme (g2p) conversion.

"sylbreak" is a syllable segmentation tool for Myanmar language (Burmese) text encoded with Unicode (e.g. Myanmar3, Padauk).
I used only one short line of regular expression (RE) as follow:
```perl
$line =~ s/((?<!$ssSymbol)[$myConsonant](?![$aThat$ssSymbol])|[$enChar$otherChar])/$sep$1/g;
```
Here, the point is (a consonant not after a subscript symbol AND not followed by a-That character or a subscript symbol)

Here, variables are declared as follows:

```perl
my $myConsonant = "က-အ";
my $enChar = "a-zA-Z0-9";
my $otherChar = "ဣဤဥဥဧဩဪဿ၌၍၏၀-၉၊။!-\/:-\@\[-`{-~\\s";
my $ssSymbol = "္";
my $aThat = "်";
```
If you use shell (sylbreak.sh), perl (sylbreak.pl) and python (sylbreak.py) scripts, no need to make installation.
I plan to update/code *sylbreak* with some more programming languages such as C++, Ruby in the near future.

Enjoy syllable breaking!

Ye@Lab

### Reference

1. Dr. Thein Tun, Acoustic Phonetics and The Phonology of the Myanmar Language
2. Romanization: https://en.wikipedia.org/wiki/Romanization
3. Myanmar Unicode: http://unicode.org/charts/PDF/U1000.pdf
4. Syllable segmentation algorithm of Myanmar text: http://gii2.nagaokaut.ac.jp/gii/media/share/20080901-ZMM%20Presentation.pdf
5. Ye Kyaw Thu, Andrew Finch, Yoshinori Sagisaka and Eiichiro Sumita, "A Study of Myanmar Word Segmentation Schemes for Statistical Machine Translation", Proceedings of the 11th International Conference on Computer Applications (ICCA 2013), February 26~27, 2013, Yangon, Myanmar, pp. 167-179. [Paper](https://docs.google.com/viewer?a=v&pid=sites&srcid=ZGVmYXVsdGRvbWFpbnx5ZWt5YXd0aHVubHB8Z3g6MTc0MjUwZjY3MzljMGYzZQ)
6. Regular Expression: https://en.wikipedia.org/wiki/Regular_expression
