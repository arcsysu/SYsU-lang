int x[600][600][600];
int y[600][600][600];
 
int main()
{
    int i,j,k;
    int f;
    int N;

    N = getint ();
    f = getint ();

    starttime();

    i = 0;
    j = 0;
    k = 0;

    while (i<N) {
      j = 0;
      k = 0;
      while (j<N) {
        k = 0;
	    while (k<N) {
	      x[i][j][k] = 1;
	      y[i][j][k] = 0;
          k = k + 1;
	    }
        j = j + 1;
      }
      i = i + 1;
    }

    i = 1;
    j = 1;
    k = 1;

    while (i<N - 1) {
      j = 1;
      k = 1;
      while (j<N - 1) {
        k = 1;
	    while (k<N - 1) {
	       x[i][j][k] =  ( x[i-1][j][k] + x[i+1][j][k] + x[i][j-1][k] +
			    x[i][j+1][k] + x[i][j][k-1] + x[i][j][k+1]	) / f;
          k = k + 1;
	    }
        j = j + 1;
      }
      i = i + 1;
    }

    stoptime();
	
    putarray (N, x[0][0]);
    putarray (N, x[N/2][N/2]);
    putarray (N, x[i-1][j-1]);

    return 0;
}
