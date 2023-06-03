#include <iostream>
#include <fstream>
#include <string>
#include <boost/program_options.hpp>
#include <boost/regex/icu.hpp>

/*
Written by Ye Kyaw Thu, Visiting Researcher, Waseda University
HP:https://sites.google.com/site/yekyawthunlp/

last updated: 3 June 2023

## FYI

You need to install some libraries if you don't have:

sudo apt-get update
sudo apt install build-essential

sudo apt install libboost-all-dev
dpkg -s libboost-dev | grep 'Version'

sudo apt-get install -y libicu-dev

Compilation:
g++ -std=c++11 -o sylbreak sylbreak.cpp -lboost_program_options -lboost_regex -licuuc -licui18n -licudata

Example Runnings:
./sylbreak --help

./sylbreak -i ./input.txt
(for the Syllable segmented result, check the sylbreak_out.txt file)

./sylbreak -i input.txt -o output.txt -s "/" -p 1

*/

namespace po = boost::program_options;

int main(int argc, char *argv[]) {
    try {
        std::string inputFile, outputFile, separator;
        bool printOption;

        po::options_description desc("Allowed options");
        desc.add_options()
            ("help,h", "produce help message")
            ("input,i", po::value<std::string>(&inputFile)->required(), "input file")
            ("output,o", po::value<std::string>(&outputFile)->default_value("sylbreak_out.txt"), "output file")
            ("separator,s", po::value<std::string>(&separator)->default_value("|"), "the separator option for syllable")
            ("print,p", po::value<bool>(&printOption)->default_value(false), "printing both input and syllable segmented sentences");

        po::variables_map vm;
        po::store(po::parse_command_line(argc, argv, desc), vm);

        if (vm.count("help")) {
            std::cout << desc << "\n";
            return 1;
        }

        po::notify(vm);

        std::ifstream inFile(inputFile.c_str(), std::ios::in);
        if (!inFile) {
            std::cout << "Cannot open input file: " << inputFile << std::endl;
            return 1;
        }

        std::ofstream outFile(outputFile.c_str(), std::ios::out);
        if (!outFile) {
            std::cout << "Cannot open output file: " << outputFile << std::endl;
            return 1;
        }

        std::string myConsonant = u8"က-အ";
        std::string enChar = "a-zA-Z0-9";
        std::string otherChar = u8"ဣဤဥဦဧဩဪဿ၌၍၏၀-၉၊။!-/:@[-`{-~\\s";
        std::string ssSymbol = u8"္";
        std::string aThat = u8"်";

        std::string breakPattern = "(?<!"+ssSymbol+")["+myConsonant+"](?!["+aThat+ssSymbol+"])|["+enChar+otherChar+"]";

        boost::u32regex re = boost::make_u32regex(breakPattern);

        std::string line;
        while (std::getline(inFile, line)) {
            line.erase(std::remove_if(line.begin(), line.end(), ::isspace), line.end());

            if (printOption) {
                std::cout << "input: " << line << std::endl;
            }

            std::string result = boost::u32regex_replace(line, re, separator+"$&");

            outFile << result << std::endl;

            if (printOption) {
                std::cout << "output: " << result << std::endl;
            }
        }

        inFile.close();
        outFile.close();

    } catch(std::exception& e) {
        std::cerr << "error: " << e.what() << "\n";
        return 1;
    } catch(...) {
        std::cerr << "Exception of unknown type!\n";
    }

    return 0;
}

