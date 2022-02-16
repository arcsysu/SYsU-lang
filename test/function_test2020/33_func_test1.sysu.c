int a;

int myFunc(int a, int b, int c) {
	a = 2;
	{
		int c;
		c = 0;
		if (c != 0) {
			return 0;
		}
	}
	while (b > 0) {
		b = b - 1;
	}
	return (a)+(b);
}

int main() {
	a = (3);
	int b;
	b = myFunc(1, 2, 1);
	return ((a+b));
}