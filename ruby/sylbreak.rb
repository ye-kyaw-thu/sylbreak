#!/usr/bin/env ruby
# encoding: utf-8

=begin
Written by Ye Kyaw Thu, Visiting Researcher, Waseda University
HP:https://sites.google.com/site/yekyawthunlp/

last updated: 3 June 2023
=end

require 'optparse'

# Define default options
options = {
  output: 'sylbreak_out.txt',
  separator: '|',
  print: false
}

# Parse command line arguments
OptionParser.new do |opts|
  opts.banner = 'Usage: sylbreak.rb [options]'

  opts.on('-i', '--input FILE', 'Input file') { |v| options[:input] = v }
  opts.on('-o', '--output [FILE]', 'Output file (default: sylbreak_out.txt)') { |v| options[:output] = v }
  opts.on('-s', '--separator [SEPARATOR]', 'Separator for syllable (default: |)') { |v| options[:separator] = v }
  opts.on('-p', '--print', 'Print both input and syllable segmented sentences') { |v| options[:print] = true }
end.parse!

my_consonant = "က-အ"
en_char = 'a-zA-Z0-9'
other_char = "ဣဤဥဦဧဩဪဿ၌၍၏၀-၉၊။!-/:-@[-`{-~\\s"
ss_symbol = '္'
a_that = '်'

# Escaping all special characters before putting into regular expression
my_consonant = Regexp.escape(my_consonant)
en_char = Regexp.escape(en_char)
other_char = Regexp.escape(other_char)
ss_symbol = Regexp.escape(ss_symbol)
a_that = Regexp.escape(a_that)

# Regular expression pattern for Myanmar syllable breaking
pattern = Regexp.new("((?<!#{ss_symbol})[#{my_consonant}](?!#{a_that}#{ss_symbol})|[#{en_char}#{other_char}])")

File.open(options[:output], 'w', encoding: 'UTF-8') do |out_file|
  File.foreach(options[:input], encoding: 'UTF-8') do |line|
    line.strip!
    puts "input: #{line}" if options[:print]

    line.gsub!(pattern) { |match| options[:separator] + match }
    out_file.puts line

    puts "output: #{line}" if options[:print]
  end
end
