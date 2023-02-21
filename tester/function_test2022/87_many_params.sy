void sort(int arr[], int len) {
  int i = 0;
  while (i < len - 1) {
    int j = i + 1;
    while (j < len) {
      if (arr[i] < arr[j]) {
        int temp = arr[i];
        arr[i] = arr[j];
        arr[j] = temp;
      }
      j = j + 1;
    }
    i = i + 1;
  }
}

// attempt to fool the inliner
int param32_rec(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8,
                int a9, int a10, int a11, int a12, int a13, int a14, int a15,
                int a16, int a17, int a18, int a19, int a20, int a21, int a22,
                int a23, int a24, int a25, int a26, int a27, int a28, int a29,
                int a30, int a31, int a32) {
  if (a1 == 0) {
    return a2;
  }
  else {
    return param32_rec(a1 - 1, (a2 + a3) % 998244353, a4, a5, a6, a7, a8, a9,
                       a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20,
                       a21, a22, a23, a24, a25, a26, a27, a28, a29, a30, a31,
                       a32, 0);
  }
}

int param32_arr(int a1[], int a2[], int a3[], int a4[], int a5[], int a6[],
                int a7[], int a8[], int a9[], int a10[], int a11[], int a12[],
                int a13[], int a14[], int a15[], int a16[], int a17[],
                int a18[], int a19[], int a20[], int a21[], int a22[],
                int a23[], int a24[], int a25[], int a26[], int a27[],
                int a28[], int a29[], int a30[], int a31[], int a32[]) {
  int sum = a1[0] + a1[1];
  sum = sum + a2[0] + a2[1];
  sum = sum + a3[0] + a3[1];
  sum = sum + a4[0] + a4[1];
  sum = sum + a5[0] + a5[1];
  sum = sum + a6[0] + a6[1];
  sum = sum + a7[0] + a7[1];
  sum = sum + a8[0] + a8[1];
  sum = sum + a9[0] + a9[1];
  sum = sum + a10[0] + a10[1];
  sum = sum + a11[0] + a11[1];
  sum = sum + a12[0] + a12[1];
  sum = sum + a13[0] + a13[1];
  sum = sum + a14[0] + a14[1];
  sum = sum + a15[0] + a15[1];
  sum = sum + a16[0] + a16[1];
  sum = sum + a17[0] + a17[1];
  sum = sum + a18[0] + a18[1];
  sum = sum + a19[0] + a19[1];
  sum = sum + a20[0] + a20[1];
  sum = sum + a21[0] + a21[1];
  sum = sum + a22[0] + a22[1];
  sum = sum + a23[0] + a23[1];
  sum = sum + a24[0] + a24[1];
  sum = sum + a25[0] + a25[1];
  sum = sum + a26[0] + a26[1];
  sum = sum + a27[0] + a27[1];
  sum = sum + a28[0] + a28[1];
  sum = sum + a29[0] + a29[1];
  sum = sum + a30[0] + a30[1];
  sum = sum + a31[0] + a31[1];
  sum = sum + a32[0] + a32[1];
  return sum;
}

int param16(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8,
            int a9, int a10, int a11, int a12, int a13, int a14, int a15,
            int a16) {
  int arr[16] = {a1, a2,  a3,  a4,  a5,  a6,  a7,  a8,
                 a9, a10, a11, a12, a13, a14, a15, a16};
  sort(arr, 16);
  return param32_rec(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5], arr[6],
                     arr[7], arr[8], arr[9], arr[10], arr[11], arr[12], arr[13],
                     arr[14], arr[15], a1, a2, a3, a4, a5, a6, a7, a8, a9, a10,
                     a11, a12, a13, a14, a15, a16);
}

int main() {
  int arr[32][2] = {{param16(getint(), getint(), getint(), getint(), getint(),
                             getint(), getint(), getint(), getint(), getint(),
                             getint(), getint(), getint(), getint(), getint(),
                             getint()),
                     8848}},
      i = 1;
  while (i < 32) {
    arr[i][0] = arr[i - 1][1] - 1;
    arr[i][1] = arr[i - 1][0] - 2;
    i = i + 1;
  }
  putint(param32_arr(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5], arr[6],
                     arr[7], arr[8], arr[9], arr[10], arr[11], arr[12], arr[13],
                     arr[14], arr[15], arr[16], arr[17], arr[18], arr[19],
                     arr[20], arr[21], arr[22], arr[23], arr[24], arr[25],
                     arr[26], arr[27], arr[28], arr[29], arr[30], arr[31]));
  putch(10);
  return 0;
}
