// ** JSON parser **
// returns 0 if structure is correct, 1 if incorrect

// type:
// 0: any
// 1: number
// 2: string
// 3: array
// 4: object
// 5: true
// 6: false
// 7: null

int pos = 0;

int is_number(int ch) {
  if (ch >= 48) {
    if (ch <= 57) {
      return 1;
    } else {
      return 0;
    }
  } else {
    return 0;
  }
}

void skip_space(int buf[], int len) {
  while (1) {
    if (pos >= len) {
      break;
    }
    if (buf[pos] == 32) {
      pos = pos + 1;
    } else if (buf[pos] == 9) {
      pos = pos + 1;
    } else if (buf[pos] == 10) {
      pos = pos + 1;
    } else if (buf[pos] == 13) {
      pos = pos + 1;
    } else {
      break;
    }
  }
}

int detect_item(int type, int buf[], int len) {
  if (pos >= len) {
    return 0; // 0 is false
  }

  skip_space(buf, len);
  if (type == 0) {         // any
    if (buf[pos] == 123) { // '{' object
      return detect_item(4, buf, len);
    } else if (buf[pos] == 91) { // '[' array
      return detect_item(3, buf, len);
    } else if (buf[pos] == 34) { // '"' string
      return detect_item(2, buf, len);
    } else if (is_number(buf[pos]) == 1) {
      // number
      return detect_item(1, buf, len);
    } else if (buf[pos] == 43) {
      // number
      return detect_item(1, buf, len);
    } else if (buf[pos] == 45) { // '+' '-'
      // number
      return detect_item(1, buf, len);
    } else if (buf[pos] == 116) { // 't'
      // true
      return detect_item(5, buf, len);
    } else if (buf[pos] == 102) { // 'f'
      // false
      return detect_item(6, buf, len);
    } else if (buf[pos] == 110) { // 'n'
      // null
      return detect_item(7, buf, len);
    } else {
      return 0;
    }
  } else if (type == 1) {
    // +/-
    if (buf[pos] == 43) {
      /* buf[pos] == 43 || buf[pos] == 45 */

      pos = pos + 1;

    } else if (buf[pos] == 45) {
      /* buf[pos] == 43 || buf[pos] == 45 */

      pos = pos + 1;
    }
    // parse number
    // \N
    if (pos >= len) {
      /* pos >= len || is_number(buf[pos]) == 0 */

      return 0;

    } else if (is_number(buf[pos]) == 0) {
      /* pos >= len || is_number(buf[pos]) == 0 */

      return 0;
    }
    while (pos < len) {
      if (is_number(buf[pos]) != 1)
        break;

      pos = pos + 1;
    }
    // .
    if (pos < len) {
      if (buf[pos] == 46) {
        pos = pos + 1;
        // \N
        while (pos < len) {
          if (is_number(buf[pos]) != 1)
            break;

          pos = pos + 1;
        }
      }
    }
    // e
    if (pos < len) {
      if (buf[pos] == 101) {
        pos = pos + 1;
        // +/-
        if (pos < len) {
          if (buf[pos] == 43) {
            pos = pos + 1;
          }
        }
        if (pos < len) {
          if (buf[pos] == 45) {
            pos = pos + 1;
          }
        }

        // N
        while (pos < len) {
          if (is_number(buf[pos]) != 1)
            break;

          pos = pos + 1;
        }
      }
    }
  } else if (type == 2) {
    // '"'
    pos = pos + 1;

    while (pos < len) {
      if (buf[pos] == 34)
        break;

      if (buf[pos] == 92) { // "\"
        pos = pos + 2;
      } else {
        pos = pos + 1;
      }
    }

    // '"'
    if (pos >= len) {
      /* pos >= len || buf[pos] != 34 */

      return 0;

    } else if (buf[pos] != 34) {
      /* pos >= len || buf[pos] != 34 */

      return 0;
    }
    pos = pos + 1;
  } else if (type == 3) {
    // [
    pos = pos + 1;
    skip_space(buf, len);

    // ] early return
    if (pos < len) {
      if (buf[pos] == 93) {
        pos = pos + 1;

        return 1;
      }
    }

    // first item
    if (detect_item(0, buf, len) == 0) {
      return 0;
    }

    skip_space(buf, len);

    while (buf[pos] == 44) { // ','
      pos = pos + 1;

      skip_space(buf, len);

      if (detect_item(0, buf, len) == 0) {
        return 0;
      }

      skip_space(buf, len);
    }

    skip_space(buf, len);

    // ']'
    if (pos >= len) {
      return 0;
    }
    if (buf[pos] != 93) {
      return 0;
    }
    pos = pos + 1;
  } else if (type == 4) {
    // {
    pos = pos + 1;
    skip_space(buf, len);

    // } early return
    if (pos < len) {
      if (buf[pos] == 125) {
        pos = pos + 1;

        return 1;
      }
    }

    // first key
    if (detect_item(2, buf, len) == 0) {
      return 0;
    }

    // :
    skip_space(buf, len);
    if (pos >= len) {
      return 0;
    }
    if (buf[pos] != 58) {
      return 0;
    }
    pos = pos + 1;

    // first item
    skip_space(buf, len);
    if (detect_item(0, buf, len) == 0) {
      return 0;
    }

    skip_space(buf, len);

    while (buf[pos] == 44) { // ','
      pos = pos + 1;

      skip_space(buf, len);

      // key
      if (detect_item(2, buf, len) == 0) {
        return 0;
      }

      // :
      skip_space(buf, len);
      if (pos >= len) {
        return 0;
      }
      if (buf[pos] != 58) {
        return 0;
      }
      pos = pos + 1;

      // item
      skip_space(buf, len);
      if (detect_item(0, buf, len) == 0) {
        return 0;
      }

      skip_space(buf, len);
    }
    skip_space(buf, len);
    // }
    if (pos >= len) {
      /* pos >= len || buf[pos] != 125 */
      return 0;
    } else if (buf[pos] != 125) {
      /* pos >= len || buf[pos] != 125 */
      return 0;
    }
    pos = pos + 1;
  } else if (type == 5) {
    // true
    int mTrue[4] = {116, 114, 117, 101};
    if (pos + 3 >= len) {
      /* pos + 3 >= len || buf[pos] != mTrue[0] || buf[pos + 1] != mTrue[1] ||
          buf[pos + 2] != mTrue[2] || buf[pos + 3] != mTrue[3] */
      return 0;
    } else if (buf[pos] != mTrue[0]) {
      return 0;
    } else if (buf[pos + 1] != mTrue[1]) {
      return 0;
    } else if (buf[pos + 2] != mTrue[2]) {
      return 0;
    } else if (buf[pos + 3] != mTrue[3]) {
      return 0;
    }
    pos = pos + 4;
  } else if (type == 6) {
    // false
    int mFalse[5] = {102, 97, 108, 115, 101};
    if (pos + 4 >= len) {
      /* pos + 4 >= len || buf[pos] != mFalse[0] || buf[pos + 1] != mFalse[1] ||
          buf[pos + 2] != mFalse[2] || buf[pos + 3] != mFalse[3] ||
          buf[pos + 4] != mFalse[4] */
      return 0;
    } else if (buf[pos] != mFalse[0]) {
      return 0;
    } else if (buf[pos + 1] != mFalse[1]) {
      return 0;
    } else if (buf[pos + 2] != mFalse[2]) {
      return 0;
    } else if (buf[pos + 3] != mFalse[3]) {
      return 0;
    } else if (buf[pos + 4] != mFalse[4]) {
      return 0;
    }
    pos = pos + 5;
  } else if (type == 7) {
    // null
    int mNull[4] = {110, 117, 108, 108};
    if (pos + 3 >= len) {
      /* pos + 3 >= len || buf[pos] != mNull[0] || buf[pos + 1] != mNull[1] ||
          buf[pos + 2] != mNull[2] || buf[pos + 3] != mNull[3] */
      return 0;
    } else if (buf[pos] != mNull[0]) {
      return 0;
    } else if (buf[pos + 1] != mNull[1]) {
      return 0;
    } else if (buf[pos + 2] != mNull[2]) {
      return 0;
    } else if (buf[pos + 3] != mNull[3]) {
      return 0;
    }
    pos = pos + 4;
  } else {
    return 0;
  }
  return 1;
}

// 50MB of JSON
int buffer[50000000] = {};

int main() {
  int get = getch();
  int i = 0;
  while (get != 35) {
    buffer[i] = get;
    i = i + 1;
    get = getch();
  }
  skip_space(buffer, i);
  int res = detect_item(0, buffer, i);
  skip_space(buffer, i);
  if (res != 0) {
    putch(111);
    putch(107);
    putch(10);
    return 0;
  } else {
    putch(110);
    putch(111);
    putch(116);
    putch(32);
    putch(111);
    putch(107);
    putch(10);
    return 1;
  }
}
