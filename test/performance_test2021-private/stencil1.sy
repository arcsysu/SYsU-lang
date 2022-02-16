const int width = 1024;
const int height = 1024;
int image_in[width * height];
int image_out[width * height];

int cutout(int val){
    if(val < 0){
        val = 0;
    }
    else{
        if(val > 255){
            val = 255;
        }
    }
    return val;
}

int main(){
    int i;
    int j;
    int num = getarray(image_in);

    starttime();
    j = 1;
    while(j < width - 1){
        i = 1;
        while(i < height - 1){
            int im1jm1 =(i-1)*width + j-1;
            int im1j   =(i-1)*width + j;
            int im1jp1 =(i-1)*width + j+1;
            int ijm1   =(i  )*width + j-1;
            int ij     =(i  )*width + j;
            int ijp1   =(i  )*width + j+1;
            int ip1jm1 =(i+1)*width + j-1;
            int ip1j   =(i+1)*width + j;
            int ip1jp1 =(i+1)*width + j+1;
            int val = 8*image_in[ij] - image_in[im1jm1] - image_in[im1j] - image_in[im1jp1] -image_in[ijm1] - image_in[ijp1] - image_in[ip1jm1] - image_in[ip1j] - image_in[ip1jp1];

            image_out[i*width + j] = cutout(val);
            i = i + 1;
        }
        j = j + 1;
    }

    i = 0;
    while(i < height){
        image_out[i * width] = image_in[i * width];
        image_out[i * width + width - 1] = image_in[i * width + width - 1];
        i = i + 1;
    }

    j = 0;
    while(j < width){
        image_out[j] = image_in[j];
        image_out[(height - 1) * width + j] = image_in[(height - 1) * width + j];
        j = j + 1;
    }

    stoptime();

    putarray(width * height, image_out);
    return num;
}