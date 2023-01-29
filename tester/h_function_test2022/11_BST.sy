const int space = 32;
const int LF = 10;
const int maxNode = 10000;
int value[maxNode];
int left_child[maxNode];
int right_child[maxNode];
int now;

int search(int root, int x) {
  if (root == -1 || value[root] == x)
    return root;
  else if (x > value[root])
    return search(right_child[root], x);
  else
    return search(left_child[root], x);
}

int find_minimum(int root) {
  if (root == -1) {
    return -1;
  }
  else if (left_child[root] != -1) {
    return find_minimum(left_child[root]);
  }
  return root;
}

int new_node(int x) {
  value[now] = x;
  left_child[now] = -1;
  right_child[now] = -1;
  now = now + 1;
  return now - 1;
}

int insert(int root, int x) {
  if (root == -1) {
    return new_node(x);
  }
  else if (x > value[root])
    right_child[root] = insert(right_child[root], x);
  else {
    left_child[root] = insert(left_child[root], x);
  }
  return root;
}

int delete(int root, int x) {
  if (root == -1) return -1;
  if (x > value[root]) right_child[root] = delete(right_child[root], x);
  else if (x < value[root]) left_child[root] = delete(left_child[root], x);
  else
    if (left_child[root] == -1 && right_child[root] == -1) return -1;
    else if (left_child[root] == -1 || right_child[root] == -1)
      if(left_child[root] == -1)
        return right_child[root];
      else
        return left_child[root];
    else {
      int tmp = find_minimum(right_child[root]);
      value[root] = value[tmp];
      right_child[root] = delete(right_child[root], value[tmp]);
    }
  return root;
}

void inorder(int root) {
  if (root != -1) {
    inorder(left_child[root]);
    putint(value[root]);
    putch(space);
    inorder(right_child[root]);
  }
}

int main() {
  now = 0;
  int n = getint();
  if (!n) return 0;
  int root = new_node(getint()), i = 1;
  while (i < n) {
    insert(root, getint());
    i = i + 1;
  }
  inorder(root);
  putch(LF);
  n = getint(); i = 0;
  while (i < n) {
    root = delete(root, getint());
    i = i + 1;
  }
  inorder(root);
  putch(LF);
  return 0;
}