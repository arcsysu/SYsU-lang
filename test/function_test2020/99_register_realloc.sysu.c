int func(int a, int b){
    int i;
    i = a + b;

    int c1;int c2;int c3;int c4;
    int d1;int d2;int d3;int d4;
    int e1;int e2;int e3;int e4;
    int f1;int f2;int f3;int f4;
    int g1;int g2;int g3;int g4;
    int h1;int h2;int h3;int h4;
    int i1;int i2;int i3;int i4;
    int j1;int j2;int j3;int j4;
    int k1;int k2;int k3;int k4;    
    c1 = 1;c2 = 2;c3 = 3;c4 = 4;
    d1 = 1 + c1;d2 = 2 + c2;d3 = 3 + c3;d4 = 4 + c4;
    e1 = 1 + d1;e2 = 2 + d2;e3 = 3 + d3;e4 = 4 + d4;
    f1 = 1 + e1;f2 = 2 + e2;f3 = 3 + e3;f4 = 4 + e4;
    g1 = 1 + f1;g2 = 2 + f2;g3 = 3 + f3;g4 = 4 + f4;
    h1 = 1 + g1;h2 = 2 + g2;h3 = 3 + g3;h4 = 4 + g4;
    i1 = 1 + h1;i2 = 2 + h2;i3 = 3 + h3;i4 = 4 + h4;
    j1 = 1 + i1;j2 = 2 + i2;j3 = 3 + i3;j4 = 4 + i4;
    k1 = 1 + j1;k2 = 2 + j2;k3 = 3 + j3;k4 = 4 + j4;

    i = a - b + 10;
    k1 = 1 + j1;k2 = 2 + j2;k3 = 3 + j3;k4 = 4 + j4;
    j1 = 1 + i1;j2 = 2 + i2;j3 = 3 + i3;j4 = 4 + i4;
    i1 = 1 + h1;i2 = 2 + h2;i3 = 3 + h3;i4 = 4 + h4;
    h1 = 1 + g1;h2 = 2 + g2;h3 = 3 + g3;h4 = 4 + g4;
    g1 = 1 + f1;g2 = 2 + f2;g3 = 3 + f3;g4 = 4 + f4;
    f1 = 1 + e1;f2 = 2 + e2;f3 = 3 + e3;f4 = 4 + e4;
    e1 = 1 + d1;e2 = 2 + d2;e3 = 3 + d3;e4 = 4 + d4;
    d1 = 1 + c1;d2 = 2 + c2;d3 = 3 + c3;d4 = 4 + c4;
    c1 = 1 + k1;c2 = 2 + k2;c3 = 3 + k3;c4 = 4 + k4;
    return i + c1 + c2 + c3 + c4 
        - d1 - d2 - d3 - d4 
        + e1 + e2 + e3 + e4 
        - f1 - f2 - f3 - f4 
        + g1 + g2 + g3 + g4 
        - h1 - h2 - h3 - h4 
        + i1 + i2 + i3 + i4 
        - j1 - j2 - j3 - j4 
        + k1 + k2 + k3 + k4 ;
}

int main(){
    int a;
    int b;
    a = 1;
    b = a + 2*9;

    return func(a, b);
}