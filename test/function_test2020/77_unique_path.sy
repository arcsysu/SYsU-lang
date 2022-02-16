int uniquePaths(int m, int n) {
    if(m == 1 || n == 1)
        return 1;

    int dp[9];
    int i;
    int j;
    i = 0;
    while(i<m){
        dp[i*3+n-1]=1;
        i = i + 1;
    }
    i = 0;
    while(i<n){
        dp[(m-1)*3+i]=1;
        i = i + 1;
    }
    i=m-2;
    while(i > -1){
        j=n-2;
        while(j > -1){
            dp[i*3+j] = dp[(i+1)*3+j] + dp[i*3+j+1];
            j = j - 1;
        }
        i = i - 1;
    }
    return dp[0];
}
int main(){
    int res;
    int n;
    n=3;
    res = uniquePaths(n, n);
    return res;
}