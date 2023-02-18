
void get_next(int str[], int next[])
{
    next[0] = -1;
    int i = 0, j = -1;
    while (str[i]) {
        if (j == -1 || str[i] == str[j]) {
            j = j + 1;
            i = i + 1;
            next[i] = j;
        }
        else
            j = next[j];
    }
}

int KMP(int dst[], int src[])
{
    int next[4096];
    get_next(dst, next);

    int i = 0, j = 0;
    while (src[j]) {
        if (dst[i] == src[j]) {
            i = i + 1;
            j = j + 1;
            if (!dst[i]) {
                return j;
            }
        } else {
            i = next[i];
            if (i == -1) {
                i = i + 1;
                j = j + 1;
            }
        }
    }
    return -1;
}

int read_str(int buf[])
{
    int i = 0;
    while (1) {
        buf[i] = getch();
        if (buf[i] == 10)
            break;
        i = i + 1;
    }
    buf[i] = 0;
    return i;
}

int main()
{
    int dst[4096], src[4096];
    read_str(dst);
    read_str(src);
    putint(KMP(dst, src));
    putch(10);
    return 0;
}