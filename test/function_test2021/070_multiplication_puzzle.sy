int a[6]={10,1,50,50,20,5};
int dp[10][10];
int main()
{
	int n;
	n=6;

	int k,i,t,j,aa;
	k=3;
	while(k<=n)
	{
		i=0;
		while(i<n-k+1)
		{
			j=i+k-1;
			t=i+1;
			while(t<j)
			{
				aa= dp[i][t]+dp[t][j]+a[i]*a[t]*a[j];
				if(!dp[i][j]||aa<dp[i][j])
				{
					dp[i][j]=aa;
				}
				t=t+1;
			}
			i=i+1;
		}
		k=k+1;
	}
	putint(dp[0][n-1]);
	return 0;
}
