#include <getopt.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct flg {
  int b;
  int e;
  int n;
  int s;
  int t;
  int v;
};

struct option longOptions[] = {{"number-nonblank", 0, NULL, 'b'},
                               {"number", 0, NULL, 'n'},
                               {"squeeze-blank", 0, NULL, 's'},
                               {NULL, 0, NULL, 0}};

void cat(char *file, struct flg flags);
void flgParser(int argc, char *argv[], struct option longOptions[]);

int main(int argc, char *argv[]) {
  flgParser(argc, argv, longOptions);
  return 0;
}

void cat(char *file, struct flg flags) {
  FILE *file_ptr = fopen(file, "r");
  if (file_ptr == NULL) {
    fprintf(stderr, "Файл не найден");
    return;
  }

  int lineNumber = 1;
  int prevChar = '\n';
  int c;
  int prevPrevChar;

  if (flags.b == 1 && flags.n == 1) {
    flags.n = 0;
  }

  while ((c = fgetc(file_ptr)) != EOF) {
    if (flags.s == 1 && c == '\n' && prevChar == '\n' && prevPrevChar == '\n') {
      continue;
    } else {
      if (flags.n == 1 && prevChar == '\n') {
        printf("%6d\t", lineNumber++);
      }
    }

    if (flags.b == 1 && (c != '\n' && prevChar == '\n')) {
      printf("%6d\t", lineNumber++);
    }

    if (flags.e == 1 && c == '\n') {
      putchar('$');
    }

    if (flags.t == 1 && c == '\t') {
      printf("^I");
    } else if (c == '\n') {
      putchar(c);
    } else if (flags.v == 1 && c == 127) {
      printf("^?");
    } else if (flags.v == 1 && (c >= 0 && c <= 31) && c != 9) {
      c = c + '@';
      printf("^%c", c);
    } else if (flags.v == 1 && c >= 128 && c <= 159) {
      c = c - '@';
      printf("M-^%c", c);
    } else if (flags.v == 1 && (c == 9)) {
      printf("\t");
    } else {
      putchar(c);
    }
    prevPrevChar = prevChar;
    prevChar = c;
  }
  fclose(file_ptr);
}

void flgParser(int argc, char *argv[], struct option longOptions[]) {
  int errFlg = 1;
  struct flg Flags = {0, 0, 0, 0, 0, 0};
  int currentFlg;
  while ((currentFlg =
              getopt_long(argc, argv, "benstvTE", longOptions, NULL)) != -1) {
    switch (currentFlg) {
      case 'b':
        Flags.b = 1;
        break;
      case 'e':
        Flags.e = 1;
        break;
      case 'n':
        Flags.n = 1;
        break;
      case 's':
        Flags.s = 1;
        break;
      case 't':
        Flags.t = 1;
        Flags.v = 1;
        break;
      case 'v':
        Flags.v = 1;
        break;
      case 'T':
        Flags.t = 1;
        break;
      case 'E':
        Flags.e = 1;
        Flags.v = 1;
        break;
      default:
        fprintf(
            stderr,
            "Правильное использование: ./cat | %s [-b -e -n -s -t -v] | файл\n",
            argv[0]);
        errFlg = 0;
    }
  }

  if (errFlg == 1) {
    if (optind == argc) {
      fprintf(stderr, ("Отсутствует файл для чтения\n"));
      errFlg = 0;
    }
    if (errFlg == 1) {
      for (int i = optind; i < argc; i++) {
        cat(argv[i], Flags);
      }
    }
  }
}
