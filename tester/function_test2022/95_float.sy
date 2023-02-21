// float global constants
const float RADIUS = 5.5, PI = 03.141592653589793, EPS = 1e-6;

// hexadecimal float constant
const float PI_HEX = 0x1.921fb6p+1, HEX2 = 0x.AP-3;

// float constant evaluation
const float FACT = -.33E+5, EVAL1 = PI * RADIUS * RADIUS, EVAL2 = 2 * PI_HEX * RADIUS, EVAL3 = PI * 2 * RADIUS;

// float constant implicit conversion
const float CONV1 = 233, CONV2 = 0xfff;
const int MAX = 1e9, TWO = 2.9, THREE = 3.2, FIVE = TWO + THREE;

// float -> float function
float float_abs(float x) {
  if (x < 0) return -x;
  return x;
}

// int -> float function & float/int expression
float circle_area(int radius) {
  return (PI * radius * radius + (radius * radius) * PI) / 2;
}

// float -> float -> int function & float/int expression
int float_eq(float a, float b) {
  if (float_abs(a - b) < EPS) {
    return 1 * 2. / 2;
  } else {
    return 0;
  }
}

void error() {
  putch(101);
  putch(114);
  putch(114);
  putch(111);
  putch(114);
  putch(10);
}

void ok() {
  putch(111);
  putch(107);
  putch(10);
}

void assert(int cond) {
  if (!cond) {
    error();
  } else {
    ok();
  }
}

void assert_not(int cond) {
  if (cond) {
    error();
  } else {
    ok();
  }
}

int main() {
  assert_not(float_eq(HEX2, FACT));
  assert_not(float_eq(EVAL1, EVAL2));
  assert(float_eq(EVAL2, EVAL3));
  assert(float_eq(circle_area(RADIUS) /* f->i implicit conversion */,
                  circle_area(FIVE)));
  assert_not(float_eq(CONV1, CONV2) /* i->f implicit conversion */);

  // float conditional expressions
  if (1.5) ok();
  if (!!3.3) ok();
  if (.0 && 3) error();
  if (0 || 0.3) ok();

  // float array & I/O functions
  int i = 1, p = 0;
  float arr[10] = {1., 2};
  int len = getfarray(arr);
  while (i < MAX) {
    float input = getfloat();
    float area = PI * input * input, area_trunc = circle_area(input);
    arr[p] = arr[p] + input;

    putfloat(area);
    putch(32);
    putint(area_trunc); // f->i implicit conversion
    putch(10);

    i = i * - -1e1;
    p = p + 1;
  }
  putfarray(len, arr);
  return 0;
}
