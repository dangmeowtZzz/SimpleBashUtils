#include <stdio.h>
#include <string.h>

int main(void) {
  FILE *file;
  file = fopen("../common/diff_cat.txt", "r");
  int max = 90;
  int max_save = 42;

  char buf_my[90] = {0};
  char sha_my[42] = {0};

  char buf_ori[90] = {0};
  char sha_ori[42] = {0};
  int res = 1;

  if (file != NULL) {
    fgets(buf_my, max, file);
    for (int i = 0; i < max_save; i++) {
      sha_my[i] = buf_my[i];
    }
    sha_my[41] = '\0';

    fgets(buf_ori, max, file);
    for (int i = 0; i < max_save; i++) {
      sha_ori[i] = buf_ori[i];
    }
    sha_ori[41] = '\0';

    res = strcmp(sha_my, sha_ori);
    printf("My-SHA = %s\n Original-SHA = %s\n", sha_my, sha_ori);
    if (res == 0)
      printf("Успех");
    else
      printf("Неудача");
  } else
    printf("ERROR");

  return 0;
}
