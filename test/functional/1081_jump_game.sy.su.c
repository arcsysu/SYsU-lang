int canJump(int nums[], int n) {
    if(n == 1)
        return 1;
    if(nums[0] > n - 2)
        return 1;
    int dp[10];
    int i;
    i = 0;
    while(i<n-1){
        dp[i] = 0;
        i = i +1;
    }
    dp[n - 1] = 1;
    i = n - 2;
    while(i > -1){
        int j;
        if(nums[i] < n - 1 - i){
            j = nums[i];
        }
        else
            j = n - 1 - i;
        while(j > -1){
            if(dp[i+j] != 0){
                dp[i] = 1;
            }
            j = j - 1;
        }
        i = i - 1;
    }

    return dp[0];
}
int main(){
    int res;
    int a[10];
    a[0]=3;a[1]=3;a[2]=9;a[3]=0;a[4]=0;
    a[5]=1;a[6]=1;a[7]=5;a[8]=7;a[9]=8;
    res = 10;
    res = canJump(a, res);
    return res;
}