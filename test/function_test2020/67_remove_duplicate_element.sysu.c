int removeElement(int nums[], int n, int val) {
    int i;
    i = 0;
    while (i < n) {
        if (nums[i] == val) {
            nums[i] = nums[n - 1];
            n = n - 1;
        } else {
            i = i + 1;
        }
    }
    return n;
}    
int main(){
    int res;
    int a[10];
    a[0]=3;a[1]=3;a[2]=9;a[3]=0;a[4]=0;
    a[5]=1;a[6]=1;a[7]=5;a[8]=7;a[9]=8;
    res = 10;
    int val;
    val = 3;
    res = removeElement(a, res, val);
    return res;
}