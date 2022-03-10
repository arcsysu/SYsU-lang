int V[200][200]={};
int KnapSack(int n, int w[], int v[], int x[], int C)
{
    int i, j;
    i=1;
    while(i<=n)
    {
    	j=0;
    	while(j<C+1)
    	{
    		if (j<w[i])
                V[i][j] = V[i - 1][j];
            else
            {
            	int tmp1=V[i - 1][j];
            	int tmp2=V[i - 1][j - w[i]] + v[i];
            	if(tmp1>tmp2)
            	{
            		V[i][j] = tmp1;
				}
				else
				{
					V[i][j] = tmp2;
				}
            	
			}
    		j=j+1;
		}
		i=i+1;
	}
    
    j = C;
    i=n;
    while(i>=1)
    {
    	if (V[i][j]>V[i - 1][j])
        {
            x[i] = 1;
            j = j - w[i];
        }
        else
        {
		 
            x[i] = 0;
        } 
        i=i-1;
	}
    return V[n][C];
}

int main()
{
    int s;
    int w[6] = {0,2,2,6,5,4};
    int v[6] = {0,6,3,5,4,6};
    int x[6];
    int n = 5;
    int C=10;
    s = KnapSack(n, w, v, x, C);
    putint(s);
    return 0;

}
