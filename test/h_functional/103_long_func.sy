const int SHIFT_TABLE[16] = {1,   2,   4,    8,    16,   32,   64,    128,
                             256, 512, 1024, 2048, 4096, 8192, 16384, 32768};

int long_func() {
  int ans, i, x, y, cur;
  {
    int pl = 2, pr = 0, pres = 1;
    while (pr > 0) {
      ans = 0;
      i = 0;
      x = pr;
      y = 1;
      while (i < 16) {
        if (x % 2 && y % 2) {
          ans = ans + 1 * SHIFT_TABLE[i];
        }
        x = x / 2;
        y = y / 2;
        i = i + 1;
      }
      if (ans) {
        {
          int ml = pres, mr = pl, mres = 0;
          while (mr) {
            ans = 0;
            i = 0;
            x = mr;
            y = 1;
            while (i < 16) {
              if (x % 2 && y % 2) {
                ans = ans + 1 * SHIFT_TABLE[i];
              }
              x = x / 2;
              y = y / 2;
              i = i + 1;
            }
            if (ans) {
              {
                int al = mres, c = ml, sum;
                while (c) {
                  ans = 0;
                  i = 0;
                  x = al;
                  y = c;
                  while (i < 16) {
                    if (x % 2) {
                      if (y % 2 == 0) {
                        ans = ans + 1 * SHIFT_TABLE[i];
                      }
                    } else if (y % 2) {
                      ans = ans + 1 * SHIFT_TABLE[i];
                    }
                    x = x / 2;
                    y = y / 2;
                    i = i + 1;
                  }
                  sum = ans;
                  ans = 0;
                  i = 0;
                  x = al;
                  y = c;
                  while (i < 16) {
                    if (x % 2 && y % 2) {
                      ans = ans + 1 * SHIFT_TABLE[i];
                    }
                    x = x / 2;
                    y = y / 2;
                    i = i + 1;
                  }
                  c = ans;
                  if ((1) > 15) {
                    ans = 0;
                  } else {
                    ans = 0;
                    i = 0;
                    x = (c)*SHIFT_TABLE[1];
                    y = 0xffff;
                    while (i < 16) {
                      if (x % 2 && y % 2) {
                        ans = ans + 1 * SHIFT_TABLE[i];
                      }
                      x = x / 2;
                      y = y / 2;
                      i = i + 1;
                    }
                  }
                  c = ans;
                  al = sum;
                }
                ans = al;
              }
              mres = ans;
            }
            {
              int al = ml, c = ml, sum;
              while (c) {
                ans = 0;
                i = 0;
                x = al;
                y = c;
                while (i < 16) {
                  if (x % 2) {
                    if (y % 2 == 0) {
                      ans = ans + 1 * SHIFT_TABLE[i];
                    }
                  } else if (y % 2) {
                    ans = ans + 1 * SHIFT_TABLE[i];
                  }
                  x = x / 2;
                  y = y / 2;
                  i = i + 1;
                }
                sum = ans;
                ans = 0;
                i = 0;
                x = al;
                y = c;
                while (i < 16) {
                  if (x % 2 && y % 2) {
                    ans = ans + 1 * SHIFT_TABLE[i];
                  }
                  x = x / 2;
                  y = y / 2;
                  i = i + 1;
                }
                c = ans;
                if ((1) > 15) {
                  ans = 0;
                } else {
                  ans = 0;
                  i = 0;
                  x = (c)*SHIFT_TABLE[1];
                  y = 0xffff;
                  while (i < 16) {
                    if (x % 2 && y % 2) {
                      ans = ans + 1 * SHIFT_TABLE[i];
                    }
                    x = x / 2;
                    y = y / 2;
                    i = i + 1;
                  }
                }
                c = ans;
                al = sum;
              }
              ans = al;
            }
            ml = ans;
            x = mr;
            y = 1;
            if (y >= 15) {
              if (x < 0) {
                ans = 0xffff;
              } else {
                ans = 0;
              }
            } else if (y > 0) {
              if (x > 0x7fff) {
                x = x / SHIFT_TABLE[y];
                ans = x + 65536 - SHIFT_TABLE[15 - y + 1];
              } else {
                ans = x / SHIFT_TABLE[y];
              }
            } else {
              ans = x;
            }
            mr = ans;
          }
          ans = mres;
        }
        pres = ans;
      }
      {
        int ml = pl, mr = pl, mres = 0;
        while (mr) {
          ans = 0;
          i = 0;
          x = mr;
          y = 1;
          while (i < 16) {
            if (x % 2 && y % 2) {
              ans = ans + 1 * SHIFT_TABLE[i];
            }
            x = x / 2;
            y = y / 2;
            i = i + 1;
          }
          if (ans) {
            {
              int al = mres, c = ml, sum;
              while (c) {
                ans = 0;
                i = 0;
                x = al;
                y = c;
                while (i < 16) {
                  if (x % 2) {
                    if (y % 2 == 0) {
                      ans = ans + 1 * SHIFT_TABLE[i];
                    }
                  } else if (y % 2) {
                    ans = ans + 1 * SHIFT_TABLE[i];
                  }
                  x = x / 2;
                  y = y / 2;
                  i = i + 1;
                }
                sum = ans;
                ans = 0;
                i = 0;
                x = al;
                y = c;
                while (i < 16) {
                  if (x % 2 && y % 2) {
                    ans = ans + 1 * SHIFT_TABLE[i];
                  }
                  x = x / 2;
                  y = y / 2;
                  i = i + 1;
                }
                c = ans;
                if ((1) > 15) {
                  ans = 0;
                } else {
                  ans = 0;
                  i = 0;
                  x = (c)*SHIFT_TABLE[1];
                  y = 0xffff;
                  while (i < 16) {
                    if (x % 2 && y % 2) {
                      ans = ans + 1 * SHIFT_TABLE[i];
                    }
                    x = x / 2;
                    y = y / 2;
                    i = i + 1;
                  }
                }
                c = ans;
                al = sum;
              }
              ans = al;
            }
            mres = ans;
          }
          {
            int al = ml, c = ml, sum;
            while (c) {
              ans = 0;
              i = 0;
              x = al;
              y = c;
              while (i < 16) {
                if (x % 2) {
                  if (y % 2 == 0) {
                    ans = ans + 1 * SHIFT_TABLE[i];
                  }
                } else if (y % 2) {
                  ans = ans + 1 * SHIFT_TABLE[i];
                }
                x = x / 2;
                y = y / 2;
                i = i + 1;
              }
              sum = ans;
              ans = 0;
              i = 0;
              x = al;
              y = c;
              while (i < 16) {
                if (x % 2 && y % 2) {
                  ans = ans + 1 * SHIFT_TABLE[i];
                }
                x = x / 2;
                y = y / 2;
                i = i + 1;
              }
              c = ans;
              if ((1) > 15) {
                ans = 0;
              } else {
                ans = 0;
                i = 0;
                x = (c)*SHIFT_TABLE[1];
                y = 0xffff;
                while (i < 16) {
                  if (x % 2 && y % 2) {
                    ans = ans + 1 * SHIFT_TABLE[i];
                  }
                  x = x / 2;
                  y = y / 2;
                  i = i + 1;
                }
              }
              c = ans;
              al = sum;
            }
            ans = al;
          }
          ml = ans;
          x = mr;
          y = 1;
          if (y >= 15) {
            if (x < 0) {
              ans = 0xffff;
            } else {
              ans = 0;
            }
          } else if (y > 0) {
            if (x > 0x7fff) {
              x = x / SHIFT_TABLE[y];
              ans = x + 65536 - SHIFT_TABLE[15 - y + 1];
            } else {
              ans = x / SHIFT_TABLE[y];
            }
          } else {
            ans = x;
          }
          mr = ans;
        }
        ans = mres;
      }
      pl = ans;
      x = pr;
      y = 1;
      if (y >= 15) {
        if (x < 0) {
          ans = 0xffff;
        } else {
          ans = 0;
        }
      } else if (y > 0) {
        if (x > 0x7fff) {
          x = x / SHIFT_TABLE[y];
          ans = x + 65536 - SHIFT_TABLE[15 - y + 1];
        } else {
          ans = x / SHIFT_TABLE[y];
        }
      } else {
        ans = x;
      }
      pr = ans;
    }
    ans = pres;
  }
  putint(ans);
  putch(10);
  {
    int pl = 2, pr = 1, pres = 1;
    while (pr > 0) {
      ans = 0;
      i = 0;
      x = pr;
      y = 1;
      while (i < 16) {
        if (x % 2 && y % 2) {
          ans = ans + 1 * SHIFT_TABLE[i];
        }
        x = x / 2;
        y = y / 2;
        i = i + 1;
      }
      if (ans) {
        {
          int ml = pres, mr = pl, mres = 0;
          while (mr) {
            ans = 0;
            i = 0;
            x = mr;
            y = 1;
            while (i < 16) {
              if (x % 2 && y % 2) {
                ans = ans + 1 * SHIFT_TABLE[i];
              }
              x = x / 2;
              y = y / 2;
              i = i + 1;
            }
            if (ans) {
              {
                int al = mres, c = ml, sum;
                while (c) {
                  ans = 0;
                  i = 0;
                  x = al;
                  y = c;
                  while (i < 16) {
                    if (x % 2) {
                      if (y % 2 == 0) {
                        ans = ans + 1 * SHIFT_TABLE[i];
                      }
                    } else if (y % 2) {
                      ans = ans + 1 * SHIFT_TABLE[i];
                    }
                    x = x / 2;
                    y = y / 2;
                    i = i + 1;
                  }
                  sum = ans;
                  ans = 0;
                  i = 0;
                  x = al;
                  y = c;
                  while (i < 16) {
                    if (x % 2 && y % 2) {
                      ans = ans + 1 * SHIFT_TABLE[i];
                    }
                    x = x / 2;
                    y = y / 2;
                    i = i + 1;
                  }
                  c = ans;
                  if ((1) > 15) {
                    ans = 0;
                  } else {
                    ans = 0;
                    i = 0;
                    x = (c)*SHIFT_TABLE[1];
                    y = 0xffff;
                    while (i < 16) {
                      if (x % 2 && y % 2) {
                        ans = ans + 1 * SHIFT_TABLE[i];
                      }
                      x = x / 2;
                      y = y / 2;
                      i = i + 1;
                    }
                  }
                  c = ans;
                  al = sum;
                }
                ans = al;
              }
              mres = ans;
            }
            {
              int al = ml, c = ml, sum;
              while (c) {
                ans = 0;
                i = 0;
                x = al;
                y = c;
                while (i < 16) {
                  if (x % 2) {
                    if (y % 2 == 0) {
                      ans = ans + 1 * SHIFT_TABLE[i];
                    }
                  } else if (y % 2) {
                    ans = ans + 1 * SHIFT_TABLE[i];
                  }
                  x = x / 2;
                  y = y / 2;
                  i = i + 1;
                }
                sum = ans;
                ans = 0;
                i = 0;
                x = al;
                y = c;
                while (i < 16) {
                  if (x % 2 && y % 2) {
                    ans = ans + 1 * SHIFT_TABLE[i];
                  }
                  x = x / 2;
                  y = y / 2;
                  i = i + 1;
                }
                c = ans;
                if ((1) > 15) {
                  ans = 0;
                } else {
                  ans = 0;
                  i = 0;
                  x = (c)*SHIFT_TABLE[1];
                  y = 0xffff;
                  while (i < 16) {
                    if (x % 2 && y % 2) {
                      ans = ans + 1 * SHIFT_TABLE[i];
                    }
                    x = x / 2;
                    y = y / 2;
                    i = i + 1;
                  }
                }
                c = ans;
                al = sum;
              }
              ans = al;
            }
            ml = ans;
            x = mr;
            y = 1;
            if (y >= 15) {
              if (x < 0) {
                ans = 0xffff;
              } else {
                ans = 0;
              }
            } else if (y > 0) {
              if (x > 0x7fff) {
                x = x / SHIFT_TABLE[y];
                ans = x + 65536 - SHIFT_TABLE[15 - y + 1];
              } else {
                ans = x / SHIFT_TABLE[y];
              }
            } else {
              ans = x;
            }
            mr = ans;
          }
          ans = mres;
        }
        pres = ans;
      }
      {
        int ml = pl, mr = pl, mres = 0;
        while (mr) {
          ans = 0;
          i = 0;
          x = mr;
          y = 1;
          while (i < 16) {
            if (x % 2 && y % 2) {
              ans = ans + 1 * SHIFT_TABLE[i];
            }
            x = x / 2;
            y = y / 2;
            i = i + 1;
          }
          if (ans) {
            {
              int al = mres, c = ml, sum;
              while (c) {
                ans = 0;
                i = 0;
                x = al;
                y = c;
                while (i < 16) {
                  if (x % 2) {
                    if (y % 2 == 0) {
                      ans = ans + 1 * SHIFT_TABLE[i];
                    }
                  } else if (y % 2) {
                    ans = ans + 1 * SHIFT_TABLE[i];
                  }
                  x = x / 2;
                  y = y / 2;
                  i = i + 1;
                }
                sum = ans;
                ans = 0;
                i = 0;
                x = al;
                y = c;
                while (i < 16) {
                  if (x % 2 && y % 2) {
                    ans = ans + 1 * SHIFT_TABLE[i];
                  }
                  x = x / 2;
                  y = y / 2;
                  i = i + 1;
                }
                c = ans;
                if ((1) > 15) {
                  ans = 0;
                } else {
                  ans = 0;
                  i = 0;
                  x = (c)*SHIFT_TABLE[1];
                  y = 0xffff;
                  while (i < 16) {
                    if (x % 2 && y % 2) {
                      ans = ans + 1 * SHIFT_TABLE[i];
                    }
                    x = x / 2;
                    y = y / 2;
                    i = i + 1;
                  }
                }
                c = ans;
                al = sum;
              }
              ans = al;
            }
            mres = ans;
          }
          {
            int al = ml, c = ml, sum;
            while (c) {
              ans = 0;
              i = 0;
              x = al;
              y = c;
              while (i < 16) {
                if (x % 2) {
                  if (y % 2 == 0) {
                    ans = ans + 1 * SHIFT_TABLE[i];
                  }
                } else if (y % 2) {
                  ans = ans + 1 * SHIFT_TABLE[i];
                }
                x = x / 2;
                y = y / 2;
                i = i + 1;
              }
              sum = ans;
              ans = 0;
              i = 0;
              x = al;
              y = c;
              while (i < 16) {
                if (x % 2 && y % 2) {
                  ans = ans + 1 * SHIFT_TABLE[i];
                }
                x = x / 2;
                y = y / 2;
                i = i + 1;
              }
              c = ans;
              if ((1) > 15) {
                ans = 0;
              } else {
                ans = 0;
                i = 0;
                x = (c)*SHIFT_TABLE[1];
                y = 0xffff;
                while (i < 16) {
                  if (x % 2 && y % 2) {
                    ans = ans + 1 * SHIFT_TABLE[i];
                  }
                  x = x / 2;
                  y = y / 2;
                  i = i + 1;
                }
              }
              c = ans;
              al = sum;
            }
            ans = al;
          }
          ml = ans;
          x = mr;
          y = 1;
          if (y >= 15) {
            if (x < 0) {
              ans = 0xffff;
            } else {
              ans = 0;
            }
          } else if (y > 0) {
            if (x > 0x7fff) {
              x = x / SHIFT_TABLE[y];
              ans = x + 65536 - SHIFT_TABLE[15 - y + 1];
            } else {
              ans = x / SHIFT_TABLE[y];
            }
          } else {
            ans = x;
          }
          mr = ans;
        }
        ans = mres;
      }
      pl = ans;
      x = pr;
      y = 1;
      if (y >= 15) {
        if (x < 0) {
          ans = 0xffff;
        } else {
          ans = 0;
        }
      } else if (y > 0) {
        if (x > 0x7fff) {
          x = x / SHIFT_TABLE[y];
          ans = x + 65536 - SHIFT_TABLE[15 - y + 1];
        } else {
          ans = x / SHIFT_TABLE[y];
        }
      } else {
        ans = x;
      }
      pr = ans;
    }
    ans = pres;
  }
  putint(ans);
  putch(10);
  cur = 2;
  while (cur < 16) {
    {
      int pl = 2, pr = cur, pres = 1;
      while (pr > 0) {
        ans = 0;
        i = 0;
        x = pr;
        y = 1;
        while (i < 16) {
          if (x % 2 && y % 2) {
            ans = ans + 1 * SHIFT_TABLE[i];
          }
          x = x / 2;
          y = y / 2;
          i = i + 1;
        }
        if (ans) {
          {
            int ml = pres, mr = pl, mres = 0;
            while (mr) {
              ans = 0;
              i = 0;
              x = mr;
              y = 1;
              while (i < 16) {
                if (x % 2 && y % 2) {
                  ans = ans + 1 * SHIFT_TABLE[i];
                }
                x = x / 2;
                y = y / 2;
                i = i + 1;
              }
              if (ans) {
                {
                  int al = mres, c = ml, sum;
                  while (c) {
                    ans = 0;
                    i = 0;
                    x = al;
                    y = c;
                    while (i < 16) {
                      if (x % 2) {
                        if (y % 2 == 0) {
                          ans = ans + 1 * SHIFT_TABLE[i];
                        }
                      } else if (y % 2) {
                        ans = ans + 1 * SHIFT_TABLE[i];
                      }
                      x = x / 2;
                      y = y / 2;
                      i = i + 1;
                    }
                    sum = ans;
                    ans = 0;
                    i = 0;
                    x = al;
                    y = c;
                    while (i < 16) {
                      if (x % 2 && y % 2) {
                        ans = ans + 1 * SHIFT_TABLE[i];
                      }
                      x = x / 2;
                      y = y / 2;
                      i = i + 1;
                    }
                    c = ans;
                    if ((1) > 15) {
                      ans = 0;
                    } else {
                      ans = 0;
                      i = 0;
                      x = (c)*SHIFT_TABLE[1];
                      y = 0xffff;
                      while (i < 16) {
                        if (x % 2 && y % 2) {
                          ans = ans + 1 * SHIFT_TABLE[i];
                        }
                        x = x / 2;
                        y = y / 2;
                        i = i + 1;
                      }
                    }
                    c = ans;
                    al = sum;
                  }
                  ans = al;
                }
                mres = ans;
              }
              {
                int al = ml, c = ml, sum;
                while (c) {
                  ans = 0;
                  i = 0;
                  x = al;
                  y = c;
                  while (i < 16) {
                    if (x % 2) {
                      if (y % 2 == 0) {
                        ans = ans + 1 * SHIFT_TABLE[i];
                      }
                    } else if (y % 2) {
                      ans = ans + 1 * SHIFT_TABLE[i];
                    }
                    x = x / 2;
                    y = y / 2;
                    i = i + 1;
                  }
                  sum = ans;
                  ans = 0;
                  i = 0;
                  x = al;
                  y = c;
                  while (i < 16) {
                    if (x % 2 && y % 2) {
                      ans = ans + 1 * SHIFT_TABLE[i];
                    }
                    x = x / 2;
                    y = y / 2;
                    i = i + 1;
                  }
                  c = ans;
                  if ((1) > 15) {
                    ans = 0;
                  } else {
                    ans = 0;
                    i = 0;
                    x = (c)*SHIFT_TABLE[1];
                    y = 0xffff;
                    while (i < 16) {
                      if (x % 2 && y % 2) {
                        ans = ans + 1 * SHIFT_TABLE[i];
                      }
                      x = x / 2;
                      y = y / 2;
                      i = i + 1;
                    }
                  }
                  c = ans;
                  al = sum;
                }
                ans = al;
              }
              ml = ans;
              x = mr;
              y = 1;
              if (y >= 15) {
                if (x < 0) {
                  ans = 0xffff;
                } else {
                  ans = 0;
                }
              } else if (y > 0) {
                if (x > 0x7fff) {
                  x = x / SHIFT_TABLE[y];
                  ans = x + 65536 - SHIFT_TABLE[15 - y + 1];
                } else {
                  ans = x / SHIFT_TABLE[y];
                }
              } else {
                ans = x;
              }
              mr = ans;
            }
            ans = mres;
          }
          pres = ans;
        }
        {
          int ml = pl, mr = pl, mres = 0;
          while (mr) {
            ans = 0;
            i = 0;
            x = mr;
            y = 1;
            while (i < 16) {
              if (x % 2 && y % 2) {
                ans = ans + 1 * SHIFT_TABLE[i];
              }
              x = x / 2;
              y = y / 2;
              i = i + 1;
            }
            if (ans) {
              {
                int al = mres, c = ml, sum;
                while (c) {
                  ans = 0;
                  i = 0;
                  x = al;
                  y = c;
                  while (i < 16) {
                    if (x % 2) {
                      if (y % 2 == 0) {
                        ans = ans + 1 * SHIFT_TABLE[i];
                      }
                    } else if (y % 2) {
                      ans = ans + 1 * SHIFT_TABLE[i];
                    }
                    x = x / 2;
                    y = y / 2;
                    i = i + 1;
                  }
                  sum = ans;
                  ans = 0;
                  i = 0;
                  x = al;
                  y = c;
                  while (i < 16) {
                    if (x % 2 && y % 2) {
                      ans = ans + 1 * SHIFT_TABLE[i];
                    }
                    x = x / 2;
                    y = y / 2;
                    i = i + 1;
                  }
                  c = ans;
                  if ((1) > 15) {
                    ans = 0;
                  } else {
                    ans = 0;
                    i = 0;
                    x = (c)*SHIFT_TABLE[1];
                    y = 0xffff;
                    while (i < 16) {
                      if (x % 2 && y % 2) {
                        ans = ans + 1 * SHIFT_TABLE[i];
                      }
                      x = x / 2;
                      y = y / 2;
                      i = i + 1;
                    }
                  }
                  c = ans;
                  al = sum;
                }
                ans = al;
              }
              mres = ans;
            }
            {
              int al = ml, c = ml, sum;
              while (c) {
                ans = 0;
                i = 0;
                x = al;
                y = c;
                while (i < 16) {
                  if (x % 2) {
                    if (y % 2 == 0) {
                      ans = ans + 1 * SHIFT_TABLE[i];
                    }
                  } else if (y % 2) {
                    ans = ans + 1 * SHIFT_TABLE[i];
                  }
                  x = x / 2;
                  y = y / 2;
                  i = i + 1;
                }
                sum = ans;
                ans = 0;
                i = 0;
                x = al;
                y = c;
                while (i < 16) {
                  if (x % 2 && y % 2) {
                    ans = ans + 1 * SHIFT_TABLE[i];
                  }
                  x = x / 2;
                  y = y / 2;
                  i = i + 1;
                }
                c = ans;
                if ((1) > 15) {
                  ans = 0;
                } else {
                  ans = 0;
                  i = 0;
                  x = (c)*SHIFT_TABLE[1];
                  y = 0xffff;
                  while (i < 16) {
                    if (x % 2 && y % 2) {
                      ans = ans + 1 * SHIFT_TABLE[i];
                    }
                    x = x / 2;
                    y = y / 2;
                    i = i + 1;
                  }
                }
                c = ans;
                al = sum;
              }
              ans = al;
            }
            ml = ans;
            x = mr;
            y = 1;
            if (y >= 15) {
              if (x < 0) {
                ans = 0xffff;
              } else {
                ans = 0;
              }
            } else if (y > 0) {
              if (x > 0x7fff) {
                x = x / SHIFT_TABLE[y];
                ans = x + 65536 - SHIFT_TABLE[15 - y + 1];
              } else {
                ans = x / SHIFT_TABLE[y];
              }
            } else {
              ans = x;
            }
            mr = ans;
          }
          ans = mres;
        }
        pl = ans;
        x = pr;
        y = 1;
        if (y >= 15) {
          if (x < 0) {
            ans = 0xffff;
          } else {
            ans = 0;
          }
        } else if (y > 0) {
          if (x > 0x7fff) {
            x = x / SHIFT_TABLE[y];
            ans = x + 65536 - SHIFT_TABLE[15 - y + 1];
          } else {
            ans = x / SHIFT_TABLE[y];
          }
        } else {
          ans = x;
        }
        pr = ans;
      }
      ans = pres;
    }
    putint(ans);
    putch(10);
    cur = cur + 1;
  }
  cur = 0;
  while (cur < 16) {
    {
      int pl = 2, pr = cur, pres = 1;
      while (pr > 0) {
        ans = 0;
        i = 0;
        x = pr;
        y = 1;
        while (i < 16) {
          if (x % 2 && y % 2) {
            ans = ans + 1 * SHIFT_TABLE[i];
          }
          x = x / 2;
          y = y / 2;
          i = i + 1;
        }
        if (ans) {
          {
            int ml = pres, mr = pl, mres = 0;
            while (mr) {
              ans = 0;
              i = 0;
              x = mr;
              y = 1;
              while (i < 16) {
                if (x % 2 && y % 2) {
                  ans = ans + 1 * SHIFT_TABLE[i];
                }
                x = x / 2;
                y = y / 2;
                i = i + 1;
              }
              if (ans) {
                {
                  int al = mres, c = ml, sum;
                  while (c) {
                    ans = 0;
                    i = 0;
                    x = al;
                    y = c;
                    while (i < 16) {
                      if (x % 2) {
                        if (y % 2 == 0) {
                          ans = ans + 1 * SHIFT_TABLE[i];
                        }
                      } else if (y % 2) {
                        ans = ans + 1 * SHIFT_TABLE[i];
                      }
                      x = x / 2;
                      y = y / 2;
                      i = i + 1;
                    }
                    sum = ans;
                    ans = 0;
                    i = 0;
                    x = al;
                    y = c;
                    while (i < 16) {
                      if (x % 2 && y % 2) {
                        ans = ans + 1 * SHIFT_TABLE[i];
                      }
                      x = x / 2;
                      y = y / 2;
                      i = i + 1;
                    }
                    c = ans;
                    if ((1) > 15) {
                      ans = 0;
                    } else {
                      ans = 0;
                      i = 0;
                      x = (c)*SHIFT_TABLE[1];
                      y = 0xffff;
                      while (i < 16) {
                        if (x % 2 && y % 2) {
                          ans = ans + 1 * SHIFT_TABLE[i];
                        }
                        x = x / 2;
                        y = y / 2;
                        i = i + 1;
                      }
                    }
                    c = ans;
                    al = sum;
                  }
                  ans = al;
                }
                mres = ans;
              }
              {
                int al = ml, c = ml, sum;
                while (c) {
                  ans = 0;
                  i = 0;
                  x = al;
                  y = c;
                  while (i < 16) {
                    if (x % 2) {
                      if (y % 2 == 0) {
                        ans = ans + 1 * SHIFT_TABLE[i];
                      }
                    } else if (y % 2) {
                      ans = ans + 1 * SHIFT_TABLE[i];
                    }
                    x = x / 2;
                    y = y / 2;
                    i = i + 1;
                  }
                  sum = ans;
                  ans = 0;
                  i = 0;
                  x = al;
                  y = c;
                  while (i < 16) {
                    if (x % 2 && y % 2) {
                      ans = ans + 1 * SHIFT_TABLE[i];
                    }
                    x = x / 2;
                    y = y / 2;
                    i = i + 1;
                  }
                  c = ans;
                  if ((1) > 15) {
                    ans = 0;
                  } else {
                    ans = 0;
                    i = 0;
                    x = (c)*SHIFT_TABLE[1];
                    y = 0xffff;
                    while (i < 16) {
                      if (x % 2 && y % 2) {
                        ans = ans + 1 * SHIFT_TABLE[i];
                      }
                      x = x / 2;
                      y = y / 2;
                      i = i + 1;
                    }
                  }
                  c = ans;
                  al = sum;
                }
                ans = al;
              }
              ml = ans;
              x = mr;
              y = 1;
              if (y >= 15) {
                if (x < 0) {
                  ans = 0xffff;
                } else {
                  ans = 0;
                }
              } else if (y > 0) {
                if (x > 0x7fff) {
                  x = x / SHIFT_TABLE[y];
                  ans = x + 65536 - SHIFT_TABLE[15 - y + 1];
                } else {
                  ans = x / SHIFT_TABLE[y];
                }
              } else {
                ans = x;
              }
              mr = ans;
            }
            ans = mres;
          }
          pres = ans;
        }
        {
          int ml = pl, mr = pl, mres = 0;
          while (mr) {
            ans = 0;
            i = 0;
            x = mr;
            y = 1;
            while (i < 16) {
              if (x % 2 && y % 2) {
                ans = ans + 1 * SHIFT_TABLE[i];
              }
              x = x / 2;
              y = y / 2;
              i = i + 1;
            }
            if (ans) {
              {
                int al = mres, c = ml, sum;
                while (c) {
                  ans = 0;
                  i = 0;
                  x = al;
                  y = c;
                  while (i < 16) {
                    if (x % 2) {
                      if (y % 2 == 0) {
                        ans = ans + 1 * SHIFT_TABLE[i];
                      }
                    } else if (y % 2) {
                      ans = ans + 1 * SHIFT_TABLE[i];
                    }
                    x = x / 2;
                    y = y / 2;
                    i = i + 1;
                  }
                  sum = ans;
                  ans = 0;
                  i = 0;
                  x = al;
                  y = c;
                  while (i < 16) {
                    if (x % 2 && y % 2) {
                      ans = ans + 1 * SHIFT_TABLE[i];
                    }
                    x = x / 2;
                    y = y / 2;
                    i = i + 1;
                  }
                  c = ans;
                  if ((1) > 15) {
                    ans = 0;
                  } else {
                    ans = 0;
                    i = 0;
                    x = (c)*SHIFT_TABLE[1];
                    y = 0xffff;
                    while (i < 16) {
                      if (x % 2 && y % 2) {
                        ans = ans + 1 * SHIFT_TABLE[i];
                      }
                      x = x / 2;
                      y = y / 2;
                      i = i + 1;
                    }
                  }
                  c = ans;
                  al = sum;
                }
                ans = al;
              }
              mres = ans;
            }
            {
              int al = ml, c = ml, sum;
              while (c) {
                ans = 0;
                i = 0;
                x = al;
                y = c;
                while (i < 16) {
                  if (x % 2) {
                    if (y % 2 == 0) {
                      ans = ans + 1 * SHIFT_TABLE[i];
                    }
                  } else if (y % 2) {
                    ans = ans + 1 * SHIFT_TABLE[i];
                  }
                  x = x / 2;
                  y = y / 2;
                  i = i + 1;
                }
                sum = ans;
                ans = 0;
                i = 0;
                x = al;
                y = c;
                while (i < 16) {
                  if (x % 2 && y % 2) {
                    ans = ans + 1 * SHIFT_TABLE[i];
                  }
                  x = x / 2;
                  y = y / 2;
                  i = i + 1;
                }
                c = ans;
                if ((1) > 15) {
                  ans = 0;
                } else {
                  ans = 0;
                  i = 0;
                  x = (c)*SHIFT_TABLE[1];
                  y = 0xffff;
                  while (i < 16) {
                    if (x % 2 && y % 2) {
                      ans = ans + 1 * SHIFT_TABLE[i];
                    }
                    x = x / 2;
                    y = y / 2;
                    i = i + 1;
                  }
                }
                c = ans;
                al = sum;
              }
              ans = al;
            }
            ml = ans;
            x = mr;
            y = 1;
            if (y >= 15) {
              if (x < 0) {
                ans = 0xffff;
              } else {
                ans = 0;
              }
            } else if (y > 0) {
              if (x > 0x7fff) {
                x = x / SHIFT_TABLE[y];
                ans = x + 65536 - SHIFT_TABLE[15 - y + 1];
              } else {
                ans = x / SHIFT_TABLE[y];
              }
            } else {
              ans = x;
            }
            mr = ans;
          }
          ans = mres;
        }
        pl = ans;
        x = pr;
        y = 1;
        if (y >= 15) {
          if (x < 0) {
            ans = 0xffff;
          } else {
            ans = 0;
          }
        } else if (y > 0) {
          if (x > 0x7fff) {
            x = x / SHIFT_TABLE[y];
            ans = x + 65536 - SHIFT_TABLE[15 - y + 1];
          } else {
            ans = x / SHIFT_TABLE[y];
          }
        } else {
          ans = x;
        }
        pr = ans;
      }
      ans = pres;
    }
    if (SHIFT_TABLE[cur] != ans) return 1;
    cur = cur + 1;
  }
  return 0;
}

int main() {
  return long_func();
}
