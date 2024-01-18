#!/usr/bin/env python3
# -*- coding:utf-8 -*-

import argparse
import re
import sys

"""
Syllable breaking tool for Myanmar language.

Usage: python sylbreak.py --help
       cat test.txt | python sylbreak.py
       python sylbreak.py --input test.txt
       python ./sylbreak.py --input ./test.txt --print
       python sylbreak.py --input test.txt --output out.txt
       python ./sylbreak.py --input ./one_line.txt --separator " " --output one_line.syl

Date: 21 July 2016
Written by Ye Kyaw Thu, Visiting Researcher, Waseda University
HP: https://sites.google.com/site/yekyawthunlp/

Date: 29 Sep 2021
Add support for python3 by sengkyaut

Last Updated: 19 January 2024.
The code has been rewritten for easier readability. It now includes features for removing the leading delimiter and replacing sequences of 'delimiter-space-delimiter' with a single space.
Updated by Ye Kyaw Thu.

Reference of Myanmar Unicode: http://unicode.org/charts/PDF/U1000.pdf
"""

def parse_arguments():
    """Parse command line arguments for the script."""
    parser = argparse.ArgumentParser(description='Syllable segmentation for Myanmar language')
    parser.add_argument('-i', '--input', type=str, help='Input file (optional)')
    parser.add_argument('-o', '--output', type=str, help='Output file (optional)')
    parser.add_argument('-s', '--separator', type=str, default='|', help='Separator for syllable (e.g. -s "/"), default is "|"')
    parser.add_argument('-p', '--print', action='store_true', help='Print both input and syllable segmented sentences')
    return parser.parse_args()

def create_break_pattern():
    """Creates and returns the regular expression pattern for Myanmar syllable breaking."""
    my_consonant = r"က-အ"
    en_char = r"a-zA-Z0-9"
    other_char = r"ဣဤဥဦဧဩဪဿ၌၍၏၀-၉၊။!-/:-@[-`{-~\s"
    subscript_symbol = r'္'
    a_that = r'်'

    # Regular expression pattern for Myanmar syllable breaking
    return re.compile(
        r"((?<!" + subscript_symbol + r")[" + my_consonant + r"]"
        r"(?!["
        + a_that + subscript_symbol + r"])"
        + r"|[" + en_char + other_char + r"])"
    )

def break_syllables(line, break_pattern, separator):
    """Applies syllable breaking rules to a line."""
    line = re.sub(r'\s+', ' ', line.strip())
    segmented_line = break_pattern.sub(separator + r"\1", line)

    # Remove the leading delimiter if it exists
    if segmented_line.startswith(separator):
        segmented_line = segmented_line[len(separator):]

    # Replace delimiter+space+delimiter with a single space
    double_delimiter = separator + " " + separator
    segmented_line = segmented_line.replace(double_delimiter, " ")

    return segmented_line

def process_input(input_stream, output_stream, separator, print_option):
    """Reads, processes, and writes the syllable segmented data."""
    for line in input_stream:
        if print_option:
            print("Input:\t" + line.strip())
        segmented_line = break_syllables(line, break_pattern, separator)
        output_stream.write(segmented_line + '\n')
        if print_option:
            print("Sylbreaked:\t" + segmented_line)

if __name__ == "__main__":
    args = parse_arguments()
    break_pattern = create_break_pattern()

    input_stream = open(args.input, 'r', encoding='utf-8') if args.input else sys.stdin
    output_stream = open(args.output, 'w', encoding='utf-8') if args.output else sys.stdout

    try:
        process_input(input_stream, output_stream, args.separator, args.print)
    finally:
        if args.input:
            input_stream.close()
        if args.output:
            output_stream.close()
