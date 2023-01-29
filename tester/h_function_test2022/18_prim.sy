int quick_read(){
	int ch = getch(); int x = 0, f = 0;
	while (ch < 48 || ch > 57){
		if (ch == 45) f = 1;
		ch = getch();
	}
	while (ch >= 48 && ch <=57){
		x = x * 10 + ch - 48;
		ch = getch();
	}
	if (f) return -x;
	else return x;
}
const int maxm = 1005;
const int maxn = 105;
int n, m;
int u[maxm], v[maxm], c[maxm], fa[maxm];
int find(int x){
	if (x == fa[x]) return x;
	int asdf = find(fa[x]);
	fa[x] = asdf;
	return asdf;
}
int same(int x, int y){
	x = find(x);
	y = find(y);
	if (x == y) return 1;
	return 0;
}
int prim(){
	int i = 0;
	while (i < m){
		int j = i + 1;
		while (j < m){
			if (c[i] > c[j]){
				int t = u[i];
				u[i] = u[j];
				u[j] = t;
				t = v[i];
				v[i] = v[j];
				v[j] = t;
				t = c[i];
				c[i] = c[j];
				c[j] = t;
			}
			j = j + 1;
		}
		i = i + 1;
	}
	i = 1;
	while (i <= n){
		fa[i] = i;
		i = i + 1;
	}
	i = 0;
	int res = 0;
	while (i < m){
		if (same(u[i], v[i])) continue;
		res = res + c[i];
		fa[find(u[i])]=v[i];
		i = i + 1;
	}
	return res;
}
int main(){
	int n = quick_read(), m = quick_read();
	int i = 0;
	while (i < m){
		u[i] = quick_read();
		v[i] = quick_read();
		c[i] = quick_read();
		i = i + 1;
	}
	return prim();
}
