BINARY=401.bzip2

#plain: $(PLAIN).out
#
#$(PLAIN).out : $(PLAIN).exe
#	date
#	rm -f benchmark.plain.out original.time
#	$(SETUP)
##	/usr/bin/time --output=original.time -f "%e" ./$(PLAIN).exe $(ARGS)$(TESTARGS) >$@ 2>&1
#	regressions-watchdog $(RUN_TIMEOUT) original.time ./$(PLAIN).exe $(ARGS)$(TESTARGS)
#	#$(CHECK)
#	#mv $(RESULT_FILE) $@
#	$(CLEANUP)
#	date
#
#$(PLAIN).exe : %.s
#	gcc $^ -lrt -L$LLVM_OBJ_DIR/DEBUG+Asserts/lib/ -lprofile_rt -lm -o $@ $LIBS
#
#%.s: %.prof
#	llc $^ -o $@
#
#%.prof : %.bc 
#	opt -insert-edge-profiling -f $^ -o $@
#
#%.bc : %.c
#	$(LLVM_CC) $(LLVM_CFLAGS) $^ -o $@

include ../../Makefile.generic
