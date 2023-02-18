const int len = 20;

int main()
{
	int i, j, t, n, temp;
	int mult1[len] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 0};
	int mult2[len] = {2, 3, 4, 2, 5, 7 ,9 ,9, 0, 1, 9, 8, 7, 6, 4, 3, 2, 1, 2, 2};
	int len1 = len;
	int len2 = len;
	int c1[len + 5];
	int c2[len + 5];
	int result[len * 2] = {};

	i = 0;
	while (i < len1) {
		c1[i] = mult1[i];
		i = i + 1;
	}	

	i = 0;
	while (i < len2) {
		c2[i] = mult2[i];
		i = i + 1;
	}	

	n = len1 + len2 - 1;

	i = 0;
	while (i <= n) {
		result[i]=0;
		i = i + 1;
	}	 

	temp=0;

	i = len2 - 1;
	while (i > -1) {
		t = c2[i];
		j = len1 - 1;
		while (j > -1) {
			temp = result[n] + t * c1[j];
			if(temp >= 10) {
				result[n] = (temp);
				result[n-1] = result[n-1] + temp / 10;
			}
			else
				result[n] = temp;
			j = j - 1;
			n = n - 1;
		}
		n = n + len1 - 1;
		i = i - 1;
	}

	if(result[0] != 0)
		putint(result[0]); 

	i = 1;
	while (i <= len1 + len2 - 1) {
		putint(result[i]); 
		i = i + 1;
	}

	return 0;
}