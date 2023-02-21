const int ascii_0 = 48;

int my_getint()
{
    int sum = 0, c;

    while (1) {
        c = getch() - ascii_0;
        if (c < 0 || c > 9) {
            continue;
        } else {
            break;
        }
    }
    sum = c;

    while (1) {
        c = getch() - ascii_0;
        if (c >= 0 && c <= 9) {
            sum = sum * 10 + c;
        } else {
            break;
        }
    }

    return sum;
}

void my_putint(int a)
{
    int b[16], i = 0;
    while (a > 0) {
        b[i] = a % 10 + ascii_0;
        a = a / 10;
        i = i + 1;
    }
    while (i > 0) {
        i = i - 1;
        putch(b[i]);
    }
}

int main()
{
    int n = my_getint();
    while (n > 0) {
        int m = my_getint();
        my_putint(m); putch(10);
        n = n - 1;
    }
    return 0;
}
