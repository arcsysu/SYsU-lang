// factorial number
int a;
int r;
int fac(int x)
{
  if (x <2) 
  	return 1;
  a = x - 1;
  r = fac(a);
  r = x * r;
  return r;
}

int main(){
	int a;
	a = 5;
	return fac(a);
}