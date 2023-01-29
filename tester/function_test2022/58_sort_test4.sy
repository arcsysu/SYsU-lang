int n;
int select_sort(int A[],int n)
{
    int i;
    int j;
    int min;
    i =0;
    while(i < n-1)
    {
        min=i;//
        j = i + 1;
        while(j < n)
        {
            if(A[min]>A[j])
            {
                min=j;
            }
            j=j+1;
        }
        if(min!=i)
        {
            int tmp;
            tmp = A[min];
            A[min] = A[i];
            A[i] = tmp;
        }
        i = i + 1;
    }
    return 0;
}

int main(){
    n = 10;
    int a[10];
    a[0]=4;a[1]=3;a[2]=9;a[3]=2;a[4]=0;
    a[5]=1;a[6]=6;a[7]=5;a[8]=7;a[9]=8;
    int i;
    i = 0;
    i = select_sort(a, n);
    while (i < n) {
        int tmp;
        tmp = a[i];
        putint(tmp);
        tmp = 10;
        putch(tmp);
        i = i + 1;
    }
    return 0;
}
