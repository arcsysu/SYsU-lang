int main(){
    int a[5][5] = {1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 4, 4, 4, 4, 4, 5, 5, 5, 5, 5};
    int m, n, i, j;
    m = 2;
    n = 3;
    j = 0;
    while(j < 5){
        i = a[m-1][j];
        a[m-1][j] = a[n-1][j];
        a[n-1][j] = i;
        j = j + 1;
    }
    return a[2][0];
}