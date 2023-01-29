const int maxN = 1005;
int parent[maxN];

int find(int root) {
  if (parent[root] == root)
    return root;
  else {
    parent[root] = find(parent[root]);
    return parent[root];
  }
}

void merge(int p, int q) {
  int root_p, root_q;
  root_p = find(p);
  root_q = find(q);
  if (root_p != root_q) {
    parent[root_q] = root_p;
  }
  return;
}

int main() {
  int n = getint(), m = getint(), i;
  int p, q;
  i = 0;
  while (i < n) {
    parent[i] = i;
    i = i + 1;
  }
  i = 0;
  while (i < m) {
    p = getint();
    q = getint();
    merge(p, q);
    i = i + 1;
  }

  int clusters = 0;
  i = 0;
  while (i < n) {
    if (parent[i] == i) clusters = clusters + 1;
    i = i + 1;
  }
  putint(clusters);
  return 0;
}