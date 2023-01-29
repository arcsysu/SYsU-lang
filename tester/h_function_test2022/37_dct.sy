// reference:
// https://stackoverflow.com/questions/8310749/discrete-cosine-transform-dct-implementation-c

const int MAX_DIM_X = 8, MAX_DIM_Y = 8;
float test_block[MAX_DIM_X][MAX_DIM_Y];
float test_dct[MAX_DIM_X][MAX_DIM_Y];
float test_idct[MAX_DIM_X][MAX_DIM_Y];

const float PI = 3.14159265359, TWO_PI = 6.28318530718, EPSILON = 1e-6;

float my_fabs(float x) {
  if (x > 0) return x;
  return -x;
}

float p(float x) { return 3 * x - 4 * x * x * x; }

float my_sin_impl(float x) {
  if (my_fabs(x) <= EPSILON) return x;
  return p(my_sin_impl(x / 3.0));
}

float my_sin(float x) {
  if (x > TWO_PI || x < -TWO_PI) {
    int xx = x / TWO_PI;
    x = x - xx * TWO_PI;
  }
  if (x > PI) x = x - TWO_PI;
  if (x < -PI) x = x + TWO_PI;
  return my_sin_impl(x);
}

float my_cos(float x) { return my_sin(x + PI / 2); }

void write_mat(float mat[][MAX_DIM_Y], int n, int m) {
  int i = 0;
  while (i < n) {
    putfloat(mat[i][0]);
    int j = 1;
    while (j < m) {
      putch(32);
      putfloat(mat[i][j]);
      j = j + 1;
    }
    putch(10);
    i = i + 1;
  }
  putch(10);
}

void dct(float dct_mat[][MAX_DIM_Y], float mat[][MAX_DIM_Y], int n, int m) {
  int u = 0;
  while (u < n) {
    int v = 0;
    while (v < m) {
      dct_mat[u][v] = 0;
      int i = 0;
      while (i < n) {
        int j = 0;
        while (j < m) {
          dct_mat[u][v] =
              dct_mat[u][v] + mat[i][j] * my_cos(PI / n * (i + 1. / 2.) * u) *
                                  my_cos(PI / m * (j + 1. / 2.) * v);
          j = j + 1;
        }
        i = i + 1;
      }
      v = v + 1;
    }
    u = u + 1;
  }
}

void idct(float mat[][MAX_DIM_Y], float dct_mat[][MAX_DIM_Y], int n, int m) {
  int u = 0;
  while (u < n) {
    int v = 0;
    while (v < m) {
      mat[u][v] = 1 / 4. * dct_mat[0][0];
      int i, j;

      i = 1;
      while (i < n) {
        mat[u][v] = mat[u][v] + 1 / 2. * dct_mat[i][0];
        i = i + 1;
      }
      j = 1;
      while (j < m) {
        mat[u][v] = mat[u][v] + 1 / 2. * dct_mat[0][j];
        j = j + 1;
      }

      i = 1;
      while (i < n) {
        j = 1;
        while (j < m) {
          mat[u][v] = mat[u][v] + dct_mat[i][j] *
                                      my_cos(PI / n * (u + 1. / 2.) * i) *
                                      my_cos(PI / m * (v + 1. / 2.) * j);
          j = j + 1;
        }
        i = i + 1;
      }
      mat[u][v] = mat[u][v] * 2. / n * 2. / m;
      v = v + 1;
    }
    u = u + 1;
  }
}

int main() {
  int dim_x = getint(), dim_y = getint();

  int i = 0;
  while (i < dim_x) {
    int j = 0;
    while (j < dim_y) {
      test_block[i][j] = getfloat();
      j = j + 1;
    }
    i = i + 1;
  }

  dct(test_dct, test_block, dim_x, dim_y);
  write_mat(test_dct, dim_x, dim_y);

  idct(test_idct, test_dct, dim_x, dim_y);
  write_mat(test_idct, dim_x, dim_y);

  return 0;
}
