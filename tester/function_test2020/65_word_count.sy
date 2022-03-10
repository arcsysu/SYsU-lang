// Count all the word in the string

int wc(int string[], int n) {
    int inWord;
    int i;
    int count;
    i = 0;
    inWord = 0;
    count = 0;
    while (i < n) {
        if (string[i] != 32) {
            if (inWord == 0) {
                count = count + 1;
                inWord = 1;
            }
        } else {
            inWord = 0;
        }
        i = i + 1;
    }
    return count;
}

int main() {
    int string[500];
    int temp;
    int i;
    i = 0;
    temp = 0;
    while (temp != 10) {
        temp = getch();
        string[i] = temp;
        i = i + 1;
    }
    temp = wc(string, i);
    putint(temp);
    return 0;
}
