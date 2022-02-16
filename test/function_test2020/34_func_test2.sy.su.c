int func1() {
	int a;
	a = 1;
	return a;
}

int func2() {
	int a;
	a = 2;
	return a;
}

int func3() {
	int a;
	a = 4;
	return a;
}

int func4() {
	int a;
	{
		int b;
		b = 8;
		a = b;
	}
	{
		int b;
		b = 16;
		a = a + b;
	}
	return a;
}

int main() {
	int a;
	int b;
	int c;
	a = 32;
	b = 32;
	c = 32;

	return func1() + func2() + func3() + func4()
		+ a + b + c;
}