
int MAX(int a, int b)
{
    if (a == b)
        return a;
    else if (a > b)
        return a;
    else
        return b;
}

int max_sum_nonadjacent(int arr[], int n)
{
    int temp[16] = {};
    temp[0] = arr[0];
    temp[1] = MAX(arr[0], arr[1]);
    int i = 2;
    while (i < n) {
        temp[i] = MAX(temp[i - 2] + arr[i], temp[i - 1]);
        i = i + 1;
    }
    return temp[n - 1];
}

int longest_common_subseq(int arr1[], int len1,
                          int arr2[], int len2)
{
    int p[16][16] = {};
    int i, j;
    i = 1;
    while (i <= len1) {
        j = 1;
        while (j <= len2) {
            if (arr1[i - 1] == arr2[j - 1]) {
                p[i][j] = p[i - 1][j - 1] + 1;
            } else {
                p[i][j] = MAX(p[i - 1][j], p[i][j - 1]);
            }
            j = j + 1;
        }
        i = i + 1;
    }
    return p[len1][len2];
}

int main()
{
    int A[15] = {8, 7, 4, 1, 2, 7, 0, 1, 9, 3, 4, 8, 3, 7, 0};
    int B[13] = {3, 9, 7, 1, 4, 2, 4, 3, 6, 8, 0, 1, 5};
    int An, Bn;

    putint(max_sum_nonadjacent(A, 15));
    putch(10);

    putint(longest_common_subseq(A, 15, B, 13));
    putch(10);
    return 0;
}
