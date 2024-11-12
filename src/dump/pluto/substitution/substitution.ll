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
  %3 = load ptr, ptr @good_string, align 8, !tbaa !5
  %4 = tail call i64 @strlen(ptr noundef nonnull dereferenceable(1) %3) #5
  %5 = trunc i64 %4 to i32
  %6 = sub i32 0, %5
  %7 = add i32 %6, -1
  %8 = sub i32 0, %7
  %9 = add i32 %5, 1
  store i32 %8, ptr @size_good_string, align 4, !tbaa !9
  %10 = icmp eq i32 %0, 3
  br i1 %10, label %15, label %11

11:                                               ; preds = %2
  %12 = load ptr, ptr @stderr, align 8, !tbaa !5
  %13 = load ptr, ptr %1, align 8, !tbaa !5
  %14 = tail call i32 (ptr, ptr, ...) @fprintf(ptr noundef %12, ptr noundef nonnull @.str.1, ptr noundef %13) #6
  br label %62

15:                                               ; preds = %2
  %16 = getelementptr inbounds ptr, ptr %1, i64 2
  %17 = load ptr, ptr %16, align 8, !tbaa !5
  %18 = tail call i64 @strtoull(ptr nocapture noundef %17, ptr noundef null, i32 noundef 16) #7
  %19 = getelementptr inbounds ptr, ptr %1, i64 1
  %20 = load ptr, ptr %19, align 8, !tbaa !5
  %21 = icmp eq ptr %20, null
  br i1 %21, label %60, label %22

22:                                               ; preds = %15
  %23 = load ptr, ptr @good_string, align 8, !tbaa !5
  %24 = tail call i64 @strlen(ptr noundef nonnull dereferenceable(1) %23) #5
  %25 = trunc i64 %24 to i32
  %26 = sub i32 %25, -1
  %27 = add i32 %25, 1
  store i32 %26, ptr @size_good_string, align 4, !tbaa !9
  %28 = icmp ult i32 %25, 2147483647
  br i1 %28, label %29, label %55

29:                                               ; preds = %22
  %30 = sext i32 %26 to i64
  %31 = zext i32 %26 to i64
  %32 = load i8, ptr %20, align 1, !tbaa !11
  %33 = load i8, ptr %23, align 1, !tbaa !11
  %34 = icmp eq i8 %32, %33
  br i1 %34, label %35, label %50

35:                                               ; preds = %42, %29
  %36 = phi i64 [ %39, %42 ], [ 0, %29 ]
  %37 = sub i64 %36, 2961860195
  %38 = add i64 %37, 1
  %39 = add i64 %38, 2961860195
  %40 = add nuw nsw i64 %36, 1
  %41 = icmp eq i64 %39, %31
  br i1 %41, label %55, label %42, !llvm.loop !12

42:                                               ; preds = %35
  %43 = getelementptr inbounds i8, ptr %20, i64 %39
  %44 = load i8, ptr %43, align 1, !tbaa !11
  %45 = getelementptr inbounds i8, ptr %23, i64 %39
  %46 = load i8, ptr %45, align 1, !tbaa !11
  %47 = icmp eq i8 %44, %46
  br i1 %47, label %35, label %48, !llvm.loop !12

48:                                               ; preds = %42
  %49 = icmp slt i64 %39, %30
  br label %50

50:                                               ; preds = %48, %29
  %51 = phi i1 [ true, %29 ], [ %49, %48 ]
  %52 = load i64, ptr @good_value, align 8
  %53 = icmp ne i64 %52, %18
  %54 = select i1 %51, i1 true, i1 %53
  br i1 %54, label %60, label %58

55:                                               ; preds = %35, %22
  %56 = load i64, ptr @good_value, align 8, !tbaa !15
  %57 = icmp eq i64 %56, %18
  br i1 %57, label %58, label %60

58:                                               ; preds = %55, %50
  %59 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.4)
  br label %62

60:                                               ; preds = %55, %50, %15
  %61 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str)
  br label %62

62:                                               ; preds = %60, %58, %11
  %63 = phi i32 [ 1, %11 ], [ 0, %60 ], [ 0, %58 ]
  ret i32 %63
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
