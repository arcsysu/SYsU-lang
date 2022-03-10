int n;
int insertsort(int a[])
{
    int i;
    i = 1;
    while(i<n)     
    {
        int temp;
        temp=a[i]; 
        int j;
        j=i-1;
        while(j>-1&&temp<a[j])
        {
            a[j+1]=a[j];  
            j = j - 1;
        }
        a[j+1]=temp; 
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
    i = insertsort(a);
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
