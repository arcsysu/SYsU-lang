int palindrome(int n)
{
    int a[4];
    int j;
    int flag;
    j=0;
    while(j<4)
    {
        a[j]=n%10;
        n=n/10;
        j=j+1;
    }

    if(a[0]==a[3] && a[1]==a[2])
	{
		flag=1;
	}else{
		flag=0;
	}
	return flag;
}

int main()
{
    int test;
    test=1221;
    int flag;
    flag=palindrome(test);
    if(flag==1)
        putint(test);
    else
    {
        flag = 0;
        putint(flag);
    }

    flag = 10;
    putch(flag);

    return 0;
    
}
