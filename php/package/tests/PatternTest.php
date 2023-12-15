<?php

namespace YeKyawThu\Sylbreak\Tests;
use PHPUnit\Framework\TestCase;
use YeKyawThu\Sylbreak\Sylbreak;
final class PatternTest extends TestCase
{
    public function testPattern()
    {
        $expected = include('../src/Config/pangram.php');
        $result = Sylbreak::pattern();
        return $this->assertSame($expected, $result);
    }
}