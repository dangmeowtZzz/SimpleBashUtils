CC= gcc
CFLAGS= -Wall -Wextra -Werror
GREP= s21_grep.c
GREP_TEST= ../common/test_grep.c

all: s21_grep test_grep

s21_grep:
	$(CC) $(CFLAGS) $(GREP) -o s21_grep

test_grep:
	$(CC) $(CFLAGS) $(GREP_TEST) -o ../common/test_grep

test:
	sh test.sh

clean:
	rm -rf s21_grep
	rm -rf ../common/test_grep
	rm -rf *.a *.out *.o ../common/diff_grep.txt ../common/original_grep.txt ../common/s21_grep.txt

check:
	cppcheck --enable=all --suppress=missingIncludeSystem s21_grep.c
	leaks --atExit -- ./s21_grep "feel" ../common/txt_test_grep/grep.txt
	clang-format -n s21_grep.c ../common/test_grep.c

rebuild:
	make clean
	make all
	rm -rf  *.o *.a