// reference: https://zhuanlan.zhihu.com/p/20085048

const float e = 2.718281828459045;

float my_fabs(float x) {
  if (x > 0) return x;
  return -x;
}

float my_pow(float a, int n) {
  if (n < 0) return 1 / my_pow(a, -n);
  float res = 1.0;
  while (n) {
    if (n % 2) res = res * a;
    a = a * a;
    n = n / 2;
  }
  return res;
}

float my_sqrt(float x) {
  if (x > 100) return 10.0 * my_sqrt(x / 100);
  float t = x / 8 + 0.5 + 2 * x / (4 + x);
  int c = 10;
  while (c) {
    t = (t + x / t) / 2;
    c = c - 1;
  }
  return t;
}

float F1(float x) { return 1 / x; }

float F2(float x) { return 1 / my_sqrt(1 - x * x); }

float simpson(float a, float b, int flag) {
  float c = a + (b - a) / 2;
  if (flag == 1) return (F1(a) + 4 * F1(c) + F1(b)) * (b - a) / 6;
  if (flag == 2) return (F2(a) + 4 * F2(c) + F2(b)) * (b - a) / 6;
  return 0;
}

float asr5(float a, float b, float eps, float A, int flag) {
  float c = a + (b - a) / 2;
  float L = simpson(a, c, flag), R = simpson(c, b, flag);
  if (my_fabs(L + R - A) <= 15 * eps) return L + R + (L + R - A) / 15.0;
  return asr5(a, c, eps / 2, L, flag) + asr5(c, b, eps / 2, R, flag);
}

float asr4(float a, float b, float eps, int flag) {
  return asr5(a, b, eps, simpson(a, b, flag), flag);
}

float eee(float x) {
  if (x > 1e-3) {
    float ee = eee(x / 2);
    return ee * ee;
  }
  return 1 + x + x * x / 2 + my_pow(x, 3) / 6 + my_pow(x, 4) / 24 +
         my_pow(x, 5) / 120;
}

float my_exp(float x) {
  if (x < 0) return 1 / my_exp(-x);
  int n = x;
  x = x - n;
  float e1 = my_pow(e, n);
  float e2 = eee(x);
  return e1 * e2;
}

float my_ln(float x) { return asr4(1, x, 1e-8, 1); }

float my_log(float a, float N) { return my_ln(N) / my_ln(a); }

float my_powf(float a, float x) { return my_exp(x * my_ln(a)); }

int main() {
  int num = getint();
  while (num) {
    float x = getfloat(), y = getfloat();
    putfloat(my_fabs(x));
    putch(32);
    putfloat(my_pow(x, 2));
    putch(32);
    putfloat(my_sqrt(x));
    putch(32);
    putfloat(my_exp(x));
    putch(32);
    if (x > 0) {
      putfloat(my_ln(x));
    } else {
      putch(45);
    }
    putch(32);
    if (x > 0 && y > 0) {
      putfloat(my_log(x, y));
    } else {
      putch(45);
    }
    putch(32);
    if (x > 0) {
      putfloat(my_powf(x, y));
    } else {
      putch(45);
    }
    putch(10);
    num = num - 1;
  }
  return 0;
}
