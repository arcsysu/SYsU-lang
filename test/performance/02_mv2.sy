int x;  

const int N = 2010;

void mv(int n, int A[][N], int b[], int res[]){
    int x, y;
    y = 0;
    x = 11;
    int i, j;

    i = 0;
    while(i < n){    
        res[i] = 0;        
        i = i + 1;
    }

    i = 0;
    j = 0;
    while (i < n){
        j = 0;
        while (j < n){
            if (A[i][j] == 0){
                x = x * b[i] + b[j];
                y = y - x;
            }else{
                res[i] = res[i] + A[i][j] * b[j];
            }
            j = j + 1;
        }
        i = i + 1;
    }    
}

int A[N][N];
int B[N];
int C[N];

int main(){
    int n = getint();
    int i, j;

    i = 0;

    while (i < n){
        j = 0;
        while (j < n){
            A[i][j] = getint();
            j = j + 1;
        }
        i = i + 1;
    }

    i = 0;
    while (i < n){
        B[i] = getint();
        i = i + 1;
    }

    starttime();

    i = 0;
    while (i < 50){
        mv(n, A, B, C);
        mv(n, A, C, B);
        i = i + 1;
    }
    stoptime();

    putarray(n, C);
    return 0;
}