int g;
int h;
int f;
int e;
int EightWhile() {
  int a;
  a = 5;
  int b;
  int c;
  b = 6;
  c = 7;
  int d;
  d = 10;
  while (a < 20) {
    a = a + 3;
    while(b < 10){
      b = b + 1;
      while(c == 7){
        c = c - 1;
        while(d < 20){
          d = d + 3;
          while(e > 1){
            e = e-1;
            while(f > 2){
              f = f -2;
              while(g < 3){
                g = g +10;
                while(h < 10){
                  h = h + 8;
                }
                h = h-1;
              }
              g = g- 8;
            }
            f = f + 1;
          }
          e = e + 1;
        }
        d = d - 1;
      }
      c = c + 1;
    }
    b = b - 2;
  }
  
  return (a + (b + d) + c)-(e + d - g + h);
}

int main() {
  g = 1;
  h = 2;
  e = 4;
  f = 6;
  return EightWhile();
}
