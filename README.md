# sylbreak
[Myanmar language (Burmese) README](https://github.com/ye-kyaw-thu/sylbreak/blob/master/README-Myanmar.md)

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
my $otherChar = "ဣဤဥဦဧဩဪဿ၌၍၏၀-၉၊။!-\/:-\@\[-`{-~\\s";
my $ssSymbol = "္";
my $aThat = "်";
```
If you use shell (sylbreak.sh), perl (sylbreak.pl) and python (sylbreak.py) scripts, no need to make installation.
I plan to update/code *sylbreak* with some more programming languages such as C++, Ruby in the near future.

Enjoy syllable breaking!

Ye@Lab

### Acknowledgement
Thanks to [Swan Htet Aung](https://github.com/swanhtet1992) who informed my typo mistake of $otherChar ... ဥဥ ---> ဥဦ  
sylbreak RE example programs for Java and Java Script was written by [Chan Mrate Ko Ko](https://github.com/ye-kyaw-thu/sylbreak/commits?author=chanmratekoko).

### Reference

1. Dr. Thein Tun, Acoustic Phonetics and The Phonology of the Myanmar Language
2. Romanization: https://en.wikipedia.org/wiki/Romanization
3. Myanmar Unicode: http://unicode.org/charts/PDF/U1000.pdf
4. Syllable segmentation algorithm of Myanmar text: http://gii2.nagaokaut.ac.jp/gii/media/share/20080901-ZMM%20Presentation.pdf
5. Zin Maung Maung and Yoshiki Makami,"A rule-based syllable segmentation of Myanmar Text", in Proceeding of the IJCNLP-08 workshop of NLP for Less Privileged Language, January, 2008, Hyderabad, India, pp. 51-58. [Paper](https://github.com/ye-kyaw-thu/sylbreak/blob/master/reference/I08-3010.pdf)
6. Tin Htay Hlaing, "Manually constructed context-free grammar for Myanmar syllable structure", in Proceedings of the Student Research Workshop at the 13th Conference of the European Chapter of the Association for Computational Linguistics (EACL '12), Association for Computational Linguistics, Stroudsburg, PA, USA, pp. 32-37. [Paper](https://github.com/ye-kyaw-thu/sylbreak/blob/master/reference/E12-3004.pdf)
7. Ye Kyaw Thu, Andrew Finch, Yoshinori Sagisaka and Eiichiro Sumita, "A Study of Myanmar Word Segmentation Schemes for Statistical Machine Translation", in Proceedings of the 11th International Conference on Computer Applications (ICCA 2013), February 26~27, 2013, Yangon, Myanmar, pp. 167-179. [Paper](https://github.com/ye-kyaw-thu/sylbreak/blob/master/reference/my2Others-CameraReady.pdf)
8. Ye Kyaw Thu, Andrew Finch, Win Pa Pa, and Eiichiro Sumita, "A Large-scale Study of Statistical Machine Translation Methods for Myanmar Language", in Proceedings of SNLP2016, February 10-12, 2016, Phranakhon Si Ayutthaya, Thailand. [Paper](https://github.com/ye-kyaw-thu/sylbreak/blob/master/reference/SNLP-3-A%20Large-scale%20Study%20of%20Statistical%20Machine%20Translation%20Methods%20for%20Myanmar%20Language.pdf)
8. Regular Expression: https://en.wikipedia.org/wiki/Regular_expression
