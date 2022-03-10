int s = 0;

int get_ans_se(int ans, int v0, int v1) {
  int v = 0;
  if (v0 == v1) v = 1;
  ans = ans * 2;
  ans = ans + v;
  s = s + ans;
  return ans;
}

int get_ans(int ans, int v0, int v1) {
  int v = 0;
  if (v0 == v1) v = 1;
  ans = ans * 2;
  ans = ans + v;
  return ans;
}

int main() {
  const int k0 = -2147483648;
  const int k1 = 0x80000000;
  const int k2 = 0x80000000 + 1;
  const int k3 = 0x7fFffffF;
  const int k4 = 0x7fFffffF - 1;
  int a1, a2, a3, a4;
  a1 = get_ans( 0, k0, k1);
  a1 = get_ans(a1, k0 + 1, k2);
  a1 = get_ans(a1, k0, -k3 - 1);
  a1 = get_ans(a1, k0, k4 + 1);
  a1 = get_ans(a1, k1 / 2, k2 / 2);
  a1 = get_ans(a1, k1, -k3 - 1);
  a1 = get_ans(a1, k1, k4 + 1);
  a2 = get_ans( 0, k2, k3);
  a2 = get_ans(a2, k2, k4);
  a2 = get_ans(a2, k3, k4);
  a2 = get_ans(a2, k0 / 2, k1 / 2);
  a3 = get_ans_se( 0, k0, k1);
  a3 = get_ans_se(a3, k0 + 1, k2);
  a3 = get_ans_se(a3, k0, -k3 - 1);
  a3 = get_ans_se(a3, k0, k4 + 1);
  a3 = get_ans_se(a3, k1 / 2, k2 / 2);
  a3 = get_ans_se(a3, k1, -k3 - 1);
  a3 = get_ans_se(a3, k1, k4 + 1);
  a4 = get_ans_se( 0, k2, k3);
  a4 = get_ans_se(a4, k2, k4);
  a4 = get_ans_se(a4, k3, k4);
  a4 = get_ans_se(a4, k0 / 2, k1 / 2);
  return a1 + a2 + a3 + a4;
}
