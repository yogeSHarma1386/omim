#pragma once

#include "../std/vector.hpp"
#include "../std/string.hpp"
#include "../std/utility.hpp"

namespace languages
{
  typedef vector<pair<string, string> > CodesAndNamesT;
  typedef vector<string> CodesT;

  void GetCurrentSettings(CodesT & outLangCodes);
  void GetCurrentSettings(CodesAndNamesT & outLanguages);
  void SaveSettings(CodesT const & langs);
  /// @return true if loaded default lang list which was used
  /// for name:<lang> in features during world data generation
  bool GetSupportedLanguages(CodesAndNamesT & outLanguages);
}
