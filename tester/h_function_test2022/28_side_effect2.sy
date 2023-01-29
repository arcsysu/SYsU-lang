int sum = 0;
int array[20];

int f(int i, int j) {
  sum = sum + 1;
  if (i >= j || i >= 20) return 0;
  array[i] = 1;
  if (i == 0) return array[0];
  else return array[i - 1];
}

int g(int i, int j) {
  sum = sum + 2;
  if (i >= j || i >= 20) return 1;
  array[i] = 0;
  if (i == 0) return array[0];
  else return array[i - 1];
}

int h(int i) {
  sum = sum + 3;
  if (i < 0 || i >= 20) return 0;
  return array[i];
}

int main() {
  int i = 0;
  while (i < 20) {
    if (f(0, i) && f(1, i) && f(2, i) && f(3, i) && f(4, i) && f(5, i) &&
        f(6, i) && f(7, i) && f(8, i) && f(9, i) && f(10, i) && f(11, i) &&
        f(12, i) && f(13, i) && f(14, i) && f(15, i) && f(16, i) && f(17, i) &&
        f(18, i) && f(19, i));
    i = i + 1;
  }
  i = 0;
  while (i < 20) {
    if (g(0, i) || g(1, i) || g(2, i) || g(3, i) || g(4, i) || g(5, i) ||
        g(6, i) || g(7, i) || g(8, i) || g(9, i) || g(10, i) || g(11, i) ||
        g(12, i) || g(13, i) || g(14, i) || g(15, i) || g(16, i) || g(17, i) ||
        g(18, i) || g(19, i));
    i = i + 1;
  }
  i = 1;
  while (i < 20 && f(i - 1, i))
    i = i + 1;

  int ans;
  ans = 0;
  if (h(0) && h(1) || !h(2) || h(3)) ans = 1;
  sum + ans;
  ans = 0;
  if (!h(4) || h(5) && !h(6) && h(7) || !h(8)) ans = 1;
  sum * ans;
  ans = 0;
  if (h(9) && !h(10) || !h(11) || !h(12) || !h(13) || h(14) && h(15)) ans = 1;
  sum - ans;
  ans = 0;
  if (h(0) && h(2) && !h(3) && !h(4) || h(5) || h(6) && !h(7) || h(8)) ans = 1;
  putint(sum + ans);
  return 0;
}