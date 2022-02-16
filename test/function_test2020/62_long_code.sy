// Really long code;
int n;

int bubblesort(int arr[]) {
    int i;
    int j;
    i =0; 
    while(i < n-1){
    // Last i elements are already in place    
        j = 0;
        while(j < n-i-1){
            if (arr[j] > arr[j+1]) {
                // swap(&arr[j], &arr[j+1]); 
                int tmp;
                tmp = arr[j+1];
                arr[j+1] = arr[j];
                arr[j] = tmp;       
            }
            j = j + 1;
        }
        i = i + 1;
    }
    return 0;
}

int insertsort(int a[]) {
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


int getMid(int arr[]) {
    int mid;
    if (n % 2 == 0) {
        mid = n / 2;
        return (arr[mid] + arr[mid - 1]) / 2;
    } else {
        mid = n / 2;
        return arr[mid];
    }
}

int getMost(int arr[]) {
    int count[1000];
    int i;
    i = 0;
    while (i < 1000) {
        count[i] = 0;
        i = i + 1;
    }
    i = 0;
    int max;
    int number;
    max = 0;
    while (i < n) {
        int num;
        num = arr[i];
        count[num] = count[num] + 1;
        if (count[num] > max) {
            max = count[num];
            number = num;
        }
        i = i + 1;
    }
    return number;
}

int revert(int arr[]) {
    int temp;
    int i;
    int j;
    i = 0;
    j = 0;
    while (i < j) {
        temp = arr[i];
        arr[i] = arr[j];
        arr[j] = temp;
        i = i + 1;
        j = j - 1;
    }
    return 0;
}

int arrCopy(int src[], int target[]) {
    int i;
    i = 0;
    while (i < n) {
        target[i] = src[i];
        i = i + 1;
    }
    return 0;
}

int calSum(int arr[], int stride) {
    int sum;
    sum = 0;
    int i;
    i = 0;
    while (i < n) {
        sum = sum + arr[i];
        if (i % stride != stride - 1) {
            arr[i] = 0;
        } else {
            arr[i] = sum;
            sum = 0;
        }
        i = i + 1;
    }
    return 0;
}

int avgPooling(int arr[], int stride) {
    int sum;
    int i;
    i = 0;
    sum = 0;
    int lastnum;
    while (i < n) {
        if (i < stride - 1) {
            sum = sum + arr[i];
        } else if (i == stride - 1) {
            lastnum = arr[0];
            arr[0] = sum / stride;
        } else {
            sum = sum + arr[i] - lastnum;
            lastnum = arr[i - stride + 1];
            arr[i - stride + 1] = sum / stride;
        }
        i = i + 1;
    }
    i = n - stride + 1;
    while (i < n) {
        arr[i] = 0;
        i = i + 1;
    }
    return 0;
}

int main() {
    n = 32;
    int arr[32];
    int result[32];
    arr[0] = 7;
    arr[1] = 23;
    arr[2] = 89;
    arr[3] = 26;
    arr[4] = 282;
    arr[5] = 254;
    arr[6] = 27;
    arr[7] = 5;
    arr[8] = 83;
    arr[9] = 273;
    arr[10] = 574;
    arr[11] = 905;
    arr[12] = 354;
    arr[13] = 657;
    arr[14] = 935;
    arr[15] = 264;
    arr[16] = 639;
    arr[17] = 459;
    arr[18] = 29;
    arr[19] = 68;
    arr[20] = 929;
    arr[21] = 756;
    arr[22] = 452;
    arr[23] = 279;
    arr[24] = 58;
    arr[25] = 87;
    arr[26] = 96;
    arr[27] = 36;
    arr[28] = 39;
    arr[29] = 28;
    arr[30] = 1;
    arr[31] = 290;
    int t;
    t = arrCopy(arr, result);
    t = revert(result);
    int i;
    i = 0;
    while (i < 32) {
        t = result[i];
        putint(t);
        i = i + 1;
    }
    t = bubblesort(result);
    i = 0;
    while (i < 32) {
        t = result[i];
        putint(t);
        i = i + 1;
    }
    t = getMid(result);
    putint(t);
    t = getMost(result);
    putint(t);

    t = arrCopy(arr, result);
    t = bubblesort(result);
    i = 0;
    while (i < 32) {
        t = result[i];
        putint(t);
        i = i + 1;
    }
    
    t = arrCopy(arr, result);
    t = insertsort(result);
    i = 0;
    while (i < 32) {
        t = result[i];
        putint(t);
        i = i + 1;
    }
    
    t = arrCopy(arr, result);
    i = 0;
    t = 31;
    t = QuickSort(result, i, t);
    while (i < 32) {
        t = result[i];
        putint(t);
        i = i + 1;
    }

    t = arrCopy(arr, result);
    t = calSum(result, 4);
    i = 0;
    while (i < 32) {
        t = result[i];
        putint(t);
        i = i + 1;
    }
    
    t = arrCopy(arr, result);
    t =  avgPooling(result, 3);
    i = 0;
    while (i < 32) {
        t = result[i];
        putint(t);
        i = i + 1;
    }
    return 0;
}
