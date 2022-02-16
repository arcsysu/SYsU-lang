// array as parameter of a function
int field[2];

int func(int array[]) {
	return array[3 - field[0]];
}

int main() {
	int i[1];
	int j[3];
	int k;

	field[0] = 1;
	field[1] = 2;


	j[0 + 0] = -1;
	j[1] = j[0] - 2;
	k = j[1];
	j[2] = 16;

	return func(j) + 2 + k;
}