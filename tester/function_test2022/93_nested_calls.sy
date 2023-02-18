int func1(int x, int y, int z) {
  if (z == 0) {
    return x * y;
  }
  else {
    return func1(x, y - z, 0);
  }
}

int func2(int x, int y) {
  if (y) {
    return func2(x % y, 0);
  }
  else {
    return x;
  }
}

int func3(int x, int y) {
  if (y == 0) {
    return x + 1;
  }
  else {
    return func3(x + y, 0);
  }
}

int func4(int x, int y, int z) {
  if (x) {
    return y;
  }
  else {
    return z;
  }
}

int func5(int x) {
  return -x;
}

int func6(int x, int y) {
  if (x && y) {
    return 1;
  }
  else {
    return 0;
  }
}

int func7(int x) {
  if (!x) {
    return 1;
  }
  else {
    return 0;
  }
}

int main() {
  int i1 = getint(), i2 = getint(), i3 = getint(), i4 = getint();
  int arr[10];
  int i = 0;
  while (i < 10) {
    arr[i] = getint();
    i = i + 1;
  }
  int a = func1(
      // this
      func2(
          // is
          func1(
              // comment
              func3(func4(func5(func3(func2(func6(func7(i1), func5(i2)), i3),
                                      // this
                                      i4)),
                          // is
                          arr[0],
                          // function
                          func1(func2(func3(func4(func5(arr[1]),
                                                  // call
                                                  func6(arr[2], func7(arr[3])),
                                                  func2(arr[4], func7(arr[5]))),
                                            arr[6]),
                                      arr[7]),
                                func3(arr[8], func7(arr[9])), i1)),
                    func2(i2, func3(func7(i3), i4))),
              arr[0], arr[1]),
          arr[2]),
      arr[3],
      func3(func2(func1(func2(func3(arr[4], func5(arr[5])), func5(arr[6])),
                        arr[7], func7(arr[8])),
                  func5(arr[9])),
            i1));
  return a;
}
