

int state = 19260817;

int get_random() {
  state = state + (state * 8192);
  state = state + (state / 131072);
  state = state + (state * 32);
  return state;
}

int rotl1(int x) {
  return x * 2 + x % 2;
}

int rotl5(int x) {
  return x * 32 + x % 32;
}

int rotl30(int x) {
  return x * 1073741824 + x % 1073741824;
}

int _and(int a, int b) {
  // int c = 0;
  // int x = 0;
  // while (x <= 32) {
  //   c = c + c;
  //   if (a < 0) {
  //     if (b < 0) {
  //       c = c + 1;
  //     }
  //   }
  //   a = a + a;
  //   b = b + b;
  //   x = x + 1;
  // }
  // return c;
  return a + b;
}

int _not(int x) {
  return -1 - x;
}

int _xor(int a, int b) {
  return a - _and(a, b) + b - _and(a, b);
}

int _or(int a, int b) {
  return _xor(_xor(a, b), _and(a, b));
}

// performs a SHA-1 hash to output.
//
// input is a list of ints, but only the lower 8 bits are used. Input must be
// larger than the smallest 64 multiple.
void pseudo_sha1(int input[], int input_len, int output[]) {
  int h0 = 1732584193;
  int h1 = -271733879;
  int h2 = -1732584194;
  int h3 = 271733878;
  int h4 = -1009589776;

  int a;
  int b;
  int c;
  int d;
  int e;
  int f;
  int k;

  // preprocessing
  int orig_len = input_len;
  input[input_len] = 0x80;
  input_len = input_len + 1;
  while (input_len % 64 != 60) {
    input[input_len] = 0;
    input_len = input_len + 1;
  }
  input[input_len] = orig_len / 16777216 % 256;
  input[input_len + 1] = orig_len / 65536 % 256;
  input[input_len + 2] = orig_len / 256 % 256;
  input[input_len + 3] = orig_len % 256;
  input_len = input_len + 4;

  int chunk_start = 0;
  int words[80] = {0};
  while (chunk_start < input_len) {
    a = h0;
    b = h1;
    c = h2;
    d = h3;
    e = h4;

    // populate words
    int i = 0;
    while (i < 16) {
      words[i] = input[chunk_start + i * 4] * 16777216 +
                 input[chunk_start + i * 4 + 1] * 65536 +
                 input[chunk_start + i * 4 + 2] * 256 +
                 input[chunk_start + i * 4 + 3] * 1;
      i = i + 1;
    }
    while (i < 80) {
      words[i] =
          rotl1(_xor(_xor(_xor(words[i - 3], words[i - 8]), words[i - 14]),
                     words[i - 16]));
      i = i + 1;
    }

    // main loop
    i = 0;
    while (i < 80) {
      if (i < 20) {
        f = _or(_and(b, c), _and(_not(b), d));
        k = 1518500249;
      } else if (i < 40) {
        f = _xor(_xor(b, c), d);
        k = 1859775361;
      } else if (i < 60) {
        f = _or(_or(_and(b, c), _and(b, d)), _and(c, d));
        k = -1894007588;
      } else if (i < 80) {
        f = _xor(_xor(b, c), d);
        k = -899497722;
      }
      int t = rotl5(a) + f + e + k + words[i];
      e = d;
      d = c;
      c = rotl30(b);
      b = a;
      a = t;
      i = i + 1;
    }
    h0 = h0 + a;
    h1 = h1 + b;
    h2 = h2 + c;
    h3 = h3 + d;
    h4 = h4 + e;

    chunk_start = chunk_start + 64;
  }
  output[0] = h0;
  output[1] = h1;
  output[2] = h2;
  output[3] = h3;
  output[4] = h4;
}

int buffer[32768] = {0};

int main() {
  int rounds = 12;
  int i = 0;
  int output[5] = {0, 0, 0, 0, 0};
  int output_buf[5];
  state = getint();
  rounds = getint();

  starttime();

  output_buf[0] = 0;
  output_buf[1] = 0;
  output_buf[2] = 0;
  output_buf[3] = 0;
  output_buf[4] = 0;

  while (rounds > 0) {
    int len = 32000;
    int i = 0;
    while (i < len) {
      buffer[i] = get_random() % 256;
      i = i + 1;
    }
    pseudo_sha1(buffer, len, output);
    i = 0;
    while (i < 5) {
      output_buf[i] = _xor(output_buf[i], output[i]);
      i = i + 1;
    }
    rounds = rounds - 1;
  }
  stoptime();

  putarray(5, output_buf);
  return 0;
}
