int a;
int sum;
int count = 0;

int getA() {
  count = count + 1;
  return count;
}

void f1(int a) {
  sum = sum + a;
  a = getA();
  sum = sum + a;
  {
    if (1) {
      int a = getA();
      sum = sum + a;
    }
    sum = sum + a;
  }
  sum = sum + a;
}

void f2() {
  sum = sum + a;
  {
    {
      {
        int a = getA();
      }
    }
    sum = sum + a;
  }
}

void f3() {
  int a = getA();
  sum = sum + a;
  {
    {
      {
        a = getA();
      }
      sum = sum + a;
      int a = getA();
    }
    sum = sum + a;
  }
}


int main() {
  sum = 0;
  a = getA();
  sum = sum + a;
  int a = getA();
  f1(a);f2();f3();
  {
    {
      f1(a);f2();f3();
      int a = getA();
    }
    f1(a);f2();f3();
    {
      int a = getA();
      {
        int a = getA();
        {
          f1(a);f2();f3();
          int a = getA();
          f1(a);f2();f3();
          {
            a = getA();
          }
          f1(a);f2();f3();
        }
      }
    }
    f1(a);f2();f3();
  }
  while(1) {
    while(1) {
      int i = 0;
      while(i < 3) {
        while(1) {
          if (1) {
            f1(a);f2();f3();
            break;
          }
          a = getA();
        }
        {
          if (i == 1) {
            int a = getA();
            f1(a);f2();f3();
            i = i + 1;
            continue;
          }
          else{
            f1(a);f2();f3();
          }
          a = getA();
        }
        i = i + 1;
      }
      break;
      break;
    }
    break;
  }
  putint(sum);
  return 0;
}