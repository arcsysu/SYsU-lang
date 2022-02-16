//int n;
int N;
int insert(int a[],int x)
{
    int p;
    int i;
    p=0;

    while(x>a[p]&&p<N)
        p=p+1;

    i=N;
    while(i>p)
    {
        a[i]=a[i-1];
        a[p]=x;
        i=i-1;

    }

    return 0;
}

int main()
{
    N=10;
    int a[11];
    //a[0]=1;
    a[0]=1;
    a[1]=3;
    a[2]=4;
    a[3]=7;
    a[4]=8;
    a[5]=11;
    a[6]=13;
    a[7]=18;
    a[8]=56;
    a[9]=78;
    int x;
    int i;
    i=0;
    x=getint();
    x=insert(a,x);
    //while()
    while(i<N)
    {
        x = a[i];
        putint(x);
        x= 10;
        putch(x);
        i=i+1;
    }

    return 0;
}
