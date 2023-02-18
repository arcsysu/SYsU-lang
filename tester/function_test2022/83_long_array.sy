const int N = 10000;

int long_array(int k) {
  int a1[N];
  int a2[N];
  int a3[N];
  int i = 0;
  while (i < N) {
    a1[i] = (i * i) % 10;
    i = i + 1;
  }
  i = 0;
  while (i < N) {
    a2[i] = (a1[i] * a1[i]) % 10;
    i = i + 1;
  }
  i = 0;
  while (i < N) {
    a3[i] = (a2[i] * a2[i]) % 100 + a1[i];
    i = i + 1;
  }
  int ans = 0;
  i = 0;
  while (i < N) {
    if (i < 10) {
      ans = (ans + a3[i]) % 1333;
      putint(ans);
    }
    else if (i < 20) {
      int j = N / 2;
      while (j < N) {
        ans = ans + a3[i] - a1[j];
        j = j + 1;
      }
      putint(ans);
    }
    else if (i < 30) {
      int j = N / 2;
      while (j < N) {
        if (j > 2233) {
          ans = ans + a2[i] - a1[j];
          j = j + 1;
        }
        else {
          ans = (ans + a1[i] + a3[j]) % 13333;
          j = j + 2;
        }
      }
      putint(ans);
    }
    else {
      ans = (ans + a3[i] * k) % 99988;
    }
    i = i + 1;
  }
  return ans;
}

int main() {
  return long_array(9);
}
