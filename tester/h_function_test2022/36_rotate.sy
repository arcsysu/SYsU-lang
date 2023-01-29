const int MAX_WIDTH = 1024, MAX_HEIGHT = 1024;
int image[MAX_WIDTH * MAX_HEIGHT], width, height;

const float PI = 3.14159265359, TWO_PI = 6.28318530718, EPSILON = 1e-6;

float my_fabs(float x) {
  if (x > 0) return x;
  return -x;
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

int read_image() {
  if (getch() != 80 || getch() != 50) return -1;
  width = getint();
  height = getint();
  if (width > MAX_WIDTH || height > MAX_HEIGHT || getint() != 255) return -1;
  int y = 0;
  while (y < height) {
    int x = 0;
    while (x < width) {
      image[y * width + x] = getint();
      x = x + 1;
    }
    y = y + 1;
  }
  return 0;
}

int rotate(int x, int y, float rad) {
  float sinma = my_sin(rad), cosma = my_cos(rad);
  int hwidth = width / 2, hheight = height / 2;
  int xt = x - hwidth, yt = y - hheight;
  int src_x = xt * cosma - yt * sinma + hwidth,
      src_y = xt * sinma + yt * cosma + hheight;
  if (src_x < 0 || src_x >= width || src_y < 0 || src_y >= height) return 0;
  return image[src_y * width + src_x];
}

void write_pgm(float rad) {
  putch(80); putch(50); putch(10); // P2
  putint(width); putch(32); putint(height); putch(32); // width height
  putint(255); putch(10); // 255
  int y = 0;
  while (y < height) {
    int x = 0;
    while (x < width) {
      putint(rotate(x, y, rad));
      putch(32);
      x = x + 1;
    }
    putch(10);
    y = y + 1;
  }
}

int main() {
  float rad = getfloat();
  getch();
  if (read_image() < 0) return -1;
  write_pgm(rad);
  return 0;
}
