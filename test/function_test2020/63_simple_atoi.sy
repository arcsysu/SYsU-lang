// Simple atoi program
int atoi_(int src[]) {
    int s;
    s = 0;
    int isMinus;
    isMinus = 1;
    int i;
    i = 0;
    while(src[i] == 32) { // 跳过空白符
        i = i + 1; 
    }

    if(src[i] == 43 || src[i] == 45) {
        if(src[i] == 45) {
            isMinus = -1;
        }
        i = i + 1;
    } else if (src[i] < 48 || src[i] > 57) {
        //如果第一位既不是符号也不是数字，直接返回异常值
        s = 2147483647;
        return s;
    }

    while (src[i] != 0 && src[i] > 47 && src[i] < 58) {
        s = s * 10 + src[i] - 48;
        i = i + 1;
    }
    return s * isMinus;
}

int main () {
    int string[500];
    int temp;
    temp = 0;
    int i;
    i = 0;
    while (temp != 10) {
        temp = getch();
        string[i] = temp;
        i = i + 1;
    }
    string[i] = 0;
    i = atoi_(string);
    putint(i);
    return 0;
}

