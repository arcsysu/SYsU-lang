// test if-else else-if
int ifElseElseIf() {
  int a;
  a = 66;
  int b;
  b = 8923;
  if (a == 5) {
    b = 25;
  }
  else if (a == 10) {
    b = 42;  
  }
  else {
    b = a * 2;
  }
  return (b);
}

int main() {
  return (ifElseElseIf());
}
