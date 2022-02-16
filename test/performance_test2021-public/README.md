conv: 输入 c, n, m, 输入 k 保证k=n*m 和k 个元素组成n*m的矩阵
      输入 t 和 t个Kernelid 对此矩阵进行t次c*c的二维卷积运算
      输出t次卷积核之后的结果
      返回0

fft:  输入n 和n-1次多项式P的系数
      输入m 和m-1次多项式Q的系数
      输出P*Q
      返回0

median: 输入n 和长处为n的数组，使用分割的快速排序算法找到大小为n/2的值
        输出结果数组
        返回中位数%256

transpose: 输入n, 并产生长度为n的0~n-1的一维数组
           输入m和长度为m的数组b
           对于b的每一个元素x将A理解成 x * (n/x) 的矩阵，并将其转置为 (n/x) * x 的矩阵
           输出结果矩阵的hash值
           返回0

shuffle: 输入hash桶数hashmod
         输入n和n个key值
         输入n和n个value值
         输入m和m个询问的key值
         输出m个key所对应的所有value之和
         返回0

注意： fft的第二组测试数据大概本地需要运行20s以上…如果有问题的话可以思考缩小数据规模