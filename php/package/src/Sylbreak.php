<?php
namespace YeKyawThu\Sylbreak;

class Sylbreak {
    public static function break($replacement, $string){
        $pattern = self::pattern();
        return (string) preg_replace($pattern, $replacement, $string);
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