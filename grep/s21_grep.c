#include <getopt.h>
#include <regex.h>
#include <stdio.h>
#include <string.h>

struct flg {
  int e;
  int i;
  int v;
  int c;
  int n;
  int h;
  int s;
  int o;
  int f;
  int l;
  const char *pattern;
  const char *inputFile;
};

int parseGrepOptions(int argc, char *argv[], struct flg *options);

int grepFile(char *argv[], struct flg *options, const char *pattern, int argc,
             int fileInd);

int main(int argc, char *argv[]) {
  int fileInd = 0;
  struct flg options = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL};
  if ((fileInd = parseGrepOptions(argc, argv, &options)) == 0) {
    return 1;
  }

  if (options.f) {
    FILE *patternsFile = fopen(options.pattern, "r");
    if (patternsFile == NULL) {
      fprintf(stderr, "Error opening pattern file: %s\n", options.pattern);
      return 1;
    }

    char pattern[1024] = {0};
    char buff_pattern[1024] = {0};
    int len = 0;
    while (fgets(buff_pattern, sizeof(buff_pattern), patternsFile) != NULL) {
      len = strlen(buff_pattern);
      for (int i = 0; i < len; i++) {
        if (buff_pattern[i] == '\n') buff_pattern[i] = '|';
      }
      strcat(pattern, buff_pattern);
    }
    len = strlen(pattern);
    if (len > 0 && pattern[len - 1] == '|') {
      pattern[len - 1] = '\0';
    }
    grepFile(argv, &options, pattern, argc, fileInd);
    fclose(patternsFile);
  } else {
    grepFile(argv, &options, options.pattern, argc, fileInd);
  }
  return 0;
}

int parseGrepOptions(int argc, char *argv[], struct flg *options) {
  int currentFlg;
  while ((currentFlg = getopt(argc, argv, "e:ivcnhsf:ol")) != -1) {
    switch (currentFlg) {
      case 'e':
        options->e = 1;
        options->pattern = optarg;
        break;
      case 'i':
        options->i = 1;
        break;
      case 'v':
        options->v = 1;
        break;
      case 'c':
        options->c = 1;
        break;
      case 'n':
        options->n = 1;
        break;
      case 'h':
        options->h = 1;
        break;
      case 's':
        options->s = 1;
        break;
      case 'f':
        options->f = 1;
        options->pattern = optarg;
        break;
      case 'o':
        options->o = 1;
        break;
      case 'l':
        options->l = 1;
        break;
      default:
        fprintf(stderr, "Usage: %s [-e pattern] [-ivcnhsfol] [file...]\n",
                argv[0]);
        return 1;
    }
  }

  int fileInd = 0;

  if (optind < argc && options->e != 1 && options->f != 1) {
    options->pattern = argv[optind];
    fileInd = optind + 1;
    options->inputFile = argv[fileInd];
  } else if (optind < argc && (options->e == 1 || options->f == 1)) {
    options->inputFile = argv[optind];
    fileInd = optind;
  }
  return fileInd;
}

int grepFile(char *argv[], struct flg *options, const char *pattern, int argc,
             int fileInd) {
  if (pattern == NULL) {
    fprintf(stderr, "Pattern not found.\n");
    return 1;
  }

  regex_t regex;
  int cflags = REG_EXTENDED;

  if (options->i == 1) {
    cflags = REG_ICASE | REG_EXTENDED;
  }

  if (regcomp(&regex, pattern, cflags) != 0) {
    fprintf(stderr, "Invalid regular expression: %s\n", pattern);
    return 1;
  }

  FILE *file = NULL;
  char line[1024];
  int lineNumber = 0;
  int matches = 0;
  int res;

  int prinnt = 0;

  if (options->v == 1 && options->o == 1) {
    options->o = 0;
  }

  for (int i = fileInd; i < argc; i++) {
    file = fopen(argv[i], "r");
    if (file == NULL) {
      if (options->s != 1) {
        fprintf(stderr, "Ошибка открытия файла: %s\n", options->inputFile);
      }
      regfree(&regex);
      return 1;
    }

    while (fgets(line, sizeof(line), file) != NULL) {
      lineNumber++;
      prinnt = 0;
      if ((res = regexec(&regex, line, 0, NULL, 0)) == 0) {
        matches++;

        if (options->o != 1) {
          if (options->h != 1 && (argc - fileInd > 1) && options->l != 1) {
            printf("%s:", argv[i]);
          }

          if (options->n == 1 && options->v != 1) {
            printf("%d:", lineNumber);
          }

          if (options->v != 1 && options->c != 1 && options->l != 1) {
            printf("%s", line);
            prinnt = 1;
          }
        }

        if (options->o == 1 && options->l != 1) {
          printf("%s", pattern);
          printf("\n");
        }
      }

      if (options->v == 1 && options->o != 1 && res != 0) {
        if (options->s != 1) {
          if (options->h != 1 && options->inputFile != NULL &&
              (argc - fileInd > 1)) {
            printf("%s:", options->inputFile);
          }

          if (options->n == 1) {
            printf("%d:", lineNumber);
          }
          printf("%s", line);
          prinnt = 1;
        }
      }
    }

    if (prinnt == 1) {
      printf("\n");
    }

    if (options->c == 1) {
      if (options->l == 1) {
        matches = 1;
      }
      printf("%d\n", matches);
    }

    if (options->l == 1) {
      printf("%s\n", argv[i]);
    }

    fclose(file);
  }
  regfree(&regex);
  return 0;
}
