<?php

namespace YeKyawThu\Sylbreak\Tests;

use PHPUnit\Framework\TestCase;
use YeKyawThu\Sylbreak\Sylbreak;
final class BreakTest extends TestCase
{
    public function testBreak()
    {        
        $replacement = '|$1';
        $string = 'သီဟိုဠ်မှ ဉာဏ်ကြီးရှင်သည် အာယုဝဍ္ဎနဆေးညွှန်းစာကို ဇလွန်ဈေးဘေး ဗာဒံပင်ထက် အဓိဋ္ဌာန်လျက် ဂဃနဏဖတ်ခဲ့သည်။';
        $result = Sylbreak::break($replacement, $string);
        $this->assertIsstring($result);
    }
    public function testPangram()
    {        
        $replacement = '|$1';
        $string = Sylbreak::pangram();
        $result = Sylbreak::break($replacement, $string);
        $this->assertIsstring($result);
    }
    public function testUhrd()
    {        
        $replacement = '|$1';
        $string = Sylbreak::uhrd()['desc'];
        $result = Sylbreak::break($replacement, $string);
        $this->assertIsstring($result);
    }
}