int fsqrt(int a)
{
    int x0=0;
    int x1;
    x1=a/2;
    while(x0-x1!=0)
    {
        x0=x1;
        x1=(x0+a/x0);
        x1=x1/2;
    }

    return x1;

}

int main()
{
    int a;
    a=400;
    int res;
    res=fsqrt(a);
    putint(res);
    res = 10;
    putch(res);
    return 0;
}
