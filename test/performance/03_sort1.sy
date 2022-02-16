const int base = 16;

int getMaxNum(int n, int arr[]){
    int ret = 0;
    int i = 0;
    while (i < n){
        if (arr[i] > ret) ret = arr[i];
        i = i + 1;
    }
    return ret;
}

int getNumPos(int num, int pos){
    int tmp = 1;
    int i = 0;
    while (i < pos){
        num = num / base;
        i = i + 1;
    }
    return num % base;
}

void radixSort(int bitround, int a[], int l, int r){
    int head[base] = {};
    int tail[base] = {};
    int cnt[base] = {};

    if (bitround == -1 || l + 1 >= r) return;

    {    
        int i = l;
        
        while (i < r){
            cnt[getNumPos(a[i], bitround)]
                = cnt[getNumPos(a[i], bitround)] + 1;
            i = i + 1;
        }        
        head[0] = l;
        tail[0] = l + cnt[0];

        i = 1;
        while (i < base){
            head[i] = tail[i - 1];
            tail[i] = head[i] + cnt[i];
            i = i + 1;
        }
        i = 0;
        while (i < base){
            while (head[i] < tail[i]){
                int v = a[head[i]];
                while (getNumPos(v, bitround) != i){
                    int t = v;
                    v = a[head[getNumPos(t, bitround)]];
                    a[head[getNumPos(t, bitround)]] = t;
                    head[getNumPos(t, bitround)] = head[getNumPos(t, bitround)] + 1;
                }
                a[head[i]] = v;
                head[i] = head[i] + 1;
            }
            i = i + 1;
        }
    }

    {
        int i = l;
        
        head[0] = l;
        tail[0] = l + cnt[0];

        i = 0;
        while (i < base){
            if (i > 0){
                head[i] = tail[i - 1];
                tail[i] = head[i] + cnt[i];
            }
            radixSort(bitround - 1, a, head[i], tail[i]);
            i = i + 1;
        }
    }

    return;
}

int a[30000010];
int ans;

int main(){
    int n = getarray(a);

    starttime();

    radixSort(8, a, 0, n);

    int i = 0;
    while (i < n){
        ans = ans + i * (a[i] % (2 + i));
        i = i + 1;
    }

    if (ans < 0)
        ans = -ans;
    stoptime();
    putint(ans);
    putch(10);
    return 0;
}
