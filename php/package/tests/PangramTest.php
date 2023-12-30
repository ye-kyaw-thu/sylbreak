<?php

namespace YeKyawThu\Sylbreak\Tests;

use PHPUnit\Framework\TestCase;
use YeKyawThu\Sylbreak\Sylbreak;
final class PangramTest extends TestCase
{
    public function testPangram()
    {
        $expected = include('../src/Config/pangram.php');
        $result = Sylbreak::pangram();
        return $this->assertSame($expected, $result);
    }
}