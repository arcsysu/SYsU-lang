
int foo()
{
    int arr[16] = {0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3};

    int a = 3, b = 7, c = 5, d = 6, e = 1, f = 0, g = 3, h = 5,
        i = 4, j = 2, k = 7, l = 9, m = 8, n = 1, o = 4, p = 6;

    int sum1 = a + b + c + d + e + f + g + h;
    int sum2 = i + j + k + l + m + n + o + p;

    return sum1 + sum2 + arr[a];
}

int main()
{
    int a = 3, b = 7, c = 5, d = 6, e = 1, f = 0, g = 3, h = 5,
        i = 4, j = 2, k = 7, l = 9, m = 8, n = 1, o = 4, p = 6;

    int sum1 = a + b + c + d + e + f + g + h;
    int sum2 = i + j + k + l + m + n + o + p;

    sum1 = sum1 + foo();

    int q = 4, r = 7, s = 2, t = 5, u = 8, v = 0, w = 6, x = 3;

    sum2 = sum2 + foo();

    a = i; b = j; c = k; d = l;
    e = m; f = n; g = o; h = p;

    int sum3 = q + r + s + t + u + v + w + x;

    int sum = sum1 + sum2 + sum3;

    putint(sum);
    putch(10);
    return 0;
}
