<?php
namespace YeKyawThu\Sylbreak;

class Sylbreak {
    //public static function break($replacement, $string){
    public static function break(){
        $string = 'သီဟိုဠ်မှ ဉာဏ်ကြီးရှင်သည် အာယုဝဍ္ဎနဆေးညွှန်းစာကို ဇလွန်ဈေးဘေး ဗာဒံပင်ထက် အဓိဋ္ဌာန်လျက် ဂဃနဏဖတ်ခဲ့သည်။';
        // $string = include('../Config/Pangram.php');
        $pattern = "/(?:(?<!\x{1039})([\\x{1000}-\\x{102A}\\x{103F}\\x{104A}-\\x{104F}]|[\\x{1040}-\\x{1049}]+|[^\\x{1000}-\\x{104F}]+)(?![\\x{103E}\\x{103B}]?[\\x{1039}\\x{103A}\\x{1037}]))/uim";
        // $string = include('../Config/Pattern.php');
        $replacement = '|$1';
        return preg_replace($pattern, $replacement, $string);
        // Output |သီ|ဟိုဠ်|မှ| |ဉာဏ်|ကြီး|ရှင်|သည်| |အာ|ယု|ဝဍ္ဎ|န|ဆေး|ညွှန်း|စာ|ကို| |ဇ|လွန်|ဈေး|ဘေး| |ဗာ|ဒံ|ပင်|ထက်| |အ|ဓိဋ္ဌာန်|လျက်| |ဂ|ဃ|န|ဏ|ဖတ်|ခဲ့|သည်|။
    }
    public static function pangram(){
        return include('../Config/pangram.php');
    }
    public static function pattern(){
        return include('../Config/pattern.php');
    }
    public static function uhrd(){
        return include('../Config/uhrd.php');
    }

}