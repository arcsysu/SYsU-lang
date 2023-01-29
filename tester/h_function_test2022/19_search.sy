const int INF = 1073741824;
int a[30][30];
int step[4][2] = { {1,0},{-1,0},{0,1},{0,-1} };
int w, h, x_0, y_0, x_1, y_1;

int search(int x, int y, int n)
{
	if (n > 10)
		return INF;
	int num = INF;
	int i = 0;
	while (i < 4) {
		int coun = 0;
		int x2 = x, y2 = y;
		while (a[x2][y2] != 1) {
			if (x2 == x_1 && y2 == y_1) break;
			x2 = x2 + step[i][0];
			y2 = y2 + step[i][1];
			coun = coun + 1;
		}
		if (x2 == x_1 && y2 == y_1)
			return  1;
		if (coun <= 1) {
			i = i + 1;
			continue;
		}
		if (x2 == 0 || x2 == h + 1 || y2 == 0 || y2 == w + 1) {
			i = i + 1;
			continue;
		}
		a[x2][y2] = 0;
		int searchResult = search(x2 - step[i][0], y2 - step[i][1], n + 1) + 1;
		if (searchResult < num)
			num = searchResult;
		a[x2][y2] = 1;
		i = i + 1;
	}

	if (num > 10)
		return  INF;
	return  num;
}

int main()
{
	w = getint();
	h = getint();
	while (w != 0) {
		int i, j;
		i = 0;
		while (i < 30) {
			j = 0;
			while (j < 30) {
				a[i][j] = 1;
				j = j + 1;
			}
			i = i + 1;
		}
		i = 1;
		while (i <= h) {
			j = 1;
			while (j <= w) {
				a[i][j] = getint();
				if (a[i][j] == 2) {
					x_0 = i;
					y_0 = j;
				}
				else if (a[i][j] == 3) {
					x_1 = i;
					y_1 = j;
				}
				j = j + 1;
			}
			i = i + 1;
		}
		int res = search(x_0, y_0, 1);
		if (res <= 10) {
			putint(res);
			putch(10);
		}
		else {
			putint(-1);
			putch(10);
		}
		w = getint();
		h = getint();
	}
	return 0;
}
