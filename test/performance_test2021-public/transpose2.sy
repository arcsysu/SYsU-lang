int matrix[20000000];
int a[100000];

int transpose(int n, int matrix[], int rowsize){
    int colsize = n / rowsize;
    int i = 0;
    int j = 0;
    while (i < colsize){
        j = 0;
        while (j < rowsize){
            if (i < j){
                j = j + 1;
                continue;
            }
            int curr = matrix[i * rowsize + j];
            matrix[j * colsize + i] = matrix[i * rowsize + j];
            matrix[i * rowsize + j] = curr;
            j = j + 1;
        }
        i = i + 1;
    }
    return -1;
}

int main(){
    int n = getint();
    int len = getarray(a);
    starttime();
    int i = 0;
    while (i < n){
        matrix[i] = i;
        i = i + 1;
    }
    i = 0;
    while (i < len){
        transpose(n, matrix, a[i]);
        i = i + 1;
    }

    int ans = 0;
    i = 0;
    while (i < len){
        ans = ans + i * i * matrix[i];
        i = i + 1;
    }
    if (ans < 0) ans = -ans;
    stoptime();
    putint(ans);
    putch(10);
    return 0;
}