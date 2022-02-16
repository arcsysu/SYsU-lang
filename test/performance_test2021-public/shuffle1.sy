int hashmod;

const int maxn = 10000000;
const int maxm = 10000000;
int bucket[maxn];
int head[maxn];
int next[maxm];
int nextvalue[maxm];
int key[maxm];
int value[maxm];
int cnt;

int keys[maxm];
int values[maxm];
int requests[maxm];
int ans[maxm];

int hash(int k){
    return k % hashmod;
}

int insert(int k, int v){
    int h = hash(k);
    if (head[h] == 0){
        cnt = cnt + 1;
        head[h] = cnt;
        key[cnt] = k;
        value[cnt] = v;
        next[cnt] = 0;
        nextvalue[cnt] = 0;
        return 0;
    }
    int p = head[h];
    while (p != 0){
        if (key[p] == k){
            cnt = cnt + 1;
            nextvalue[cnt] = nextvalue[p];
            nextvalue[p] = cnt;
            value[cnt] = v;
            return 1;
        }
        p = next[p];
    }
    cnt = cnt + 1;
    next[cnt] = head[h];
    head[h] = cnt;
    key[cnt] = k;
    value[cnt] = v;
    nextvalue[cnt] = 0;
    return 0;
}

int reduce(int k){
    int h = hash(k);
    int p = head[h];

    while (p != 0){
        if (key[p] == k){
            int ret = 0;
            int x = p;
            while (x != 0){
                ret = ret + value[x];
                x = nextvalue[x];
            }
            return ret;
        }
        p = next[p];
    }
    return 0;
}

int main(){
    hashmod = getint();
    int ks = getarray(keys);
    int vs = getarray(values);
    int ms = getarray(requests);

    starttime();

    int i = 0;
    while (i < ks){
        insert(keys[i], values[i]);
        i = i + 1;
    }
    i = 0;
    while (i < ms){
        ans[i] = reduce(requests[i]);
        i = i + 1;
    }
    stoptime();
    putarray(ms, ans);
    return 0;
}
