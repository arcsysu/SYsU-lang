int n;

int gcd(int m,int n)
{ 
    int a;
    int b;
    a=m;
    b=n;

    int t;
    int r;

    if(m<n) { t=m;m=n;n=t; }

    r=m%n;

    while(r!=0)

    {m=n;   n=r;   r=m%n;  }

   return (a*b)/n;
}

int main()
{
    //newline=10;
    int i;
    int m;
    //m = 1478;
    //int t;
    i=getint();
    m=getint();
    
    return gcd(i,m);
}