echo "Enter your Comments:"
read comments


INPUT='~/liberty-projects/nightly-regression/401.bzip2/spec_ref1/in/'
FILE='chicken.jpg'
FILE2='chicken2.jpg'

OUTPUT='~/nightly-regression/401.bzip2/spec_ref1/in/'

#input_file = "../spec_ref1/in/chicken.jpg"
#input_file2 = "../spec_ref1/in/chicken2.jpg"

rm *.out *.bc *.s *.prof

cp $INPUT$FILE $OUTPUT$FILE2
cp $INPUT$FILE $OUTPUT$FILE

#cp ~/liberty-projects/nightly-regression/401.bzip2/spec_train1/in/byoudoin.jpg ~/    nightly-regression/401.bzip2/spec_train1/in/byoudoin2.jpg

#cp ~/liberty-projects/nightly-regression/401.bzip2/spec_train1/in/byoudoin.jpg ~/    nightly-regression/401.bzip2/spec_train1/in/

 #cp ~/liberty-projects/nightly-regression/401.bzip2/spec_ref1/in/chicken.jpg ~/nig    htly-regression/401.bzip2/spec_ref1/in/chicken2.jpg

 #cp ~/liberty-projects/nightly-regression/401.bzip2/spec_ref1/in/chicken.jpg ~/nig    htly-regression/401.bzip2/spec_ref1/in/



 #clang -emit-llvm -O3 -c blocksort.c -o blocksort.bc
 #clang -emit-llvm -O3 -c bzip2.c -o bzip2.bc
 #clang -emit-llvm -O3 -c bzlib.c -o bzlib.bc
 #clang -emit-llvm -O3 -c compress.c -o compress.bc
 #clang -emit-llvm -O3 -c crctable.c -o crctable.bc
 #clang -emit-llvm -O3 -c decompress.c -o decompress.bc
 #clang -emit-llvm -O3 -c huffman.c -o huffman.bc
 #clang -emit-llvm -O3 -c randtable.c -o randtable.bc
 #clang -emit-llvm -O3 -c spec.c -o spec.bc
 clang -emit-llvm -c blocksort.c -o blocksort.bc
 clang -emit-llvm -c bzip2.c -o bzip2.bc
 clang -emit-llvm -c bzlib.c -o bzlib.bc
 clang -emit-llvm -c compress.c -o compress.bc
 clang -emit-llvm -c crctable.c -o crctable.bc
 clang -emit-llvm -c decompress.c -o decompress.bc
 clang -emit-llvm -c huffman.c -o huffman.bc
 clang -emit-llvm -c randtable.c -o randtable.bc
 clang -emit-llvm -c spec.c -o spec.bc


 llvm-link blocksort.bc bzip2.bc bzlib.bc compress.bc crctable.bc decompress.bc huf    fman.bc randtable.bc spec.bc -o main.bc

 opt -insert-edge-profiling -f main.bc -o main.prof

 llc main.prof -o main.s

 gcc main.s -lrt -L$LLVM_OBJ_DIR/Debug+Asserts/lib/ -lprofile_rt -lm -o program.exe     $LIBS

 regressions-watchdog 1800 original.time ./program.exe $OUTPUT$FILE

 opt -profile-loader -load ~/llvm-liberty-objects/Debug+Asserts/lib/HKTailDuplicati    on.so -HKtaildupl main.bc -o mainnew.bc

 llc mainnew.bc -o mainnew.s

 gcc mainnew.s -lrt -L$LLVM_OBJ_DIR/Debug+Asserts/lib/ -lprofile_rt -lm -o program-    tail.exe $LIBS

 regressions-watchdog 1800 afterpass.time ./program-tail.exe $OUTPUT$FILE2

 echo "--------------Comments: $comments---------" >> timecompare
 echo Before: >> time compare
 cat original.time >> timecompare
 echo After: >> timecompare
 cat afterpass.time >> timecompare
 echo ------------------------------------------------
 cat timecompare
