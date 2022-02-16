const int N = -1;
int arr[N + 2 * 4 - 99 / 99] = {1, 2, 33, 4, 5, 6};

int main() {
  int i = 0, sum = 0;
  while (i < 6) {
    sum = sum + arr[i];
    i = i + 1;
  }
  return sum;
}
