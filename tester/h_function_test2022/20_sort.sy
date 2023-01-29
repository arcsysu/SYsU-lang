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
int n;
const int maxn = 100005;
void sortA(int a[]){
	int i = 0, j;
	while (i < n){
		j = i + 1;
		while (j < n){
			if (a[i] > a[j]){
				int t = a[i];
				a[i] = a[j];
				a[j] = t;
			}
			j = j + 1;
		}
		i = i + 1;
	}
}
int cnt[maxn*4];
void sortB(int a[]){
	int i = 0, mx = -100;
	while (i < n){
		cnt[a[i]] = cnt[a[i]] + 1;
		if (a[i] > mx) mx = a[i];
		i = i + 1;
	}
	i = 0; int now = 0;
	while (i <= mx){
		int j = cnt[i];
		while (j){
			a[now] = i;
			now = now + 1;
			j = j - 1;
		}
		i = i + 1;
	}
}
void sortC(int a[]){
	int i = 0;
	while (i < n){
		int id = i, j = i + 1;
		while (j < n){
			if (a[j] < a[id])
				id = j;
			j = j + 1;
		}
		int t = a[i];
		a[i] = a[id];
		a[id] = t;
		i = i + 1;
	}
}
int x[maxn];
int a[maxn], b[maxn], c[maxn];
int main(){
	n = quick_read();
	int i = 0;
	while (i != n){
		a[i] = quick_read();
		b[i] = a[i];
		c[i] = b[i];
		i = i + 1;
	}
	sortA(a);
	sortB(b);
	sortC(c);
	i = 0;
	while (n - i){
		b[i] = b[i] - a[i];
		c[i] = c[i] - b[i] - a[i];
		i = i + 1;
	}
	i = 0;
	while (i - n){
		if (b[i]) return 1;
		if (c[i]) return 2;
		i = i + 1;
	}
	return -123;
}
