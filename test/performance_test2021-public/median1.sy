int n;
int meanless_calculation(int x, int y){
    int i = 0;
    int ret = 0;
    while (i < x && i < y){
        i = i + 1;
        ret = ret + x + i;
    }
    return ret;
}

int swap(int arr[], int l, int r){
    int curr = arr[l];
    arr[l] = arr[r];
    arr[r] = curr;
    return meanless_calculation(l, r);
}

int median(int arr[], int begin, int end, int pos){
    int pivot = arr[begin];

    int l = begin;
    int r = end + 1;
    int xx = 0;
    while (1 == 1){
        while (l < r){
		    r = r - 1;
		    if(arr[r] < pivot){
			    break;
			}
            xx = xx + 1;
        }
        while (l < r){
		    l = l + 1;
		    if(arr[l] >= pivot){
			    break;
			}
		    xx = xx - 1;
		}
            
        if (l == r) break;
        else {
            swap(arr, l, r);
        }
    }
    arr[begin] = pivot;
    swap(arr, begin, l);

    if (l > pos) return median(arr, begin, l, pos);
    if (l < pos) return median(arr, l + 1, end, pos); 

    return xx;
}

int a[10000000];

int main(){
    n = getarray(a);
    starttime();
    median(a, 0, n-1, n/2);
    stoptime();
    putarray(n, a);
    return a[n/2] % 256;
}
