int n;
int Merge(int array[], int low, int middle, int high)
{
    int n1;
    n1 = middle - low + 1;
    int n2;
    n2 = high - middle;
    int L[10];
    int R[10];
    int i;
    i = 0;
    int j;
    j = 0;
 
    while(i < n1){
        L[i] = array[i + low];
        i = i + 1;        
    }
    while(j < n2){
        R[j] = array[j + middle  +1];
        j = j + 1;        
    }
    i = 0;
    j = 0;
    int k;
    k = low;
    while(i!=n1 && j!= n2)
    {   
        if(L[i] < R[j] + 1){
            array[k] = L[i];
            k = k + 1;
            i = i + 1;
        }
        else{
            array[k] = R[j];
            k = k + 1;
            j = j + 1;
        }
    }
    while(i < n1){
        array[k] = L[i];
        k = k + 1;
        i = i + 1;
        
    }
    while(j < n2){
        array[k] = R[j];
        k = k + 1;
        j = j + 1;
    }
    return 0;
}
 
int MergeSort(int array[], int p, int q)
{
    if(p < q)
    {
        int mid;
        mid = (p+q)/2;
        int tmp;
        tmp = MergeSort(array, p, mid);
        tmp = mid + 1;
        tmp = MergeSort(array, tmp, q);
        tmp = Merge(array,p, mid, q);
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
    tmp = n - 1;
    i = MergeSort(a, i, tmp);
    while (i < n) {
        tmp = a[i];
        putint(tmp);
        tmp = 10;
        putch(tmp);
        i = i + 1;
    }
    return 0;
}
