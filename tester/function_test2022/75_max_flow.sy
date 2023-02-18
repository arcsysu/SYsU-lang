/*
 * Max flow EK with DFS.
 */
const int INF = 0x70000000;

int size[10];
int to[10][10];
int cap[10][10];
int rev[10][10];
int used[10];

void my_memset(int arr[], int val, int n)
{
    int i = 0;
    while (i < n) {
        arr[i] = val;
        i = i + 1;
    }
}

void add_node(int u, int v, int c)
{
    to[u][size[u]] = v;
    cap[u][size[u]] = c;
    rev[u][size[u]] = size[v];

    to[v][size[v]] = u;
    cap[v][size[v]] = 0;
    rev[v][size[v]] = size[u];

    size[u] = size[u] + 1;
    size[v] = size[v] + 1;
}

int dfs(int s, int t, int f)
{
    if (s == t)
        return f;
    used[s] = 1;

    int i = 0;
    while (i < size[s]) {
        if (used[to[s][i]]) { i = i + 1; continue; }
        if (cap[s][i] <= 0) { i = i + 1; continue; }

        int min_f;
        if (f < cap[s][i])
            min_f = f;
        else
            min_f = cap[s][i];
        int d = dfs(to[s][i], t, min_f);

        if (d > 0) {
            cap[s][i] = cap[s][i] - d;
            cap[to[s][i]][rev[s][i]] = cap[to[s][i]][rev[s][i]] + d;
            return d;
        }
        i = i + 1;
    }
    return 0;
}

int max_flow(int s, int t)
{
    int flow = 0;

    while (1) {
        my_memset(used, 0, 10);

        int f = dfs(s, t, INF);
        if (f == 0)
            return flow;
        flow = flow + f;
    }
}

int main()
{
    int V, E;
    V = getint();
    E = getint();
    my_memset(size, 0, 10);

    while (E > 0) {
        int u, v;
        u = getint();
        v = getint();
        int c = getint();
        add_node(u, v, c);
        E = E - 1;
    }

    putint(max_flow(1, V));
    putch(10);
    return 0;
}
