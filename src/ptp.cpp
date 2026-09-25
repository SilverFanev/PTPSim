#include <stdlib.h>

#include <Ptp.hh>
#include <RAT/AnyParse.hh>
#include <iostream>
#include <string>
#include <exception>

int main(int argc, char** argv) {
  try {
    auto parser = new RAT::AnyParse(argc, argv);
    std::cout << "Ptp version: " << RAT::PTPVERSION << std::endl;
    auto ptp = PTP::Ptp(parser, argc, argv);
    ptp.Begin();
    ptp.Report();
  } catch (const std::exception& e) {
    std::cerr << "\n========================================" << std::endl;
    std::cerr << "MESSAGE SECRET DE RAT-PAC :" << std::endl;
    std::cerr << e.what() << std::endl;
    std::cerr << "========================================\n" << std::endl;
    return 1;
  }
}
