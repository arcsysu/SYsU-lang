int M;
int L;
int N;


int add(float a0[],float a1[], float a2[],float b0[],float b1[],float b2[],float c0[],float c1[],float c2[])
{
    int i;
    i=0;
    while(i<M)
    {
        c0[i]=a0[i]+b0[i];
        c1[i]=a1[i]+b1[i];
        c2[i]=a2[i]+b2[i];
        i=i+1;
    } 

    return 0;

}

int main()
{
    N=3;
    M=3;
    L=3;
    float a0[3], a1[3], a2[3], b0[3], b1[3], b2[3], c0[6], c1[3], c2[3];
    int i;
    i=0;
    while(i<M)
    {
        a0[i]=i;
        a1[i]=i;
        a2[i]=i;
        b0[i]=i;
        b1[i]=i;
        b2[i]=i;
        i=i+1;
    }
    i=add( a0, a1,  a2, b0, b1, b2, c0, c1, c2);
    int x;
    while(i<N)
    {
        x = c0[i];
        putint(x);
        i=i+1;
    }
    x = 10;
    putch(x);
    i=0;
    while(i<N)
    {
        x = c1[i];
        putint(x);
        i=i+1;
    }
    x = 10;
    putch(x);
    i=0;
    while(i<N)
    {
        x = c2[i];
        putint(x);
        i=i+1;
    }
    x = 10;
    putch(x);

    return 0;
}
