int n;
int swap (int array[], int i, int j){
    int temp;
    temp = array[i];
    array[i] = array[j];
    array[j] = temp;
    return 0;  
}
int heap_ajust(int arr[], int start, int end) {  
    int dad;
    dad = start;  
    int son;
    son = dad * 2 + 1;  
    while (son < end + 1) { //   
        if (son < end && arr[son] < arr[son + 1])
            son = son + 1;  
        if (arr[dad] > arr[son])
            return 0;  
        else {
            dad = swap(arr,dad,son);  
            dad = son;  
            son = dad * 2 + 1;  
        }  
    }  
    return 0;  
}  
int heap_sort(int arr[], int len) {  
    int i;  
    int tmp;
    i = len / 2 - 1;
    while ( i > -1) {
        tmp = len - 1;
        tmp = heap_ajust(arr, i, tmp);  
        i = i - 1;
    }    
    i = len - 1;   
    while ( i > 0) {  
        int tmp0;
        tmp0 = 0;
        tmp = swap(arr,tmp0,i);
        tmp = i - 1;
        tmp = heap_ajust(arr, tmp0, tmp);  
        i = i-1;
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
    i = heap_sort(a, n);
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
