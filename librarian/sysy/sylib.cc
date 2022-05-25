#define __SYSY 202203L
#define __SYSY_NO_DEFINE
#include "sylib.h"
#include <chrono>
#include <cstdarg>
#include <cstdio>
#include <tuple>
#include <vector>

/* Timing function implementation */
namespace {
struct WuK_Timer {
  using Clock = std::chrono::high_resolution_clock;
  std::vector<std::tuple<int, Clock::time_point>> t1, t2;
  ~WuK_Timer() {
    std::fflush(stdout);
    long long sum_us = 0;
    for (int i = 0; i < t2.size(); ++i) {
      auto us = std::chrono::duration_cast<std::chrono::microseconds>(
                    std::get<1>(t2[i]) - std::get<1>(t1[i]))
                    .count();
      sum_us += us;
      auto s = us / 1000000;
      us %= 1000000;
      auto m = s / 60;
      s %= 60;
      auto h = m / 60;
      m %= 60;
      std::fprintf(stderr, "Timer@%04d-%04d: ", std::get<0>(t1[i]),
                   std::get<0>(t2[i]));
      std::fprintf(stderr, "%dH-%dM-%dS-%dus\n", (int)h, (int)m, (int)s,
                   (int)us);
    }
    auto us = sum_us;
    auto s = us / 1000000;
    us %= 1000000;
    auto m = s / 60;
    s %= 60;
    auto h = m / 60;
    m %= 60;
    std::fprintf(stderr, "TOTAL: ");
    std::fprintf(stderr, "%dH-%dM-%dS-%dus\n", (int)h, (int)m, (int)s, (int)us);
  }
  void start(int lineno) {
    if (t1.size() == t1.capacity()) {
      t1.reserve(t1.size() + (t1.size() >> 1 | 1));
    }
    if (t2.size() == t2.capacity()) {
      t2.reserve(t2.size() + (t2.size() >> 1 | 1));
    }
    t1.emplace_back(lineno, Clock::now());
  }
  void stop(int lineno) { t2.emplace_back(lineno, Clock::now()); }
} wuk_timer;
} // namespace

#ifdef __cplusplus
extern "C" {
#endif
void _sysy_starttime(int lineno) { wuk_timer.start(lineno); }
void _sysy_stoptime(int lineno) { wuk_timer.stop(lineno); }

/* Input & output functions */
int _sysy_getch() {
  char c;
  std::scanf("%c", &c);
  return (int)c;
}
void _sysy_putch(int a) { std::printf("%c", a); }

int _sysy_getint() {
  int t;
  std::scanf("%d", &t);
  return t;
}
void _sysy_putint(int a) { std::printf("%d", a); }

int _sysy_getarray(int a[]) {
  int n = _sysy_getint();
  int i = 0;
  while (i < n) {
    a[i] = _sysy_getint();
    i = i + 1;
  }
  return n;
}
void _sysy_putarray(int n, int a[]) {
  _sysy_putint(n);
  _sysy_putch(":"[0]);
  int i = 0;
  while (i < n) {
    _sysy_putch(" "[0]);
    _sysy_putint(a[i]);
    i = i + 1;
  }
  _sysy_putch("\n"[0]);
}

#if __SYSY >= 202203L

float _sysy_getfloat() {
  float n;
  std::scanf("%a", &n);
  return n;
}
void _sysy_putfloat(float a) { std::printf("%a", a); }

int _sysy_getfarray(float a[]) {
  int n = _sysy_getint();
  int i = 0;
  while (i < n) {
    a[i] = _sysy_getfloat();
    i = i + 1;
  }
  return n;
}
void _sysy_putfarray(int n, float a[]) {
  _sysy_putint(n);
  _sysy_putch(":"[0]);
  int i = 0;
  while (i < n) {
    _sysy_putch(" "[0]);
    _sysy_putfloat(a[i]);
    i = i + 1;
  }
  _sysy_putch("\n"[0]);
}

void _sysy_putf(char a[], ...) {
  std::va_list args;
  va_start(args, a);
  std::vfprintf(stdout, a, args);
  va_end(args);
}

#endif

#ifdef __cplusplus
}
#endif