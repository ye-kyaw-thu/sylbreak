<?php

namespace YeKyawThu\Sylbreak\Tests;
use PHPUnit\Framework\TestCase;
use YeKyawThu\Sylbreak\Sylbreak;
final class UhrdTest extends TestCase
{
    public function testUhrd()
    {
        $expected = include('../src/Config/pangram.php');
        $result = Sylbreak::uhrd();
        return $this->assertSame($expected, $result);
    }
}