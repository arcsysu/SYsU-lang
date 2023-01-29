int i[1], k[1];

void inc_impl(int x[], int rec) {
  if (rec == 0) {
    x[0] = x[0] + 1;
  } else {
    x[0] = x[0] * 2;
    inc_impl(x, rec - 1);
  }
}

void inc(int x[]) {
  inc_impl(x, k[0]);
}

void add_impl(int x[], int y[], int rec) {
  if (rec == 0) {
    x[0] = x[0] + y[0];
  } else {
    x[0] = x[0] * 2;
    add_impl(x, y, rec - 1);
  }
}

void add(int x[], int y[]) {
  add_impl(x, y, k[0]);
}

void sub_impl(int x[], int y[], int rec) {
  if (rec == 0) {
    x[0] = x[0] - y[0];
  } else {
    x[0] = x[0] * 2;
    sub_impl(x, y, rec - 1);
  }
}

void sub(int x[], int y[]) {
  sub_impl(x, y, k[0]);
}

int main() {
  int j[1], y[1], z[1][2] = {-1};
  k[0] = getint();
  y[0] = getint();
  getarray(z[0]);
  while (y[0]) {
    j[0] = z[0][0];
    while (j[0] < 5) {
      putint(i[0]);
      putint(j[0]);
      putint(y[0]);
      putint(z[0][0]);
      add(z[0], y);
      add(j, y);
      sub(z[0], y);
    }
    inc(i);
    add(i, z[0]);
    if (i[0] == z[0][1]) break;
  }
  putch(10);
  return 0;
}
