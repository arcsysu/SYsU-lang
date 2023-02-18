
void move(int x, int y)
{
    putint(x); putch(32); putint(y); putch(44); putch(32);
}

void hanoi(int n, int one, int two, int three)
{
    if (n == 1)
        move(one, three);
    else {
        hanoi(n - 1, one, three, two);
        move(one, three);
        hanoi(n - 1, two, one, three);
    }
}

int main()
{
    int n = getint();
    while (n > 0) {
        hanoi(getint(), 1, 2, 3);
        putch(10);
        n = n - 1;
    }
    return 0;
}
