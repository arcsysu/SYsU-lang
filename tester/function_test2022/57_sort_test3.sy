int n;
int QuickSort(int arr[], int low, int high)
{
    if (low < high)
    {
        int i;
        i = low;
        int j;
        j = high;
        int k;
        k = arr[low];
        while (i < j)
        {
            while(i < j && arr[j] > k - 1)
            {
                j = j - 1;
            }
 
            if(i < j)
            {
                arr[i] = arr[j];
                i = i + 1;
            }
 
            while(i < j && arr[i] < k)
            {
                i = i + 1;
            }
 
            if(i < j)
            {
                arr[j] = arr[i];
                j = j - 1;
            }
        }
 
        arr[i] = k;
        int tmp;
        tmp = i - 1;
        tmp = QuickSort(arr, low, tmp);
        tmp = i + 1;
        tmp = QuickSort(arr, tmp, high);
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
    int tmp;
    tmp = 9;
    i = QuickSort(a, i, tmp);
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
