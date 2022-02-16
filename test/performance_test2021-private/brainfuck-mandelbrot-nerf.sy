// Brainfuck Interpreter
// Reads program from stdin, interprets and outputs to stdout.
//
// Main optimization targets:
// jump table, inline variables, etc.

int program_length = 0;
int program[65536] = {};
int tape[65536] = {};
int input[65536] = {};
int input_length = 0;
int output[65536] = {};
int output_length = 0;

int get_bf_char() {
  int get = getch();
  while (get != 62 && get != 60 && get != 43 && get != 45 && get != 91 &&
         get != 93 && get != 46 && get != 44 && get != 35) {
    get = getch();
  }
  return get;
}

void read_program() {
  int get = get_bf_char();
  while (get != 35) {
    program[program_length] = get;
    get = get_bf_char();
    program_length = program_length + 1;
  }

  // read input
  // input starts with an `i`
  int verify = getch();
  if (verify != 105) {
    return;
  }
  // and a length
  input_length = getint();
  // and a random char
  getch();
  int i = 0;
  while (i < input_length) {
    input[i] = getch();
    i = i + 1;
  }
}

void run_program() {
  int ip = 0;
  int read_head = 0;
  int input_head = 0;
  int return_address[512] = {};
  int return_address_top = 0;
  output_length = 0;
  while (ip < program_length) {
    int code = program[ip];
    if (code == 62) {
      read_head = read_head + 1;
    } else if (code == 60) {
      read_head = read_head - 1;
    } else if (code == 43) {
      tape[read_head] = tape[read_head] + 1;
    } else if (code == 45) {
      tape[read_head] = tape[read_head] - 1;
    } else if (code == 91) {
      int val = tape[read_head];
      if (val != 0) {
        return_address[return_address_top] = ip;
        return_address_top = return_address_top + 1;
      } else {
        // find the matching ]
        int loop = 1;
        while (loop > 0) {
          ip = ip + 1;
          if (program[ip] == 93) {
            loop = loop - 1;
          }
          if (program[ip] == 91) {
            loop = loop + 1;
          }
        }
      }
    } else if (code == 93) {
      int val = tape[read_head];
      if (val == 0) {
        return_address_top = return_address_top - 1;
      } else {
        ip = return_address[return_address_top - 1];
      }
    } else if (code == 46) {
      output[output_length] = tape[read_head];
      output_length = output_length + 1;
    } else if (code == 44) {
      if (input_head >= input_length) {
        tape[read_head] = 0;
      } else {
        tape[read_head] = input[input_head];
        input_head = input_head + 1;
      }
    }
    ip = ip + 1;
  }
}

void output_() {
  int i = 0;
  while (i < output_length) {
    putch(output[i]);
    i = i + 1;
  }
}

int main() {
  read_program();
  starttime();
  run_program();
  stoptime();
  output_();
  return 0;
}
