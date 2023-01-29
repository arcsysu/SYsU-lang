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
int n, m;
const int maxn = 1005;
const int maxm = 5005;
int to[maxm], next[maxm], head[maxn], cnt = 0;
int que[maxn], h, tail, inq[maxn];
void add_edge(int from, int To){
	to[cnt] = To;
	next[cnt] = head[from];
	head[from] = cnt;
	cnt = cnt + 1;
	to[cnt] = from;
	next[cnt] = head[To];
	head[To] = cnt;
	cnt = cnt + 1;
}
void init(){
	int i = 0;
	while (i < maxn){
		head[i] = -1;
		i = i + 1;
	}
}
void inqueue(int x){
	inq[x] = 1;
	tail = tail + 1;
	que[tail] = x;
}
int pop_queue(){
	h = h + 1;
	int res = que[h];
	return que[h];
}
int same(int s, int t){
	h = 0;
	tail = 0;
	inqueue(s);
	int res = 0;
	while (h < tail){
		int x = pop_queue();
		if (x == t) res = 1;
		int i = head[x];
		while (i != -1){
			if (!inq[to[i]]) inqueue(to[i]);
			i = next[i];
		}
	}
	int i = 0;
	while (i <= tail){
		inq[que[i]] = 0;
		i = i + 1;
	}
	return res;
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
			int x = quick_read(), y = quick_read();
			add_edge(x, y);
		}
		m = m - 1;
	}
	return 0;
}