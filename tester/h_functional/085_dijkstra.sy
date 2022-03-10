const int INF = 65535;
int e[16][16];
int book[16];
int dis[16];
int n, m;
int v1, v2, w;

void Dijkstra()
{
    int i, j;

    i = 1;
    while (i <= n) {
        dis[i] = e[1][i];
        book[i] = 0;
        i = i + 1;
    }
    book[1] = 1;

    i = 1;
    while (i <= n - 1) {
        int min_num = INF;
        int min_index = 0;
        int k = 1;
        while (k <= n) {
            if (min_num > dis[k] && book[k] == 0) {
                min_num = dis[k];
                min_index = k;
            }
            k = k + 1;
        }
        book[min_index] = 1;
        int j = 1;
        while (j <= n) {
            if (e[min_index][j] < INF) {
                if (dis[j] > dis[min_index] + e[min_index][j]) {
                    dis[j] = dis[min_index] + e[min_index][j];
                }
            }
            j = j + 1;
        }
        i = i + 1;
    }
}

int main()
{
    int i;
    n = getint();
    m = getint();

    i = 1;
    while (i <= n) {
        int j = 1;
        while (j <= n) {
            if (i == j)
                e[i][j] = 0;
            else
                e[i][j] = INF;
            j = j + 1;
        }
        i = i + 1;
    }

    i = 1;
    while (i <= m) {
        int u = getint(), v = getint();
        e[u][v] = getint();
        i = i + 1;
    }

    Dijkstra();

    i = 1;
    while (i <= n) {
        putint(dis[i]);
        putch(32);
        i = i + 1;
    }
    putch(10);
    return 0;
}
