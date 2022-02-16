void spmv(int n,int xptr[], int yidx[], int vals[], int b[], int x[]){
    int i, j, k;
    i = 0;
    while (i < n){
        x[i] = 0;
        i = i + 1;
    }

    i = 0;
    while (i < n){
        j = xptr[i];
        while (j < xptr[i + 1]){
            x[yidx[j]] = x[yidx[j]] + vals[j];
            j = j + 1;
        }

        j = xptr[i];
        while (j < xptr[i + 1]){
            x[yidx[j]] = x[yidx[j]] + vals[j] * (b[i] - 1);
            j = j + 1;
        }
        i = i + 1;
    }
}

const int N = 100010;
const int M = 3000000;

int x[N], y[M], v[M];
int a[N], b[N], c[N];

int main(){
    int n = getarray(x) - 1;
    int m = getarray(y);
    getarray(v);

    getarray(a);

    starttime();

    int i = 0;
    while (i < 100){
        spmv(n, x, y, v, a, b);
        spmv(n, x, y, v, b, a);
        i=i+1;
    }
    stoptime();
    putarray(n, b);
    return 0;
}
