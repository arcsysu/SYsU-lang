int lengthOfLastWord(int s[], int n) {
    if(n == 0)
        return 0;
    int c;
    c = n - 1;
    while(c > -1 && s[c] == 0){
        c = c - 1;
    }
    if(c == -1)
        return 0;
    int i;
    i = c; 
    while(i > -1){
        if(s[i] == 0)
            return n - i - 1 - (n - 1 - c);
        i = i - 1;
    }
    return c - i;
}
int main(){
    int res;
    int a[10];
    a[0]=-4;a[1]=3;a[2]=9;a[3]=-2;a[4]=0;
    a[5]=1;a[6]=-6;a[7]=5;a[8]=7;a[9]=8;
    res = 10;
    res = lengthOfLastWord(a, res);
    return res;
}