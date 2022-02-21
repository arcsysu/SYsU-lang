#include "sylib.h"
#include <stdarg.h>
#include <stdio.h>
#include <sys/time.h>

/* Timing function implementation */
static struct timeval _sysy_start, _sysy_end;
static int _sysy_l1[_SYSY_N], _sysy_l2[_SYSY_N];
static int _sysy_h[_SYSY_N], _sysy_m[_SYSY_N], _sysy_s[_SYSY_N],
    _sysy_us[_SYSY_N];
static int _sysy_idx = 1;

static void __attribute__((constructor)) before_main() {
  for (int i = 0; i < _SYSY_N; i++)
    _sysy_h[i] = _sysy_m[i] = _sysy_s[i] = _sysy_us[i] = 0;
  _sysy_idx = 1;
}
static void __attribute__((destructor)) after_main() {
  for (int i = 1; i < _sysy_idx; i++) {
    fprintf(stderr, "Timer@%04d-%04d: %dH-%dM-%dS-%dus\n", _sysy_l1[i],
            _sysy_l2[i], _sysy_h[i], _sysy_m[i], _sysy_s[i], _sysy_us[i]);
    _sysy_us[0] += _sysy_us[i];
    _sysy_s[0] += _sysy_s[i];
    _sysy_us[0] %= 1000000;
    _sysy_m[0] += _sysy_m[i];
    _sysy_s[0] %= 60;
    _sysy_h[0] += _sysy_h[i];
    _sysy_m[0] %= 60;
  }
  fprintf(stderr, "TOTAL: %dH-%dM-%dS-%dus\n", _sysy_h[0], _sysy_m[0],
          _sysy_s[0], _sysy_us[0]);
}

#ifdef __cplusplus
extern "C" {
#endif

/* Input & output functions */
int getint() {
  int t;
  scanf("%d", &t);
  return t;
}
int getch() {
  char c;
  scanf("%c", &c);
  return (int)c;
}
int getarray(int a[]) {
  int n;
  scanf("%d", &n);
  for (int i = 0; i < n; i++)
    scanf("%d", &a[i]);
  return n;
}
void putint(int a) { printf("%d", a); }
void putch(int a) { printf("%c", a); }
void putarray(int n, int a[]) {
  printf("%d:", n);
  for (int i = 0; i < n; i++)
    printf(" %d", a[i]);
  printf("\n");
}

void _sysy_starttime(int lineno) {
  _sysy_l1[_sysy_idx] = lineno;
  gettimeofday(&_sysy_start, NULL);
}
void _sysy_stoptime(int lineno) {
  gettimeofday(&_sysy_end, NULL);
  _sysy_l2[_sysy_idx] = lineno;
  _sysy_us[_sysy_idx] += 1000000 * (_sysy_end.tv_sec - _sysy_start.tv_sec) +
                         _sysy_end.tv_usec - _sysy_start.tv_usec;
  _sysy_s[_sysy_idx] += _sysy_us[_sysy_idx] / 1000000;
  _sysy_us[_sysy_idx] %= 1000000;
  _sysy_m[_sysy_idx] += _sysy_s[_sysy_idx] / 60;
  _sysy_s[_sysy_idx] %= 60;
  _sysy_h[_sysy_idx] += _sysy_m[_sysy_idx] / 60;
  _sysy_m[_sysy_idx] %= 60;
  _sysy_idx++;
}

#ifdef __cplusplus
}
#endif