
# Removes previous temporary files and pdfs from respective folders
# Generates bitcode file from the C file and creates pdf of the bitcode file in the pdf folder.
# Inserts profiling information and generates executable
# runs executable and uses the profiling information in the Tail duplication pass -> generates prog.tail.bc

# Generates the pdf of the sample program after the tail duplication pass

rm -r temp_files
rm -r pdf
mkdir temp_files
mkdir pdf

clang -emit-llvm program.c -c -o ./temp_files/program.bc
cd temp_files

opt -O3 program.bc -o programO3.bc
clang programO3.bc -o program.exe


cd ..
dir=$(basename `pwd`)
cd temp_files

opt -insert-edge-profiling -f program.bc -o program.prof
llc program.prof -o program.s
gcc program.s -lrt -L$LLVM_OBJ_DIR/Debug+Asserts/lib/ -lprofile_rt -lm -o programprof.exe $LIBS

./programprof.exe 4 profilingoutput.txt

opt -profile-loader -load ~/llvm-liberty-objects/Debug+Asserts/lib/HKTailDuplication.so -HKtaildupl program.bc -o prog.tail.bc
opt -O3 prog.tail.bc -o progO3.tail.bc
llc progO3.tail.bc -o progtail.s
gcc progtail.s -lrt -L$LLVM_OBJ_DIR/Debug+Asserts/lib/ -lprofile_rt -lm -o prog-tail.exe $LIBS

#<<PDFs
opt -dot-cfg-only program.bc
# Creating Plain Program Pdfs
dot -Tpdf ./cfg.main.dot -o ../pdf/$dir-program_main.pdf
dot -Tpdf ./cfg.place.dot -o ../pdf/$dir-program_place.pdf
dot -Tpdf ./cfg.print_sol.dot -o ../pdf/$dir-program_printsol.pdf
dot -Tpdf ./cfg.queen.dot -o ../pdf/$dir-program_queen.pdf

# Creating Pdfs for program after pass

opt -dot-cfg-only prog.tail.bc
dot -Tpdf ./cfg.main.dot -o ../pdf/$dir-tail_main.pdf
dot -Tpdf ./cfg.place.dot -o ../pdf/$dir-tail_place.pdf
dot -Tpdf ./cfg.print_sol.dot -o ../pdf/$dir-tail_printsol.pdf
dot -Tpdf ./cfg.queen.dot -o ../pdf/$dir-tail_queen.pdf

#PDFs

echo "\n Execution Results:"

./program.exe 8 before\ 8\ queens.txt 
echo  " -  Without Tail Duplication"

./prog-tail.exe 8 after\ 8\ queens.txt 
echo  " -  After Tail Duplication"
#
./program.exe 10 before\ 10\ queens.txt 
echo  " -  Without Tail Duplication"
#
./prog-tail.exe 10 after\ 10\ queens.txt 
echo  " -  After Tail Duplication"
#
./program.exe 12 before\ 12\ queens.txt 
echo  " -  Without Tail Duplication"
#
./prog-tail.exe 12 after\ 12\ queens.txt 
echo  " -  After Tail Duplication"
#
./program.exe 14 before\ 14\ queens.txt 
echo  " -  Without Tail Duplication"
#
./prog-tail.exe 14 after\ 14\ queens.txt 
echo  " -  After Tail Duplication"

./program.exe 16 before\ 16\ queens.txt 
echo  " -  Without Tail Duplication"
#
./prog-tail.exe 16 after\ 16\ queens.txt 
echo  " -  After Tail Duplication"

