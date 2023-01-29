const int MAX_SIZE = 100;
int a[MAX_SIZE][MAX_SIZE], b[MAX_SIZE][MAX_SIZE];
int res[MAX_SIZE][MAX_SIZE];
int n1, m1, n2, m2;
void matrix_multiply() {
    int i = 0;
    while (i < m1) {
        int j = 0;
        while (j < n2) {
            int k = 0;
            while (k < n1) {
                res[i][j] = res[i][j] + a[i][k] * b[k][j];
                k = k + 1;
            }
            j = j + 1;
        }
        i = i + 1;
    }
}
int main()
{
    int i, j;
	m1 = getint();
	n1 = getint();
    i = 0;
    while (i < m1) {
        j = 0;
        while (j < n1) {
            a[i][j] = getint();
            j = j + 1;
        }
        i = i + 1;
    }
	m2 = getint();
	n2 = getint();
    i = 0;
    while (i < m2) {
        j = 0;
        while (j < n2) {
			b[i][j] = getint();
            j = j + 1;
        }
        i = i + 1;
    }
    matrix_multiply();
    i = 0;
    while (i < m1) {
        j = 0;
        while (j < n2) {
			putint(res[i][j]);
			putch(32);
            j = j + 1;
        }
        putch(10);
        i = i + 1;
    }
    return 0;
}


