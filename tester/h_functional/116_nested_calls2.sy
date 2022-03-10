int f(int a, int b) {
	return a * b;
}

int g(int a, int b) {
	return a % b;
}

int h(int a, int b) {
	return f(f(2, g(a, b)), g(f(a, b), 4));
}

int main () {
	putint(h(11, 3));
	return 0;
}