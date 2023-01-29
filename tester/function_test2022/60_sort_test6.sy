int n;

int counting_sort(int ini_arr[], int sorted_arr[], int n) {
	int count_arr[10];
	int i;
    int j;
    int k;
    k = 0;
    i = 0;
    j = 0;
	while(k < 10){
		count_arr[k] = 0;
        k = k + 1;
    }
    while(i < n)
    {
		count_arr[ini_arr[i]] = count_arr[ini_arr[i]] + 1;
        i = i + 1;
    }
    k = 1;
	while(k < 10){
		count_arr[k] = count_arr[k] + count_arr[k - 1];
        k = k + 1;
    }
    j = n;
	while( j > 0){
        count_arr[ini_arr[j - 1]] = count_arr[ini_arr[j - 1]] - 1;
		sorted_arr[count_arr[ini_arr[j - 1]]] = ini_arr[j - 1];
        j = j - 1;
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
    int b[10];
    i = counting_sort(a, b, n);
    while (i < n) {
        int tmp;
        tmp = b[i];
        putint(tmp);
        tmp = 10;
        putch(tmp);
        i = i + 1;
    }
    return 0;
}
