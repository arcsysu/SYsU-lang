const int V = 4;
const int space = 32;
const int LF = 10;

void printSolution(int color[]) {
  int i = 0;
  while (i < V) {
    putint(color[i]);
    putch(space);
    i = i + 1;
  }
  putch(LF);
}

void printMessage() {
  putch(78);putch(111);putch(116);
  putch(space);
  putch(101);putch(120);putch(105);putch(115);putch(116);
}

int isSafe(int graph[][V], int color[]) {
  int i = 0;
  while (i < V) {
    int j = i + 1;
    while (j < V) {
      if (graph[i][j] && color[j] == color[i])
        return 0;
      j = j + 1;
    }
    i = i + 1;
  }
  return 1;
}

int graphColoring(int graph[][V], int m, int i, int color[]) {
  if (i == V) {
    if (isSafe(graph, color)) {
      printSolution(color);
      return 1;
    }
    return 0;
  }
  int j = 1;
  while (j <= m) {
    color[i] = j;
    if (graphColoring(graph, m, i + 1, color))
      return 1;
    color[i] = 0;
    j = j + 1;
  }
  return 0;
}

int main() {
  int graph[V][V] = {
    {0, 1, 1, 1},
    {1, 0, 1, 0},
    {1, 1, 0, 1},
    {1, 0, 1, 0}
  }, m = 3;
  int color[V], i = 0;
  while (i < V) {
    color[i] = 0;
    i = i + 1;
  }
  if (!graphColoring(graph, m, 0, color))
    printMessage();
  return 0;
}