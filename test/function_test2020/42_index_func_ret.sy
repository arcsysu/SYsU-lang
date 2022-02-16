// Use return value of a function as array's index
int _getMaxOfAll(int result[], int size) {
    int maxNum;
    maxNum = -999999;
    size = size - 1;
    while(size > -1) {
        if (result[size] > maxNum) {
            maxNum = result[size];
        }
        size = size - 1;
    }
    return maxNum;
}

int main() {
    int result[3];
    result[0] = -2;
    result[1] = 2;
    result[2] = -7;
    int x;
    x = result[_getMaxOfAll(result, 3)];
    putint(x);
    return 0;
}
