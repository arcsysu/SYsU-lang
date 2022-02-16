int g = 0;

int func(int n) {
  g = g + n;
  putint(g);
  return g;
}

int main() {
  int i;
  i = getint();
  if (i > 10 && func(i)) i = 1; else i = 0;
  i = getint();
  if (i > 11 && func(i)) i = 1; else i = 0;
  i = getint();
  if (i <= 99 || func(i)) i = 1; else i = 0;
  i = getint();
  if (i <= 100 || func(i)) i = 1; else i = 0;
  if (!func(99) && func(100)) i = 1; else i = 0;
  return 0;
}
