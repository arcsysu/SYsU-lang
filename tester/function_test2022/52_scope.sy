int a = 7;

int func() {
	int b = a;
	int a = 1;
	if (a == b) {
		a = a + 1;
		return 1;
	}
	else
		return 0;
}

int main() {
	int result = 0;
	int i = 0;
	while (i < 100) {
		if (func() == 1)
			result = result + 1;
		i = i + 1;
	}
	if (result < 100)
		putint(1);
	else
		putint(0);
	return 0;
}
