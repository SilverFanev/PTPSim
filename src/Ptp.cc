#include <Ptp.hh>

namespace PTP {

Ptp::Ptp(RAT::AnyParse* parser, int argc, char** argv)
    : Rat(parser, argc, argv) {
  // Append an additional data directory (for ratdb and geo)
  char* ptpdata = getenv("PTPDATA");
  if (ptpdata != NULL) {
    ratdb_directories.insert(static_cast<std::string>(ptpdata) + "/ratdb");
    model_directories.insert(static_cast<std::string>(ptpdata) + "/models");
  }

  // Initialize geometry factories
  new GeoPtpFactory();
  new GeoPTPCoatingFactory();

  // Register generator
  RAT::GlobalFactory<GLG4Gen>::Register(
      "laserball", new RAT::Alloc<GLG4Gen, LaserballGenerator>);
}

void Ptp::Configure() {
  // Let RAT initialize RATDB, environment, command-line options, etc.
  Rat::Configure();

#if TENSORFLOW_Enabled && NLOPT_Enabled
  RAT::ProcBlockManager::AppendProcessor<HitmanProc>();
#endif

  RAT::ProcBlockManager::AppendProcessor<NtupleProc>();
}

}  // namespace PTP