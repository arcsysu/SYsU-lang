int M;
int L;
int N;

int tran(int a0[],int a1[], int a2[],int b0[],int b1[],int b2[],int c0[],int c1[],int c2[])
{
    int i;
    i=0;
    c1[2]=a2[1];
    c2[1]=a1[2];
    c0[1]=a1[0];
    c0[2]=a2[0];
    c1[0]=a0[1];
    c2[0]=a0[2];
    c1[1]=a1[1];
    c2[2]=a2[2];
    c0[0]=a0[0];

    return 0;

}

int main()
{
    N=3;
    M=3;
    L=3;
    int a0[3];int a1[3]; int a2[3];int b0[3];int b1[3];int b2[3];int c0[6];int c1[3];int c2[3];
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
    i=tran( a0, a1,  a2, b0, b1, b2, c0, c1, c2);
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
    i=0;
    putch(x);
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
