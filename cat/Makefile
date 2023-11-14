CC= gcc
CFLAGS= -Wall -Wextra -Werror
CAT= s21_cat.c
CAT_TEST= ../common/test_cat.c

all: s21_cat test_cat

s21_cat:
	$(CC) $(CFLAGS) $(CAT) -o s21_cat

test_cat:
	$(CC) $(CFLAGS) $(CAT_TEST) -o ../common/test_cat

test:
	sh test.sh

clean:
	rm -rf s21_cat
	rm -rf ../common/test_cat
	rm -rf *.a *.out *.o ../common/diff_cat.txt ../common/original_cat.txt ../common/s21_cat.txt

check:
	cppcheck --enable=all --suppress=missingIncludeSystem s21_cat.c
	leaks --atExit -- ./s21_cat ../common/txt_test_cat/cat.txt
	clang-format -n s21_cat.c ../common/test_cat.c

rebuild:
	make clean
	make all
	rm -rf  *.o *.a