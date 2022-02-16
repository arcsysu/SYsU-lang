const int max = 1073741824;
int checkrange(int num){
    while (num > max) num = num - max;
    while (num < 0) num = num + max;
    return num;
}

int reduce(int kernelid, int x, int y){
    if (kernelid == 0) 
        return checkrange(x+y);
    if (kernelid == 1) {
        // x ^ y;
        int ret = 0;
        int i = 1;
        while (i < max){
            if (x / i % 2 == y / i % 2) 
                ret = ret * 2;
            else
                ret = ret * 2 + 1;
            i = i * 2;
        }
        return ret;
    }
    if (kernelid == 2)
        if (x > y) return x;
        else return y;
    if (kernelid == 3){
        // return x | y;

        int ret = 0;
        int i = 1;
        while (i < max){
            if (x / i % 2 == 1 || y / i % 2 == 1)
                ret = ret * 2 + 1;
            else 
                ret = ret * 2;
            i = i * 2;
        }
        return ret;
    }
    if (kernelid == 4){
        // return x & y;
        int ret = 0;
        int i = 1;
        while (i < max){
            if (x / i % 2 == 1 && y / i % 2 == 1)
                ret = ret * 2 + 1;
            else 
                ret = ret * 2;
            i = i * 2;
        }
        return ret;
    }
    return 0;
}

int getvalue(int array[], int n, int m, int x, int y){
    if (x < 0 || y < 0 || x >= n || y >= m) return 0;
    return array[x * m + y];
}

int convn(int kernelid, int input[], int output[], int n, int m, int c){
    int i = 0;
    int j = 0;
    int x, y, curr;
    const int true = 1;
    while (true == true){
        j = 0;
        while (true == true){
            curr = 0;
            x = i - c / 2;
            while (true == true){
                y = j - c / 2;
                while (true == true){
                    curr = reduce(kernelid, curr, getvalue(input, n, m, x, y));
                    y = y + 1;
                    if (y >= j + c / 2) break;
                }
                x = x + 1;
                if (x >= i + c / 2) break;
            }
            output[i * m + j] = curr;
            j = j + 1;
            if (j >= m) break;
        }
        i = i + 1;
        if (i >= n) break;
    }
    return 0;
}

int a[10000000];
int b[10000000];
int kernelid[10000];

void memmove(int dst[], int src[], int n){
    int i = 0;
    while (i < n){
        dst[i] = src[i];
        i = i + 1;
    }
}

int main(){
    int c = getint(), n = getint(), m = getint();
    getarray(a);
    int task = getarray(kernelid);
    
    starttime();
    int i = 0;
    while (i < task){
        convn(kernelid[i], a, b, n, m, c);
        memmove(a, b, n * m);
        i = i + 1;
    }
    stoptime();

    putarray(n * m, a);
    return 0;
}