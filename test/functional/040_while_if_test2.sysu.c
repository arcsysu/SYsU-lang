int ifWhile() {
  int a;
  a = 0;
  int b;
  b = 3;
  if (a == 5) {
    while(b == 2){
      b = b + 2;
    }
    b = b + 25;
  }
  else 
    while (a < 5) {
      b = b * 2;
      a = a + 1;
    }
  return (b);
}


int main(){
  return (ifWhile());
}
