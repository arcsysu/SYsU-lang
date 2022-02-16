int N;

int newline;

int factor(int n )
{
    int i;
    int sum;
    sum=0;
    i=1;
    while(i<n+1)
    {
        if(n%i == 0)
        {
            sum=sum+i;
        }
        i=i+1;
    }

    return sum;
}

int main()
{
    N=4;
    newline=10;
    int i;
    int m;
    m = 1478;
    int t;
    
    return factor(m);
}