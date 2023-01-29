const int maxN = 1000;
const int space = 32;
int array[maxN];

void swap(int i, int j) {
  int tmp = array[i];
  array[i] = array[j];
  array[j] = tmp;
}

int findPivot(int start, int end) {
  int pivot = array[end];

  int pIndex = start, i = start;
  while (i < end) {
    if (array[i] <= pivot) {
      swap(i, pIndex);
      pIndex = pIndex + 1;
    }
    i = i + 1;
  }
  swap(pIndex, end);
  return pIndex;
}

void findSmallest(int low, int high, int k, int n) {
  if (low == high)
    return;
  else {
    int pIndex = findPivot(low, high);
    if (k == pIndex) {
      int i = 0;
      while (i < pIndex) {
        putint(array[i]);
        putch(space);
        i = i + 1;
      }
    }
    else if (k < pIndex) {
      findSmallest(low, pIndex - 1, k, n);
    }
    else {
      findSmallest(pIndex + 1, high, k, n);
    }
  }
}

int main() {
  int n = getint(), k = getint();
  int i = 0;
  while (i < n) {
    array[i] = getint();
    i = i + 1;
  }
  int low = 0, high = n - 1;
  findSmallest(low, high, k, n);
  return 0;
}