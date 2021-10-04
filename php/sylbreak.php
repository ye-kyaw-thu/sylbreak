<?php
/**
 * @author Phyo Zaw Tun
 */
$string = 'သီဟိုဠ်မှ ဉာဏ်ကြီးရှင်သည် အာယုဝဍ္ဎနဆေးညွှန်းစာကို ဇလွန်ဈေးဘေး ဗာဒံပင်ထက် အဓိဋ္ဌာန်လျက် ဂဃနဏဖတ်ခဲ့သည်။';
$pattern = "/(?:(?<!\x{1039})([\\x{1000}-\\x{102A}\\x{103F}\\x{104A}-\\x{104F}]|[\\x{1040}-\\x{1049}]+|[^\\x{1000}-\\x{104F}]+)(?![\\x{103E}\\x{103B}]?[\\x{1039}\\x{103A}\\x{1037}]))/uim";
$replacement = '|$1';
echo preg_replace($pattern, $replacement, $string);
//Output |သီ|ဟိုဠ်|မှ| |ဉာဏ်|ကြီး|ရှင်|သည်| |အာ|ယု|ဝဍ္ဎ|န|ဆေး|ညွှန်း|စာ|ကို| |ဇ|လွန်|ဈေး|ဘေး| |ဗာ|ဒံ|ပင်|ထက်| |အ|ဓိဋ္ဌာန်|လျက်| |ဂ|ဃ|န|ဏ|ဖတ်|ခဲ့|သည်|။
?>