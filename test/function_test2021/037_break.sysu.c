//test break
int main(){
    int i;
    i = 0;
    int sum;
    sum = 0;
    while(i < 100){
        if(i == 50){
            break;
        }
        sum = sum + i;
        i = i + 1;
    }
    return sum;
}