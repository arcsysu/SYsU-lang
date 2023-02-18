int a, b, d;

int set_a(int val) { a = val; return a; }
int set_b(int val) { b = val; return b; }
int set_d(int val) { d = val; return d; }

int main()
{
    a = 2; b = 3;
    if (set_a(0) && set_b(1)) {}
    putint(a); putch(32);
    putint(b); putch(32);

    a = 2; b = 3;
    if (set_a(0) && set_b(1)) ;
    putint(a); putch(32);
    putint(b); putch(10);

    const int c = 1;
    d = 2;
    if (c >= 1 && set_d(3)) ;
    putint(d); putch(32);
    if (c <= 1 || set_d(4)) {}
    putint(d); putch(10);

    if (16 >= (3 - (2 + 1))) { putch(65); }
    if ((25 - 7) != (36 - 6 * 3)) putch(66);
    if (1 < 8 != 7 % 2) { putch(67); }
    if (3 > 4 == 0) { putch(68); }
    if (1 == 0x66 <= 077) putch(69);
    if (5 - 6 == -!0) putch(70);
    putch(10);

    int i0 = 0, i1 = 1, i2 = 2, i3 = 3, i4 = 4;
    while (i0 && i1) putch(32);
    if (i0 || i1) putch(67);
    if (i0 >= i1 || i1 <= i0) putch(72);
    if (i2 >= i1 && i4 != i3) { putch(73); }
    if (i0 == !i1 && i3 < i3 || i4 >= i4) { putch(74); }
    if (i0 == !i1 || i3 < i3 && i4 >= i4) putch(75);
    putch(10);

    return 0;
}
