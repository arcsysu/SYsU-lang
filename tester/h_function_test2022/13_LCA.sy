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
const int maxn = 10005;
int n, m, f[maxn][20], dep[maxn];
int to[maxn], next[maxn], head[maxn], cnt = 0;
void add_edge(int from, int To){
	to[cnt] = To;
	next[cnt] = head[from];
	head[from] = cnt;
	cnt = cnt + 1;
	f[To][0] = from;
}
void init(){
	dep[0] = 0x3f3f3f3f;
	int i = 1;
	while (i <= n){
		head[i] = -1;
		i = i + 1;
	}
}
void tree(int x, int d){
	dep[x] = d;
	int i = 0;
	while (f[x][i]){
		f[x][i + 1] = f[f[x][i]][i];
		i = i + 1;
	}
	i = head[x];
	while (i != -1){
		int y = to[i];
		tree(y, d + 1);
		i = next[i];
	}
}
int LCA(int x, int y){
	if (dep[x] < dep[y]){
		int t = x;
		x = y;
		y = t;
	}
	int i = 19;
	while (dep[x] > dep[y]){
		if (f[x][i] && dep[f[x][i]] >= dep[y])
			x = f[x][i];
		i = i - 1;
	}
	if (x == y) return x;
	i = 19;
	while (i >= 0){
		if (f[x][i] != f[y][i]){
			x = f[x][i];
			y = f[y][i];
		}
		i = i - 1;
	}
	return f[x][0];
}
int main(){
	n = quick_read(); m = quick_read();
	init();
	int i = 1;
	while (i != n){
		int x = quick_read(), y = quick_read();
		add_edge(x, y);
		i = i + 1;
	}
	tree(1, 1);
	while (m){
		int x = quick_read(), y = quick_read();
		putint(LCA(x, y));
		putch(10);
		m = m - 1;
	}
	return 0;
}
