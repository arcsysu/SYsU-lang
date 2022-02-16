int maxSubArray(int nums[], int n) {
    if(n == 0)
        return 0;
    if(n == 1)
        return nums[0];
    int sum;
    sum = nums[0];
    int max;
    max = sum;
    int i;
    i = 1;
    while(i < n){
        if(sum < 0)
            sum = 0;
        sum = sum + nums[i];
        if(max < sum)
            max = sum;
        i = i + 1;
    }
    return max;
}
int main(){
    int res;
    int a[10];
    a[0]=-4;a[1]=3;a[2]=9;a[3]=-2;a[4]=0;
    a[5]=1;a[6]=-6;a[7]=5;a[8]=7;a[9]=8;
    res = 10;
    res = maxSubArray(a, res);
    return res;
}