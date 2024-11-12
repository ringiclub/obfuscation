; ModuleID = 'src/dump/pluto/main.ll'
source_filename = "src/analysis/main.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [14 x i8] c"Phacomochere\00\00", align 1
@good_string = dso_local local_unnamed_addr global ptr @.str, align 8
@size_good_string = dso_local local_unnamed_addr global i32 0, align 4
@good_value = dso_local local_unnamed_addr global i64 7594306241854992217, align 8
@stderr = external local_unnamed_addr global ptr, align 8
@.str.1 = private unnamed_addr constant [32 x i8] c"Usage: %s <string> <hex_value>\0A\00", align 1
@str = private unnamed_addr constant [29 x i8] c"RootFunction returned false.\00", align 1
@str.4 = private unnamed_addr constant [28 x i8] c"RootFunction returned true.\00", align 1

; Function Attrs: nofree nounwind uwtable
define dso_local noundef i32 @main(i32 noundef %0, ptr nocapture noundef readonly %1) local_unnamed_addr #0 {
  %.reg2mem26 = alloca i64, align 8
  %.reg2mem24 = alloca i64, align 8
  %.reg2mem22 = alloca i64, align 8
  %.reg2mem18 = alloca i32, align 4
  %.reg2mem14 = alloca ptr, align 8
  %.reg2mem10 = alloca ptr, align 8
  %.reg2mem7 = alloca i64, align 8
  %.reg2mem5 = alloca i1, align 1
  %3 = load ptr, ptr @good_string, align 8, !tbaa !5
  %4 = tail call i64 @strlen(ptr noundef nonnull dereferenceable(1) %3) #5
  %5 = trunc i64 %4 to i32
  %6 = add i32 %5, 1
  store i32 %6, ptr @size_good_string, align 4, !tbaa !9
  %7 = icmp eq i32 %0, 3
  store i1 %7, ptr %.reg2mem5, align 1
  %swVar.ptr = alloca i32, align 4
  store i32 1340081909, ptr %swVar.ptr, align 4
  %.reg2mem = alloca i64, align 8
  %.reg2mem1 = alloca i1, align 1
  %.reg2mem3 = alloca i32, align 4
  br label %dispatchBB

dispatchBB:                                       ; preds = %2, %returnBB
  %swVar = load i32, ptr %swVar.ptr, align 4
  switch i32 %swVar, label %swDefault [
    i32 1340081909, label %newBB
    i32 -1527638545, label %9
    i32 1769488241, label %13
    i32 -1669853563, label %21
    i32 -2007830455, label %28
    i32 -1316175358, label %35
    i32 -291161073, label %39
    i32 467675438, label %46
    i32 -959826747, label %48
    i32 1776151112, label %53
    i32 451824390, label %57
    i32 -590374524, label %59
    i32 -227467221, label %61
  ]

swDefault:                                        ; preds = %dispatchBB
  br label %returnBB

newBB:                                            ; preds = %dispatchBB
  %.reload6 = load volatile i1, ptr %.reg2mem5, align 1
  %8 = select i1 %.reload6, i32 1769488241, i32 -1527638545
  store i32 %8, ptr %swVar.ptr, align 4
  br label %returnBB

9:                                                ; preds = %dispatchBB
  %10 = load ptr, ptr @stderr, align 8, !tbaa !5
  %11 = load ptr, ptr %1, align 8, !tbaa !5
  %12 = tail call i32 (ptr, ptr, ...) @fprintf(ptr noundef %10, ptr noundef nonnull @.str.1, ptr noundef %11) #6
  store i32 -227467221, ptr %swVar.ptr, align 4
  store i32 1, ptr %.reg2mem3, align 4
  br label %returnBB

13:                                               ; preds = %dispatchBB
  %14 = getelementptr inbounds ptr, ptr %1, i64 2
  %15 = load ptr, ptr %14, align 8, !tbaa !5
  %16 = tail call i64 @strtoull(ptr nocapture noundef %15, ptr noundef null, i32 noundef 16) #7
  store i64 %16, ptr %.reg2mem7, align 8
  %17 = getelementptr inbounds ptr, ptr %1, i64 1
  %18 = load ptr, ptr %17, align 8, !tbaa !5
  store ptr %18, ptr %.reg2mem10, align 8
  %.reload13 = load volatile ptr, ptr %.reg2mem10, align 8
  %19 = icmp eq ptr %.reload13, null
  %20 = select i1 %19, i32 -590374524, i32 -1669853563
  store i32 %20, ptr %swVar.ptr, align 4
  br label %returnBB

21:                                               ; preds = %dispatchBB
  %22 = load ptr, ptr @good_string, align 8, !tbaa !5
  store ptr %22, ptr %.reg2mem14, align 8
  %.reload17 = load volatile ptr, ptr %.reg2mem14, align 8
  %23 = tail call i64 @strlen(ptr noundef nonnull dereferenceable(1) %.reload17) #5
  %24 = trunc i64 %23 to i32
  %25 = add i32 %24, 1
  store i32 %25, ptr %.reg2mem18, align 4
  %.reload21 = load volatile i32, ptr %.reg2mem18, align 4
  store i32 %.reload21, ptr @size_good_string, align 4, !tbaa !9
  %26 = icmp ult i32 %24, 2147483647
  %27 = select i1 %26, i32 -2007830455, i32 1776151112
  store i32 %27, ptr %swVar.ptr, align 4
  br label %returnBB

28:                                               ; preds = %dispatchBB
  %.reload20 = load volatile i32, ptr %.reg2mem18, align 4
  %29 = sext i32 %.reload20 to i64
  store i64 %29, ptr %.reg2mem22, align 8
  %.reload19 = load volatile i32, ptr %.reg2mem18, align 4
  %30 = zext i32 %.reload19 to i64
  store i64 %30, ptr %.reg2mem24, align 8
  %.reload12 = load volatile ptr, ptr %.reg2mem10, align 8
  %31 = load i8, ptr %.reload12, align 1, !tbaa !11
  %.reload16 = load volatile ptr, ptr %.reg2mem14, align 8
  %32 = load i8, ptr %.reload16, align 1, !tbaa !11
  %33 = icmp eq i8 %31, %32
  %34 = select i1 %33, i32 -1316175358, i32 -959826747
  store i32 %34, ptr %swVar.ptr, align 4
  store i64 0, ptr %.reg2mem, align 8
  store i1 true, ptr %.reg2mem1, align 1
  br label %returnBB

35:                                               ; preds = %dispatchBB
  %.reload = load i64, ptr %.reg2mem, align 8
  %36 = add nuw nsw i64 %.reload, 1
  store i64 %36, ptr %.reg2mem26, align 8
  %.reload25 = load volatile i64, ptr %.reg2mem24, align 8
  %.reload31 = load volatile i64, ptr %.reg2mem26, align 8
  %37 = icmp eq i64 %.reload31, %.reload25
  %38 = select i1 %37, i32 1776151112, i32 -291161073
  store i32 %38, ptr %swVar.ptr, align 4
  br label %returnBB

39:                                               ; preds = %dispatchBB
  %.reload11 = load volatile ptr, ptr %.reg2mem10, align 8
  %.reload30 = load volatile i64, ptr %.reg2mem26, align 8
  %40 = getelementptr inbounds i8, ptr %.reload11, i64 %.reload30
  %41 = load i8, ptr %40, align 1, !tbaa !11
  %.reload15 = load volatile ptr, ptr %.reg2mem14, align 8
  %.reload29 = load volatile i64, ptr %.reg2mem26, align 8
  %42 = getelementptr inbounds i8, ptr %.reload15, i64 %.reload29
  %43 = load i8, ptr %42, align 1, !tbaa !11
  %44 = icmp eq i8 %41, %43
  %45 = select i1 %44, i32 -1316175358, i32 467675438
  store i32 %45, ptr %swVar.ptr, align 4
  %.reload27 = load volatile i64, ptr %.reg2mem26, align 8
  store i64 %.reload27, ptr %.reg2mem, align 8
  br label %returnBB

46:                                               ; preds = %dispatchBB
  %.reload23 = load volatile i64, ptr %.reg2mem22, align 8
  %.reload28 = load volatile i64, ptr %.reg2mem26, align 8
  %47 = icmp slt i64 %.reload28, %.reload23
  store i32 -959826747, ptr %swVar.ptr, align 4
  store i1 %47, ptr %.reg2mem1, align 1
  br label %returnBB

48:                                               ; preds = %dispatchBB
  %.reload2 = load i1, ptr %.reg2mem1, align 1
  %49 = load i64, ptr @good_value, align 8
  %.reload9 = load volatile i64, ptr %.reg2mem7, align 8
  %50 = icmp ne i64 %49, %.reload9
  %51 = select i1 %.reload2, i1 true, i1 %50
  %52 = select i1 %51, i32 -590374524, i32 451824390
  store i32 %52, ptr %swVar.ptr, align 4
  br label %returnBB

53:                                               ; preds = %dispatchBB
  %54 = load i64, ptr @good_value, align 8, !tbaa !12
  %.reload8 = load volatile i64, ptr %.reg2mem7, align 8
  %55 = icmp eq i64 %54, %.reload8
  %56 = select i1 %55, i32 451824390, i32 -590374524
  store i32 %56, ptr %swVar.ptr, align 4
  br label %returnBB

57:                                               ; preds = %dispatchBB
  %58 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.4)
  store i32 -227467221, ptr %swVar.ptr, align 4
  store i32 0, ptr %.reg2mem3, align 4
  br label %returnBB

59:                                               ; preds = %dispatchBB
  %60 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str)
  store i32 -227467221, ptr %swVar.ptr, align 4
  store i32 0, ptr %.reg2mem3, align 4
  br label %returnBB

61:                                               ; preds = %dispatchBB
  %.reload4 = load i32, ptr %.reg2mem3, align 4
  ret i32 %.reload4

returnBB:                                         ; preds = %59, %57, %53, %48, %46, %39, %35, %28, %21, %13, %9, %newBB, %swDefault
  br label %dispatchBB
}

; Function Attrs: mustprogress nofree nounwind willreturn memory(argmem: read)
declare i64 @strlen(ptr nocapture noundef) local_unnamed_addr #1

; Function Attrs: nofree nounwind
declare noundef i32 @fprintf(ptr nocapture noundef, ptr nocapture noundef readonly, ...) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nounwind willreturn
declare i64 @strtoull(ptr noundef readonly, ptr nocapture noundef, i32 noundef) local_unnamed_addr #3

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr nocapture noundef readonly) local_unnamed_addr #4

attributes #0 = { nofree nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nofree nounwind willreturn memory(argmem: read) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nofree nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress nofree nounwind willreturn "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nofree nounwind }
attributes #5 = { nounwind willreturn memory(read) }
attributes #6 = { cold }
attributes #7 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{!"Ubuntu clang version 18.1.8 (++20240731024944+3b5b5c1ec4a3-1~exp1~20240731145000.144)"}
!5 = !{!6, !6, i64 0}
!6 = !{!"any pointer", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!10, !10, i64 0}
!10 = !{!"int", !7, i64 0}
!11 = !{!7, !7, i64 0}
!12 = !{!13, !13, i64 0}
!13 = !{!"long", !7, i64 0}
