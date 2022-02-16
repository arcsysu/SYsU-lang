int sheet1[500][500] = {};
int sheet2[500][500] = {};
int active = 1;
int width;
int height;
int steps;

void read_map() {
  width = getint();
  height = getint();
  // width <= 498, height <= 498
  steps = getint();
  getch();

  int i = 1;
  int j = 1;

  while (j <= height) {
    i = 1;
    while (i <= width) {
      int get = getch();
      if (get == 35) {
        sheet1[j][i] = 1;
      } else {
        sheet1[j][i] = 0;
      }
      i = i + 1;
    }
    // line feed
    getch();
    j = j + 1;
  }
}

void put_map() {
  int i = 1;
  int j = 1;

  while (j <= height) {
    i = 1;
    while (i <= width) {
      if (sheet1[j][i] == 1) {
        putch(35);
      } else {
        putch(46);
      }
      i = i + 1;
    }
    // line feed
    putch(10);
    j = j + 1;
  }
}

void swap12() {
  int i = 1;
  int j = 1;

  while (j <= height) {
    i = 1;
    while (i <= width) {
      sheet1[j][i] = sheet2[j][i];
      i = i + 1;
    }
    j = j + 1;
  }
}

void step(int source[][500], int target[][500]) {
  int i = 1;
  int j = 1;

  while (j <= height) {
    i = 1;
    while (i <= width) {
      int alive_count = source[j - 1][i - 1] + source[j - 1][i] +
                        source[j - 1][i + 1] + source[j][i - 1] +
                        source[j][i + 1] + source[j + 1][i - 1] +
                        source[j + 1][i] + source[j + 1][i + 1];
      if (source[j][i] == 1 && alive_count == 2 ) {
        target[j][i] = 1;
      } else if (alive_count == 3) {
        target[j][i] = 1;
      } else {
        target[j][i] = 0;
      }
      i = i + 1;
    }
    j = j + 1;
  }
}

int main() {
  read_map();
  starttime();
  while (steps > 0) {
    if (active == 1) {
      step(sheet1, sheet2);
      active = 2;
    } else {
      step(sheet2, sheet1);
      active = 1;
    }
    steps = steps - 1;
  }
  stoptime();
  if (active == 2) {
    swap12();
  }
  put_map();
  return 0;
}
