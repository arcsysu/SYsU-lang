const int maxlen = 2097152;
int temp[maxlen], w[maxlen], dst[maxlen], c[maxlen];

int getvalue(int a[], int n, int i, int j)
{
    if (i < 0 || i >= n || j < 0 || j >= n) return -1;
    return a[i*n + j];
}

void mem_move(int src[], int dst[], int n){
    int i = 0;
    while (i < n){
        dst[i] = src[i];
        i = i + 1;
    }
}

void floyd(int w[], int dst[], int n)
{
    int k = 0;
    while (k < n) {
        int i = 0;
        while (i < n) {
            temp[i*n + k] = getvalue(w, n, i, k);
            i = i + 1;
        }
        k = k + 1;
    }
    k = 0;
    while (k < n) {
        int i = 0;
        while (i < n) {
            int j = 0;
            while (j < n) {
                if (getvalue(temp, n, i, k) >= 0 && getvalue(temp, n, k, j) >= 0) {
                    if (getvalue(temp, n, i, j) < 0) {
                        temp[i*n + j] = getvalue(temp, n, i, k) + getvalue(temp, n, k, j);
                    }
                    else {
                        if (temp[i*n + j] > getvalue(temp, n, i, k) + getvalue(temp, n, k, j)) {
                            temp[i*n + j] = getvalue(temp, n, i, k) + getvalue(temp, n, k, j);
                        }
                    }
                }
                
                j = j + 1;

            }
            i = i + 1;

        }
        k = k + 1;
    }
    mem_move(temp, dst, n*n);
}

int main()
{
    int n = getint();
    getarray(w);

    starttime();
    floyd(w, dst, n);
    stoptime();
    putarray(n * n, dst);
    return 0;
}
