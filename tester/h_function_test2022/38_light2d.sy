// reference: https://zhuanlan.zhihu.com/p/30748318

const int W = 192, H = 192, N = 24;

const float PI = 3.14159265359, TWO_PI = 6.28318530718;
const int MAX_STEP = 10;
const float MAX_DISTANCE = 2.0;
const float EPSILON = 1e-6;

const int RAND_MAX = 100000007 - 1;
int seed = 0;

int rand() {
  seed = (seed * 19980130 + 23333) % 100000007;
  if (seed < 0) seed = seed + 100000007;
  return seed;
}

float my_fabs(float x) {
  if (x > 0) return x;
  return -x;
}

float my_sqrt(float x) {
  float t = x / 8 + 0.5 + 2 * x / (4 + x);
  int c = 10;
  while (c) {
    t = (t + x / t) / 2;
    c = c - 1;
  }
  return t;
}

float p(float x) { return 3 * x - 4 * x * x * x; }

float my_sin_impl(float x) {
  if (my_fabs(x) <= EPSILON) return x;
  return p(my_sin_impl(x / 3.0));
}

float my_sin(float x) {
  if (x > TWO_PI || x < -TWO_PI) {
    int xx = x / TWO_PI;
    x = x - xx * TWO_PI;
  }
  if (x > PI) x = x - TWO_PI;
  if (x < -PI) x = x + TWO_PI;
  return my_sin_impl(x);
}

float my_cos(float x) { return my_sin(x + PI / 2); }

float circle_sdf(float x, float y, float cx, float cy, float r) {
  float ux = x - cx, uy = y - cy;
  return my_sqrt(ux * ux + uy * uy) - r;
}

void scene(float x, float y, float ret[]) {
  float sd0 = circle_sdf(x, y, 0.4, 0.4, 0.10),
        sd1 = circle_sdf(x, y, 0.6, 0.6, 0.05);
  if (sd0 < sd1) {
    ret[0] = sd0;
    ret[1] = 3.0;
  } else {
    ret[0] = sd1;
    ret[1] = 0.0;
  }
}

float trace(float ox, float oy, float dx, float dy) {
  float t = 0.0;
  int i = 0;
  while (i < MAX_STEP && t < MAX_DISTANCE) {
    float ret[2];
    scene(ox + dx * t, oy + dy * t, ret);
    if (ret[0] < EPSILON) return ret[1];
    t = t + ret[0];
    i = i + 1;
  }
  return 0.0;
}

float sample(float x, float y) {
  float sum = 0.0;
  int i = 0;
  while (i < N) {
    float rnd = rand();
    float a = TWO_PI * (i + rnd / RAND_MAX) / N;
    sum = sum + trace(x, y, my_cos(a), my_sin(a));
    i = i + 1;
  }
  return sum / N;
}

void write_pgm() {
  putch(80); putch(50); putch(10); // P2
  putint(W); putch(32); putint(H); putch(32); putint(255); putch(10); // W H 255
  int y = 0;
  while (y < H) {
    int x = 0;
    while (x < W) {
      float xx = x, yy = y;
      int p = sample(xx / W, yy / H) * 255.0;
      if (p > 255) p = 255;
      putint(p);
      putch(32);
      x = x + 1;
    }
    putch(10);
    y = y + 1;
  }
}

int main() {
  write_pgm();
  return 0;
}
