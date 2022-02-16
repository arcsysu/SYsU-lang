// duplicate names with global array variables and local int variable
int a[2];

int func(int array[]) {
	a[0] = 1;
	return array[3 - a[0]];
}

int main() {
	int a;
	int array[3];
	array[0] = (-1);
	array[1] = 4;
	array[2] = 8;
	a = func(array);
	return (a + array[1]);
}