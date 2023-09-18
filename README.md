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

<img src="https://github.com/ye-kyaw-thu/sylbreak/blob/master/visualization-of-sylBreak-RE.png" alt="Visualization of sylbreak RE" width="812x180"/>
<p align="center"> Fig. Visualization of sylbreak RE </p>  

If you use shell (sylbreak.sh), perl (sylbreak.pl) and python (sylbreak.py) scripts, no need to make installation.

Enjoy syllable breaking!

Ye@Lab

### Demo/Explanation

In the paper titled "[An Algorithm for Myanmar Syllable Segmentation based on the Official Standard Myanmar Unicode Text](https://ieeexplore.ieee.org/document/10181391)" presented at the ICCA-2023 conference, the authors make the following statement in Section VI, Performance Evaluation:  

*Furthermore, we compared the correctness of our algorithm with an existing algorithm, sylbreak3. As stated in Section II, the drawback of the sylbreak3 algorithm is that it cannot correctly segment syllables that contain consonants, ‘်’ and ‘့’. To evaluate this, we tested another set of 165 common syllables in 8 random Myanmar sentences shown Table IX. The results obtained should be seen in the Table X.*  

*According to this experiment, it can be clearly seen that the sylbreak3 algorithm can correctly segment all Myanmar syllables including Parli and digits but it fails in detecting the boundary of syllables composed of  ‘်’ and ‘့’.*

The statement that "sylbreak fails in detecting the boundary of syllables that composed of   ‘်’ and ‘့ ’" is wrong. When I read their paper carefully, I found that the test data is not correctly typed according to the Unicode typing of the Myanmar language. In details, they typed Auk-ka-myit ("့") and then A-that ("်") instead of A-that ("်") and then Auk-ka-myit ("့") order. I assumed they got wrong segmentation results because of this. Actually, sylbreak tool is working well if the user provided the Myanmar text that typed correct order based on the Unicode standard. 

Here is the video file that I explained well by comparing the example words from their paper. Though I explained in Myanmar language, hope everyone can follow my explanation.

Video Link: [https://vimeo.com/864665740?share=copy](https://vimeo.com/864665740?share=copy)

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
9. Regular Expression: https://en.wikipedia.org/wiki/Regular_expression
10. DebuggexBeter: https://www.debuggex.com/  
