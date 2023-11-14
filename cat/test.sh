#!/bin/bash
echo "flg -v"
./s21_cat -v ../common/txt_test_cat/ascii.txt > ../common/s21_cat.txt
cat -v ../common/txt_test_cat/ascii.txt > ../common/original_cat.txt
shasum ../common/s21_cat.txt ../common/original_cat.txt > ../common/diff_cat.txt
../common/test_cat
echo "\n"

echo "flg -n"
./s21_cat -n ../common/txt_test_cat/cat.txt > ../common/s21_cat.txt
cat -n ../common/txt_test_cat/cat.txt > ../common/original_cat.txt
shasum ../common/s21_cat.txt ../common/original_cat.txt > ../common/diff_cat.txt
../common/test_cat
echo "\n"

echo "flg -b"
./s21_cat -b ../common/txt_test_cat/cat.txt > ../common/s21_cat.txt
cat -b ../common/txt_test_cat/cat.txt > ../common/original_cat.txt
shasum ../common/s21_cat.txt ../common/original_cat.txt > ../common/diff_cat.txt
../common/test_cat
echo "\n"

echo "flg -e"
./s21_cat -e ../common/txt_test_cat/cat.txt > ../common/s21_cat.txt
cat -e ../common/txt_test_cat/cat.txt > ../common/original_cat.txt
shasum ../common/s21_cat.txt ../common/original_cat.txt > ../common/diff_cat.txt
../common/test_cat
echo "\n"

echo "flg -t"
./s21_cat -t ../common/txt_test_cat/cat.txt > ../common/s21_cat.txt
cat -t ../common/txt_test_cat/cat.txt > ../common/original_cat.txt
shasum ../common/s21_cat.txt ../common/original_cat.txt > ../common/diff_cat.txt
../common/test_cat
echo "\n"


echo "flg -s"
./s21_cat -s ../common/txt_test_cat/cat.txt > ../common/s21_cat.txt
cat -s ../common/txt_test_cat/cat.txt > ../common/original_cat.txt
shasum ../common/s21_cat.txt ../common/original_cat.txt > ../common/diff_cat.txt
../common/test_cat
echo "\n"

echo "flg --number-nonblank"
./s21_cat --number-nonblank ../common/txt_test_cat/cat.txt > ../common/s21_cat.txt
cat -b ../common/txt_test_cat/cat.txt > ../common/original_cat.txt
shasum ../common/s21_cat.txt ../common/original_cat.txt > ../common/diff_cat.txt
../common/test_cat
echo "\n"

echo "flg --number"
./s21_cat --number ../common/txt_test_cat/cat.txt > ../common/s21_cat.txt
cat -n ../common/txt_test_cat/cat.txt > ../common/original_cat.txt
shasum ../common/s21_cat.txt ../common/original_cat.txt > ../common/diff_cat.txt
../common/test_cat
echo "\n"

echo "flg -s"
./s21_cat --squeeze-blank ../common/txt_test_cat/cat.txt > ../common/s21_cat.txt
cat -s ../common/txt_test_cat/cat.txt > ../common/original_cat.txt
shasum ../common/s21_cat.txt ../common/original_cat.txt > ../common/diff_cat.txt
../common/test_cat
echo "\n"

echo "flg -nb"
./s21_cat -nb ../common/txt_test_cat/cat.txt > ../common/s21_cat.txt
cat -nb ../common/txt_test_cat/cat.txt > ../common/original_cat.txt
shasum ../common/s21_cat.txt ../common/original_cat.txt > ../common/diff_cat.txt
../common/test_cat
echo "\n"

echo "flg -nts"
./s21_cat -nts ../common/txt_test_cat/cat.txt > ../common/s21_cat.txt
cat -nts ../common/txt_test_cat/cat.txt > ../common/original_cat.txt
shasum ../common/s21_cat.txt ../common/original_cat.txt > ../common/diff_cat.txt
../common/test_cat
echo "\n"

echo "flg -T"
./s21_cat -T -v ../common/txt_test_cat/ascii.txt > ../common/s21_cat.txt
cat -t ../common/txt_test_cat/ascii.txt > ../common/original_cat.txt
shasum ../common/s21_cat.txt ../common/original_cat.txt > ../common/diff_cat.txt
../common/test_cat
echo "\n"

echo "flg -E"
./s21_cat -E -v ../common/txt_test_cat/ascii.txt > ../common/s21_cat.txt
cat -e ../common/txt_test_cat/ascii.txt > ../common/original_cat.txt
shasum ../common/s21_cat.txt ../common/original_cat.txt > ../common/diff_cat.txt
../common/test_cat
echo "\n"


