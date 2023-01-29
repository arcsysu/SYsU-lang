const int maxN = 30;
const int maxM = 600;

int store[maxN], n, m;

int graph[maxN][maxN];

int is_clique(int num) {
  int i = 1;
  while (i < num) {
    int j = i + 1;
    while (j < num) {
      if (graph[store[i]][store[j]] == 0)
        return 0;
      j = j + 1;
    }
    i = i + 1;
  }
  return 1;
}

int maxCliques(int i, int k) {
  int max_ = 0;
  int j = 1;
  i = 1;
  while (j <= n) {
    store[k] = j;
    if (is_clique(k + 1)) {
      if (k > max_) max_ = k;
      int tmp = maxCliques(j, k + 1);
      if (tmp > max_) max_ = tmp;
    }
    j = j + 1;
  }
  return max_;
}

int main() {
  n = getint();
  m = getint();
  int edges[maxM][2];
  int i = 0;
  while (i < m) {
    edges[i][0] = getint();
    edges[i][1] = getint();
    i = i + 1;
  }
  i = 0;
  while (i < m) {
    graph[edges[i][0]][edges[i][1]] = 1;
    graph[edges[i][1]][edges[i][0]] = 1;
    i = i + 1;
  }
  putint(maxCliques(0, 1));
  return 0;
}