int maxArea(int height[], int n) {
    int i;
    int j;
    i = 0;
    j = n - 1;
    int max_val;
    max_val = -1;
    while(i < j){
        int area;
        if(height[i] < height[j])
            area = (j - i) * height[i];
        else
            area = (j - i) * height[j];
        if(area > max_val){
            max_val = area;
        }
        if(height[i] > height[j])
            j = j - 1;
        else
            i = i + 1;
    }
    return max_val;
}

int main(){
    int res;
    int a[10];
    a[0]=3;a[1]=3;a[2]=9;a[3]=0;a[4]=0;
    a[5]=1;a[6]=1;a[7]=5;a[8]=7;a[9]=8;
    res = 10;
    res = maxArea(a, res);
    return res;
}