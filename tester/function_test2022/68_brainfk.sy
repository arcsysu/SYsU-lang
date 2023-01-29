/*
a brainfuck interpreter
reference: https://gist.github.com/maxcountryman/1699708
*/

// tape, input buffer, and read/write pointer
const int TAPE_LEN = 65536, BUFFER_LEN = 32768;
int tape[TAPE_LEN], program[BUFFER_LEN], ptr = 0;

// read the input program
void read_program() {
  int i = 0, len = getint();
  while (i < len) {
    program[i] = getch();
    i = i + 1;
  }
  program[i] = 0;
}

// interpret the input program
void interpret(int input[]) {
  int cur_char, loop, i = 0;
  while (input[i]) {
    cur_char = input[i];
    if (cur_char == 62) {
      // '>'
      ptr = ptr + 1;
    }
    else if (cur_char == 60) {
      // '<'
      ptr = ptr - 1;
    }
    else if (cur_char == 43) {
      // '+'
      tape[ptr] = tape[ptr] + 1;
    }
    else if (cur_char == 45) {
      // '-'
      tape[ptr] = tape[ptr] - 1;
    }
    else if (cur_char == 46) {
      // '.'
      putch(tape[ptr]);
    }
    else if (cur_char == 44) {
      // ','
      tape[ptr] = getch();
    }
    else if (cur_char == 93 && tape[ptr]) {
      // ']'
      loop = 1;
      while (loop > 0) {
        i = i - 1;
        cur_char = input[i];
        if (cur_char == 91) {
          // '['
          loop = loop - 1;
        }
        else if (cur_char == 93) {
          // ']'
          loop = loop + 1;
        }
      }
    }
    i = i + 1;
  }
}

int main() {
  read_program();
  interpret(program);
  return 0;
}
