const int mod = 998244353;
int d;

int multiply(int a, int b){
    if (b == 0) return 0;
    if (b == 1) return a % mod;
    int cur = multiply(a, b/2);
    cur = (cur + cur) % mod;
    if (b % 2 == 1) return (cur + a) % mod;
    else return cur;
}

int power(int a, int b){
    if (b == 0) return 1;
    int cur = power(a, b/2);
    cur = multiply(cur, cur);
    if (b % 2 == 1) return multiply(cur, a);
    else return cur;
}
const int maxlen = 2097152;
int temp[maxlen], a[maxlen], b[maxlen], c[maxlen];

int memmove(int dst[], int dst_pos, int src[], int len){
    int i = 0;
    while (i < len){
        dst[dst_pos + i] = src[i];
        i = i + 1;
    }
    return i;
}

int fft(int arr[], int begin_pos, int n, int w){
    if (n == 1) return 1;
    int i = 0;
    while (i < n){
        if (i % 2 == 0) temp[i / 2] = arr[i + begin_pos];
        else temp[n / 2 + i / 2] = arr[i + begin_pos];
        i = i + 1;
    }

    memmove(arr, begin_pos, temp, n);
    fft(arr, begin_pos, n / 2, multiply(w, w));
    fft(arr, begin_pos + n / 2, n / 2, multiply(w, w));
    i = 0;
    int wn = 1;
    while (i < n / 2){
        int x = arr[begin_pos + i];
        int y = arr[begin_pos + i + n / 2];
        arr[begin_pos + i] = (x + multiply(wn, y)) % mod;
        arr[begin_pos + i + n / 2] = (x - multiply(wn, y) + mod) % mod;
        wn = multiply(wn, w);
        i = i + 1;
    }
    return 0;
}

int main(){
    int n = getarray(a);
    int m = getarray(b);
    starttime();
    d = 1;
    while (d < n + m - 1){
        d = d * 2;
    }
    fft(a, 0, d, power(3, (mod - 1) / d));
    fft(b, 0, d, power(3, (mod - 1) / d));

    int i = 0;
    while (i < d){
        a[i] = multiply(a[i], b[i]);
        i = i + 1;
    }
    fft(a, 0, d, power(3, mod-1 - (mod-1)/d));
    i = 0;
    while (i < d){
        a[i] = multiply(a[i], power(d, mod-2));
        i = i + 1;
    }
    stoptime();
    putarray(n + m - 1, a);
    return 0;
}