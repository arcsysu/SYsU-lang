
int gcd(int m, int n)
{
    if (n == 0) {
        return m;
    }
    return gcd(n, m % n);
}

int main()
{
    int k = getint();
    while (k > 0) {
        int a = getint(), b = getint();
        putint(gcd(a, b)); putch(10);
        k = k - 1;
    }
    return 0;
}
