const int N = 1024;

void mm(int n, int A[][N], int B[][N], int C[][N]){
    int i, j, k;

    i = 0; j = 0;
    while (i < n){
        j = 0;
        while (j < n){
            C[i][j] = 0;
            j = j + 1;
        }
        i = i + 1;
    }

    i = 0; j = 0; k = 0;

    while (k < n){
        i = 0;
        while (i < n){
            if (A[i][k] == 0){
                i = i + 1;
                continue;
            }
            j = 0;
            while (j < n){
                C[i][j] = C[i][j] + A[i][k] * B[k][j];
                j = j + 1;
            }
            i = i + 1;
        }
        k = k + 1;
    }
}

int A[N][N];
int B[N][N];
int C[N][N];

int main(){
    int n = getint();
    int i, j;

    i = 0;
    j = 0;
    while (i < n){
        j = 0;
        while (j < n){
            A[i][j] = getint();
            j = j + 1;
        }
        i = i + 1;
    }
    i = 0;
    j = 0;
    while (i < n){
        j = 0;
        while (j < n){
            B[i][j] = getint();
            j = j + 1;
        }
        i = i + 1;
    }

    starttime();

    i = 0;
    while (i < 5){    
        mm(n, A, B, C);
        mm(n, A, C, B);
        i = i + 1;
    }

    int ans = 0;
    i = 0;
    while (i < n){
        j = 0;
        while (j < n){
            ans = ans + B[i][j];
            j = j + 1;
        }
        i = i + 1;
    }
    stoptime();
    putint(ans);
    putch(10);

    return 0;
}
