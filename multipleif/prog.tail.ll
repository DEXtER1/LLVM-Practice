; ModuleID = 'prog.tail.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str2 = private unnamed_addr constant [19 x i8] c"\0ANext IF statement\00", align 1
@.str3 = private unnamed_addr constant [8 x i8] c"\0AJ : %d\00", align 1
@.str4 = private unnamed_addr constant [8 x i8] c"\0AK : %d\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 0, i32* %i, align 4
  store i32 0, i32* %j, align 4
  store i32 0, i32* %k, align 4
  br label %do.body

do.body:                                          ; preds = %do.cond, %entry
  %0 = load i32* %i, align 4
  %inc = add nsw i32 %0, 1
  store i32 %inc, i32* %i, align 4
  %rem = srem i32 %inc, 10
  %cmp = icmp ne i32 %rem, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %do.body
  %1 = load i32* %i, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str, i32 0, i32 0), i32 %1)
  br label %if.end

if.else:                                          ; preds = %do.body
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str1, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %call2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str2, i32 0, i32 0))
  %2 = load i32* %i, align 4
  %rem3 = srem i32 %2, 2
  %cmp4 = icmp eq i32 %rem3, 0
  br i1 %cmp4, label %if.then7, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end.clone, %if.end
  %3 = load i32* %i, align 4
  %rem5 = srem i32 %3, 3
  %cmp6 = icmp eq i32 %rem5, 0
  br i1 %cmp6, label %if.then7, label %if.else9

if.then7:                                         ; preds = %if.end.clone, %lor.lhs.false, %if.end
  %4 = load i32* %j, align 4
  %inc8 = add nsw i32 %4, 1
  store i32 %inc8, i32* %j, align 4
  br label %if.end11

if.else9:                                         ; preds = %lor.lhs.false
  %5 = load i32* %k, align 4
  %inc10 = add nsw i32 %5, 1
  store i32 %inc10, i32* %k, align 4
  br label %if.end11

if.end11:                                         ; preds = %if.then7.clone, %if.else9, %if.then7
  %6 = load i32* %j, align 4
  %call12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str3, i32 0, i32 0), i32 %6)
  %7 = load i32* %k, align 4
  %call13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str4, i32 0, i32 0), i32 %7)
  br label %do.cond

do.cond:                                          ; preds = %if.end11.clone, %if.end11
  %8 = load i32* %i, align 4
  %cmp14 = icmp slt i32 %8, 100
  br i1 %cmp14, label %do.body, label %do.end

do.end:                                           ; preds = %do.cond
  ret i32 0

if.end.clone:                                     ; No predecessors!
  %call2.clone = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str2, i32 0, i32 0))
  %9 = load i32* %i, align 4
  %rem3.clone = srem i32 %9, 2
  %cmp4.clone = icmp eq i32 %rem3.clone, 0
  br i1 %cmp4.clone, label %if.then7, label %lor.lhs.false

if.then7.clone:                                   ; No predecessors!
  %10 = load i32* %j, align 4
  %inc8.clone = add nsw i32 %10, 1
  store i32 %inc8.clone, i32* %j, align 4
  br label %if.end11

if.end11.clone:                                   ; No predecessors!
  %11 = load i32* %j, align 4
  %call12.clone = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str3, i32 0, i32 0), i32 %11)
  %12 = load i32* %k, align 4
  %call13.clone = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str4, i32 0, i32 0), i32 %12)
  br label %do.cond
}

declare i32 @printf(i8*, ...)
