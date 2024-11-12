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
@0 = private global [0 x ptr] zeroinitializer

; Function Attrs: nofree nounwind uwtable
define dso_local noundef i32 @main(i32 noundef %0, ptr nocapture noundef readonly %1) local_unnamed_addr #0 {
  %3 = load ptr, ptr @good_string, align 8, !tbaa !5
  %4 = tail call i64 @strlen(ptr noundef nonnull dereferenceable(1) %3) #5
  %5 = trunc i64 %4 to i32
  %6 = add i32 %5, 1
  store i32 %6, ptr @size_good_string, align 4, !tbaa !9
  %7 = icmp eq i32 %0, 3
  br i1 %7, label %12, label %8

8:                                                ; preds = %2
  %9 = load ptr, ptr @stderr, align 8, !tbaa !5
  %10 = load ptr, ptr %1, align 8, !tbaa !5
  %11 = tail call i32 (ptr, ptr, ...) @fprintf(ptr noundef %9, ptr noundef nonnull @.str.1, ptr noundef %10) #6
  br label %55

12:                                               ; preds = %2
  %13 = getelementptr inbounds ptr, ptr %1, i64 2
  %14 = load ptr, ptr %13, align 8, !tbaa !5
  %15 = tail call i64 @strtoull(ptr nocapture noundef %14, ptr noundef null, i32 noundef 16) #7
  %16 = getelementptr inbounds ptr, ptr %1, i64 1
  %17 = load ptr, ptr %16, align 8, !tbaa !5
  %18 = icmp eq ptr %17, null
  br i1 %18, label %53, label %19

19:                                               ; preds = %12
  %20 = load ptr, ptr @good_string, align 8, !tbaa !5
  %21 = tail call i64 @strlen(ptr noundef nonnull dereferenceable(1) %20) #5
  %22 = trunc i64 %21 to i32
  %23 = add i32 %22, 1
  store i32 %23, ptr @size_good_string, align 4, !tbaa !9
  %24 = icmp ult i32 %22, 2147483647
  br i1 %24, label %25, label %48

25:                                               ; preds = %19
  %26 = sext i32 %23 to i64
  %27 = zext i32 %23 to i64
  %28 = load i8, ptr %17, align 1, !tbaa !11
  %29 = load i8, ptr %20, align 1, !tbaa !11
  %30 = icmp eq i8 %28, %29
  br i1 %30, label %31, label %43

31:                                               ; preds = %35, %25
  %32 = phi i64 [ %33, %35 ], [ 0, %25 ]
  %33 = add nuw nsw i64 %32, 1
  %34 = icmp eq i64 %33, %27
  br i1 %34, label %48, label %35, !llvm.loop !12

35:                                               ; preds = %31
  %36 = getelementptr inbounds i8, ptr %17, i64 %33
  %37 = load i8, ptr %36, align 1, !tbaa !11
  %38 = getelementptr inbounds i8, ptr %20, i64 %33
  %39 = load i8, ptr %38, align 1, !tbaa !11
  %40 = icmp eq i8 %37, %39
  br i1 %40, label %31, label %41, !llvm.loop !12

41:                                               ; preds = %35
  %42 = icmp slt i64 %33, %26
  br label %43

43:                                               ; preds = %41, %25
  %44 = phi i1 [ true, %25 ], [ %42, %41 ]
  %45 = load i64, ptr @good_value, align 8
  %46 = icmp ne i64 %45, %15
  %47 = select i1 %44, i1 true, i1 %46
  br i1 %47, label %53, label %51

48:                                               ; preds = %31, %19
  %49 = load i64, ptr @good_value, align 8, !tbaa !15
  %50 = icmp eq i64 %49, %15
  br i1 %50, label %51, label %53

51:                                               ; preds = %48, %43
  %52 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.4)
  br label %55

53:                                               ; preds = %48, %43, %12
  %54 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str)
  br label %55

55:                                               ; preds = %53, %51, %8
  %56 = phi i32 [ 1, %8 ], [ 0, %53 ], [ 0, %51 ]
  ret i32 %56
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
!12 = distinct !{!12, !13, !14}
!13 = !{!"llvm.loop.mustprogress"}
!14 = !{!"llvm.loop.unroll.disable"}
!15 = !{!16, !16, i64 0}
!16 = !{!"long", !7, i64 0}
