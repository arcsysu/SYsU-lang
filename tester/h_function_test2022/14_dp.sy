int t[1005][2] = { 0 }, dp[1005][35] = { 0 };
int main()
{
	int T, W, x, i, j;
    T = getint();
    W = getint();
	i = 1;
	while (i <= T) {
		x = getint();
		t[i][x % 2] = 1;
		dp[i][0] = dp[i - 1][0] + t[i][1];
		i = i + 1;
	}

	i = 1;
	while (i <= T) {
		j = 1;
		while (j <= W) {
			if (dp[i - 1][j] + t[i][(j + 1) % 2] > dp[i - 1][j - 1] + t[i][(j + 1) % 2]) {
				dp[i][j] = dp[i - 1][j] + t[i][(j + 1) % 2];
			}
			else {
				dp[i][j] = dp[i - 1][j - 1] + t[i][(j + 1) % 2];
			}
			j = j + 1;
		}
		i = i + 1;
	}

	int res = 0;
	j = 0;
	while (j <= W) {
		if (res < dp[T][j]) {
			res = dp[T][j];
		}
		j = j + 1;
	}

	return res;
}

