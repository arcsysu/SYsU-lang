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
int n, m, fa[100005];
void init(){
	int i = 1;
	while (i <= n){
		fa[i] = i;
		i = i + 1;
	}
}
int find(int x){
	if (fa[x] == x) return x;
	else{
		int pa = find(fa[x]);
		fa[x] = pa;
		return pa;
	}
}
int same(int x, int y){
	if (find(x) == find(y)) return 1;
	return 0;
}
int main(){
	n = quick_read(); m = quick_read();
	init();
	while (m){
		int ch = getch();
		while (ch != 81 && ch != 85){
			ch = getch();
		}
		if (ch == 81){ // query
			int x = quick_read(), y = quick_read();
			putint(same(x, y));
			putch(10);
		}else{ // union
			int x = find(quick_read()), y = find(quick_read());
			fa[x] = y;
		}
		m = m - 1;
	}
	return 0;
}