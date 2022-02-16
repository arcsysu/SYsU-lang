int ints[10000];
int intt;
int chas[10000];
int chat;
int i=0, ii=1;
int c;
int get[10000];
int get2[10000];

int isdigit(int x) {
    if (x >= 48 && x <= 57)
        return 1;
    return 0;
}

int power(int b, int a) {
    int result = 1;
    while (a != 0) {
        result = result * b;
        a = a - 1;
    }
    return result;
}

int getstr(int get[]) {
    int x = getch();
    int length = 0;
    while (x != 13 && x != 10) {
        get[length] = x;
        length = length + 1;
        x = getch();
    }
    return length;
}

void intpush(int x)
{
    intt = intt + 1;
    ints[intt] = x;
}
void chapush(int x)
{
    chat = chat + 1;
    chas[chat] = x;
}
int intpop()
{
    intt = intt - 1;
    return ints[intt + 1];
}
int chapop()
{
    chat = chat - 1;
    return chas[chat + 1];
}
void intadd(int x)
{
    ints[intt] = ints[intt] * 10;
    ints[intt] = ints[intt] + x;
}

int find()
{
    c = chapop();
    get2[ii] = 32;
    get2[ii + 1] = c;
    ii = ii + 2;
    if (chat == 0) return 0;
    return 1;
}

int main()
{
    intt=0;
    chat=0;
    int lengets = getstr(get);
    while (i < lengets)
    {
        if (isdigit(get[i]) == 1)
        {
            get2[ii] = get[i];
            ii = ii + 1;
        }
        else
        {
            if(get[i] == 40) chapush(40);
            if(get[i] == 94) chapush(94);
            if(get[i] == 41)
            {
                c = chapop();
                while (c != 40)
                {
                    get2[ii] = 32;
                    get2[ii + 1]=c;
                    ii = ii + 2;
                    c = chapop();
                }
            }
            if (get[i] == 43)
            {
                while (chas[chat] == 43 || chas[chat] == 45 || chas[chat] == 42 || chas[chat] == 47 || chas[chat] == 37 || chas[chat] == 94)
                {
                    if (find()==0)break;
                }
                chapush(43);
            }
            if (get[i] == 45)
            {
                while (chas[chat] == 43 || chas[chat] == 45 ||chas[chat] == 42 || chas[chat] == 47 || chas[chat] == 37 || chas[chat] == 94)
                {
                    if(find()==0)break;
                }
                chapush(45);
            }
            if(get[i] == 42)
            {
                while (chas[chat] == 42 || chas[chat] == 47 ||chas[chat] == 37 || chas[chat] == 94)
                {
                    if (find()==0)break;
                }
                chapush(42);
            }
            if (get[i] == 47)
            {
                while (chas[chat] == 42 || chas[chat] == 47 || chas[chat] == 37 || chas[chat] == 94)
                {
                    if (find()==0)break;
                }
                chapush(47);
            }
            if (get[i] == 37)
            {
                while (chas[chat] == 42 || chas[chat] == 47 || chas[chat] == 37 || chas[chat] == 94)
                {
                    if (find()==0)break;
                }
                chapush(37);
            }
            get2[ii] = 32;
            ii = ii + 1;
        }
        i = i + 1;
    }
    while(chat > 0)
    {
        int c = chapop();
        get2[ii] = 32;
        get2[ii + 1]=c;
        ii = ii + 2;
    }
    get2[ii]= 64;
    i = 1;
    while (get2[i] != 64)
    {
        if (get2[i] == 43 || get2[i] == 45 || get2[i] == 42 || get2[i] == 47 || get2[i] == 37 || get2[i] == 94)
        {
            int a=intpop();int b=intpop();int c;
            if (get2[i] == 43) c = a + b;
            if (get2[i] == 45) c = b - a;
            if (get2[i] == 42) c = a * b;
            if (get2[i] == 47) c = b / a;
            if (get2[i] == 37) c = b % a;
            if (get2[i] == 94) c = power(b,a);
            intpush(c);
        }
        else
        {
            if(get2[i] != 32)
            {
                intpush(get2[i] - 48);
                ii=1;
                while(get2[i+ii] != 32)
                {
                    intadd(get2[i+ii] - 48);
                    ii = ii + 1;
                }
                i = i + ii-1;
            }
        }
        i = i + 1;
    }
    putint(ints[1]);
    return 0;
}
