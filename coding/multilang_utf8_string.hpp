#pragma once

#include "varint.hpp"

#include "../base/assert.hpp"

#include "../std/string.hpp"


namespace utils
{
  template <class TSink> void WriteString(TSink & sink, string const & s)
  {
    CHECK(!s.empty(), ());

    size_t const sz = s.size();
    WriteVarUint(sink, static_cast<uint32_t>(sz-1));
    sink.Write(s.c_str(), sz);
  }

  template <class TSource> void ReadString(TSource & src, string & s)
  {
    uint32_t const sz = ReadVarUint<uint32_t>(src) + 1;
    s.resize(sz);
    src.Read(&s[0], sz);

    CHECK(!s.empty(), ());
  }
}

class StringUtf8Multilang
{
  string m_s;

  size_t GetNextIndex(size_t i) const;
  static char GetLangIndex(string const & lang);

  static char m_priorities[64];

public:
  inline bool operator== (StringUtf8Multilang const & rhs) const
  {
    return m_s == rhs.m_s;
  }

  inline void Clear() { m_s.clear(); }
  inline bool IsEmpty() const { return m_s.empty(); }

  void AddString(char lang, string const & utf8s);
  void AddString(string const & lang, string const & utf8s)
  {
    char const l = GetLangIndex(lang);
    if (l >= 0)
      AddString(l, utf8s);
  }

  static void SetPreferableLanguages(vector<string> const & langCodes);
  /// Takes language priorities into an account
  void GetPreferableString(string & utf8s) const;
  bool GetString(char lang, string & utf8s) const;
  bool GetString(string const & lang, string & utf8s) const
  {
    char const l = GetLangIndex(lang);
    if (l >= 0)
      return GetString(l, utf8s);
    else
      return false;
  }

  template <class TSink> void Write(TSink & sink) const
  {
    utils::WriteString(sink, m_s);
  }

  template <class TSource> void Read(TSource & src)
  {
    utils::ReadString(src, m_s);
  }
};
