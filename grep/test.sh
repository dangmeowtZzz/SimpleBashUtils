#!/bin/bash
echo "flg -e"
./s21_grep -e "feel" ../common/txt_test_grep/grep.txt > ../common/s21_grep.txt
grep -e "feel" ../common/txt_test_grep/grep.txt > ../common/original_grep.txt
shasum ../common/s21_grep.txt ../common/original_grep.txt > ../common/diff_grep.txt
../common/test_grep
echo "\n"

echo "flg -s"
./s21_grep -s "feel" ../common/txt_test > ../common/s21_grep.txt
grep -s "feel" ../common/txt_test > ../common/original_grep.txt
shasum ../common/s21_grep.txt ../common/original_grep.txt > ../common/diff_grep.txt
../common/test_grep
echo "\n"

echo "flg -i"
./s21_grep -i "fEEl" ../common/txt_test_grep/grep.txt > ../common/s21_grep.txt
grep -i "fEEl" ../common/txt_test_grep/grep.txt > ../common/original_grep.txt
shasum ../common/s21_grep.txt ../common/original_grep.txt > ../common/diff_grep.txt
../common/test_grep
echo "\n"

echo "flg -v"
./s21_grep -v "feel" ../common/txt_test_grep/grep.txt > ../common/s21_grep.txt
grep -v "feel" ../common/txt_test_grep/grep.txt > ../common/original_grep.txt
shasum ../common/s21_grep.txt ../common/original_grep.txt > ../common/diff_grep.txt
../common/test_grep
echo "\n"

echo "flg -c"
./s21_grep -c "feel" ../common/txt_test_grep/grep.txt > ../common/s21_grep.txt
grep -c "feel" ../common/txt_test_grep/grep.txt > ../common/original_grep.txt
shasum ../common/s21_grep.txt ../common/original_grep.txt > ../common/diff_grep.txt
../common/test_grep
echo "\n"

echo "flg -n"
./s21_grep -n "feel" ../common/txt_test_grep/grep.txt > ../common/s21_grep.txt
grep -n "feel" ../common/txt_test_grep/grep.txt > ../common/original_grep.txt
shasum ../common/s21_grep.txt ../common/original_grep.txt > ../common/diff_grep.txt
../common/test_grep
echo "\n"

echo "flg -h"
./s21_grep -h "feel" ../common/txt_test_grep/grep.txt > ../common/s21_grep.txt
grep -h "feel" ../common/txt_test_grep/grep.txt > ../common/original_grep.txt
shasum ../common/s21_grep.txt ../common/original_grep.txt > ../common/diff_grep.txt
../common/test_grep
echo "\n"

echo "flg -s"
./s21_grep -s "feel" ../common/txt_test_grep/grep.txt > ../common/s21_grep.txt
grep -s "feel" ../common/txt_test_grep/grep.txt > ../common/original_grep.txt
shasum ../common/s21_grep.txt ../common/original_grep.txt > ../common/diff_grep.txt
../common/test_grep
echo "\n"

echo "flg -o"
./s21_grep -o "feel" ../common/txt_test_grep/grep.txt > ../common/s21_grep.txt
grep -o "feel" ../common/txt_test_grep/grep.txt > ../common/original_grep.txt
shasum ../common/s21_grep.txt ../common/original_grep.txt > ../common/diff_grep.txt
../common/test_grep
echo "\n"

echo "flg -f"
./s21_grep -f ../common/txt_test_grep/grep_pattern_file.txt ../common/txt_test_grep/grep.txt > ../common/s21_grep.txt
grep -f ../common/txt_test_grep/grep_pattern_file.txt ../common/txt_test_grep/grep.txt > ../common/original_grep.txt
shasum ../common/s21_grep.txt ../common/original_grep.txt > ../common/diff_grep.txt
../common/test_grep
echo "\n"

echo "flg -l"
./s21_grep -l "feel" ../common/txt_test_grep/grep.txt ../common/txt_test_grep/grep_2.txt > ../common/s21_grep.txt
grep -l "feel" ../common/txt_test_grep/grep.txt ../common/txt_test_grep/grep_2.txt > ../common/original_grep.txt
shasum ../common/s21_grep.txt ../common/original_grep.txt > ../common/diff_grep.txt
../common/test_grep
echo "\n"

echo "no flags"
./s21_grep "feel" ../common/txt_test_grep/grep.txt > ../common/s21_grep.txt
grep "feel" ../common/txt_test_grep/grep.txt > ../common/original_grep.txt
shasum ../common/s21_grep.txt ../common/original_grep.txt > ../common/diff_grep.txt
../common/test_grep
echo "\n"

echo "flg -cl"
./s21_grep -cl "feel" ../common/txt_test_grep/grep.txt > ../common/s21_grep.txt
grep -cl "feel" ../common/txt_test_grep/grep.txt > ../common/original_grep.txt
shasum ../common/s21_grep.txt ../common/original_grep.txt > ../common/diff_grep.txt
../common/test_grep
echo "\n"

echo "flg -ei"
./s21_grep -e "feel" -i ../common/txt_test_grep/grep.txt > ../common/s21_grep.txt
grep -e "feel" -i ../common/txt_test_grep/grep.txt > ../common/original_grep.txt
shasum ../common/s21_grep.txt ../common/original_grep.txt > ../common/diff_grep.txt
../common/test_grep
echo "\n"

echo "flg -ov"
./s21_grep -vo "feel" ../common/txt_test_grep/grep.txt > ../common/s21_grep.txt
grep -vo "feel" ../common/txt_test_grep/grep.txt > ../common/original_grep.txt
shasum ../common/s21_grep.txt ../common/original_grep.txt > ../common/diff_grep.txt
../common/test_grep
echo "\n"

echo "flg -ol"
./s21_grep -ol "feel" ../common/txt_test_grep/grep.txt > ../common/s21_grep.txt
grep -ol "feel" ../common/txt_test_grep/grep.txt > ../common/original_grep.txt
shasum ../common/s21_grep.txt ../common/original_grep.txt > ../common/diff_grep.txt
../common/test_grep
echo "\n"

echo "flg -ef"
./s21_grep -ef ../common/txt_test_grep/grep.txt ../common/txt_test_grep/grep_2.txt > ../common/s21_grep.txt
grep -ef ../common/txt_test_grep/grep.txt ../common/txt_test_grep/grep_2.txt > ../common/original_grep.txt
shasum ../common/s21_grep.txt ../common/original_grep.txt > ../common/diff_grep.txt
../common/test_grep
echo "\n"

echo "flg -vn"
./s21_grep -vn ../common/txt_test_grep/grep.txt ../common/txt_test_grep/grep_2.txt > ../common/s21_grep.txt
grep -vn ../common/txt_test_grep/grep.txt ../common/txt_test_grep/grep_2.txt > ../common/original_grep.txt
shasum ../common/s21_grep.txt ../common/original_grep.txt > ../common/diff_grep.txt
../common/test_grep
echo "\n"











