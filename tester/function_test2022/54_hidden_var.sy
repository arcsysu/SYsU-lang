
int b = 5;
int c[4] = {6, 7, 8, 9};

int main()
{
    int a;
    a = 1;
    {
        int a;
        a = 2;
        {
            a = 3;
            putint(a);
        }
        putint(a);
    }
    putint(a); putch(10);

    while (a < 5) {
        int a = 0;
        a = a + 1;
        if (a)
            break;
    }
    putint(a); putch(10);

    {
        {
            {
                {}
            }
            c[2] = 1;
            {
                int c[2][8] = {{0, 9}, 8, 3};
            }
        }
    }

    {
        int b = 2;
        if (c[2]) {
            int c[7][1][5] = {{}, {}, {2, 1, 8}, {{}}};
            putint(c[b][0][0]);
            putint(c[b][0][1]);
            putint(c[b][0][2]);
        }
    }
    putch(10);

    putint(b); putch(10);
    putint(c[0]); putint(c[1]); putint(c[2]); putint(c[3]); putch(10);
    return 0;
}
