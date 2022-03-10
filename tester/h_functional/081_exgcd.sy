int exgcd(int a,int b,int x[],int y[]) {
	if(b == 0) {
		x[0] = 1;
		y[0] = 0; 
		return a;			
	}
	else {
		int r = exgcd(b, a % b, x, y);		
		int t = x[0];
		x[0] = y[0];
		y[0] = (t - a / b * y[0]);
		return r;
	}
} 

int main() {
	int a = 7, b = 15, x[1] = {1}, y[1] = {1};
	exgcd(a, b, x, y);
	x[0] = (x[0] % b + b) % b;
	putint(x[0]);
	return 0;
}