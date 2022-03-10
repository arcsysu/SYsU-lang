int climbStairs(int n) {
    if(n < 4)
        return n;
    int dp[10];
    dp[0] = 0;
    dp[1] = 1;
    dp[2] = 2;
    int i;
    i = 3;
    while(i<n+1){
        dp[i] = dp[i-1] + dp[i-2];
        i = i + 1;
    }
    return dp[n];
}
int main(){
    int res;
    int n;
    n=5;
    res = climbStairs(n);
    return res;
}