int set(int a[], int pos, int d){
    const int bitcount = 30;
    int x[bitcount + 1] = {};

    x[0] = 1;
    x[1] = x[0] * 2;
    x[2] = x[1] * 2;
    x[3] = x[2] * 2;
    x[4] = x[3] * 2;
    x[5] = x[4] * 2;
    x[6] = x[5] * 2;
    x[7] = x[6] * 2;
    x[8] = x[7] * 2;
    x[9] = x[8] * 2;
    x[10] = x[9] * 2;
    
    int i = 10;
    while (i < bitcount){
        i = i + 1;
        x[i] = x[i - 1] * 2;
    }

    int v = 0;

    if (pos / bitcount >= 10000) return 0;
    
    if (a[pos / bitcount] / (x[pos % bitcount]) % 2 != d){
        if (a[pos / bitcount] / (x[pos % bitcount]) % 2 == 0)
            if (d == 1)
                v = x[pos % bitcount];
        
        if (a[pos / bitcount] / x[pos % bitcount] % 2 == 1)
            if (d == 0)
                v = v - x[pos % bitcount];
    }

    a[pos / bitcount] = a[pos / bitcount] + v;
    return 0;
}

int seed[3] = {19971231, 19981013, 1000000000 + 7};
int staticvalue = 0;

int rand(){
    staticvalue = staticvalue * seed[0] + seed[1];
    staticvalue = staticvalue % seed[2];
    if (staticvalue < 0) staticvalue = seed[2] + staticvalue;
    return staticvalue;
}

int a[10000] = {};
int main(){
    
    int n = getint();
    staticvalue = getint();
    starttime();
    int x, y;
    while (n > 0){
        n = n - 1;
        x = rand() % 300000;
        y = rand() % 2;
        set(a, x, y);
    }
    stoptime();
    putarray(10000, a);
    return 0;
}