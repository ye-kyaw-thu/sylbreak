<?php

namespace YeKyawThu\Sylbreak\Tests;

use PHPUnit\Framework\TestCase;
use YeKyawThu\Sylbreak\Sylbreak;
final class BreakTest extends TestCase
{
    public function testBreak()
    {
        $expected = '|သီ|ဟိုဠ်|မှ| |ဉာဏ်|ကြီး|ရှင်|သည်| |အာ|ယု|ဝဍ္ဎ|န|ဆေး|ညွှန်း|စာ|ကို| |ဇ|လွန်|ဈေး|ဘေး| |ဗာ|ဒံ|ပင်|ထက်| |အ|ဓိဋ္ဌာန်|လျက်| |ဂ|ဃ|န|ဏ|ဖတ်|ခဲ့|သည်|။';
        $result = Sylbreak::break();
        return $this->assertSame($expected, $result);
    }
}