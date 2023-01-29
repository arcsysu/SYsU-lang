const int TOKEN_NUM = 0, TOKEN_OTHER = 1;
int last_char = 32, num, other;
int cur_token;

int next_char() {
  last_char = getch();
  return last_char;
}

int is_space(int c) {
  if (c == 32 || c == 10) {
    return 1;
  }
  else {
    return 0;
  }
}

int is_num(int c) {
  if (c >= 48 && c <= 57) {
    return 1;
  }
  else {
    return 0;
  }
}

int next_token() {
  while (is_space(last_char)) next_char();
  if (is_num(last_char)) {
    num = last_char - 48;
    while (is_num(next_char())) {
      num = num * 10 + last_char - 48;
    }
    cur_token = TOKEN_NUM;
  }
  else {
    other = last_char;
    next_char();
    cur_token = TOKEN_OTHER;
  }
  return cur_token;
}

int panic() {
  putch(112);
  putch(97);
  putch(110);
  putch(105);
  putch(99);
  putch(33);
  putch(10);
  return -1;
}

int get_op_prec(int op) {
  // +, -
  if (op == 43 || op == 45) return 10;
  // *, /, %
  if (op == 42 || op == 47 || op == 37) return 20;
  // other
  return 0;
}

void stack_push(int s[], int v) {
  s[0] = s[0] + 1;
  s[s[0]] = v;
}

int stack_pop(int s[]) {
  int last = s[s[0]];
  s[0] = s[0] - 1;
  return last;
}

int stack_peek(int s[]) {
  return s[s[0]];
}

int stack_size(int s[]) {
  return s[0];
}

int eval_op(int op, int lhs, int rhs) {
  // +
  if (op == 43) return lhs + rhs;
  // -
  if (op == 45) return lhs - rhs;
  // *
  if (op == 42) return lhs * rhs;
  // /
  if (op == 47) return lhs / rhs;
  // %
  if (op == 37) return lhs % rhs;
  // other
  return 0;
}

int eval() {
  int oprs[256] = {}, ops[256] = {};
  // get the first value
  if (cur_token != TOKEN_NUM) return panic();
  stack_push(oprs, num);
  next_token();
  // evaluate
  while (cur_token == TOKEN_OTHER) {
    // get operator
    int op = other;
    if (!get_op_prec(op)) break;
    next_token();
    // handle operator
    while (stack_size(ops) && get_op_prec(stack_peek(ops)) >= get_op_prec(op)) {
      // evaluate the current operation
      int cur_op = stack_pop(ops);
      int rhs = stack_pop(oprs), lhs = stack_pop(oprs);
      stack_push(oprs, eval_op(cur_op, lhs, rhs));
    }
    stack_push(ops, op);
    // get next expression
    if (cur_token != TOKEN_NUM) return panic();
    stack_push(oprs, num);
    next_token();
  }
  // eat ';'
  next_token();
  // clear the operator stack
  while (stack_size(ops)) {
    int cur_op = stack_pop(ops);
    int rhs = stack_pop(oprs), lhs = stack_pop(oprs);
    stack_push(oprs, eval_op(cur_op, lhs, rhs));
  }
  return stack_peek(oprs);
}

int main() {
  int count = getint();
  getch();
  next_token();
  while (count) {
    putint(eval());
    putch(10);
    count = count - 1;
  }
  return 0;
}
