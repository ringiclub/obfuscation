; ModuleID = 'src/ollvm/demo-v1/demo-v1.ll'
source_filename = "src/demo-v1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@__const.main.array = private unnamed_addr constant [5 x i32] [i32 1, i32 2, i32 3, i32 4, i32 5], align 16
@__const.main.greeting = private unnamed_addr constant [35 x i8] c"Calculating sum of array elements!\00", align 16
@.str.1 = private unnamed_addr constant [29 x i8] c"Sum of array elements is %d\0A\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Element %d: %d\0A\00", align 1
@str = private unnamed_addr constant [12 x i8] c"Sum is zero\00", align 1

; Function Attrs: nofree nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr nocapture noundef readnone %1) local_unnamed_addr #0 {
  %3 = alloca [5 x i32], align 16
  %4 = alloca [35 x i8], align 16
  %5 = bitcast ptr %3 to ptr
  call void @llvm.lifetime.start.p0(i64 20, ptr nonnull %5) #5
  %6 = bitcast ptr %3 to ptr
  store i64 8589934593, ptr %6, align 16, !tbaa !5
  %7 = getelementptr inbounds [5 x i32], ptr %3, i64 0, i64 2
  %8 = bitcast ptr %7 to ptr
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(12) %8, ptr noundef nonnull align 8 dereferenceable(12) getelementptr inbounds ([5 x i32], ptr @__const.main.array, i64 0, i64 2), i64 12, i1 false)
  %9 = getelementptr inbounds [35 x i8], ptr %4, i64 0, i64 0
  call void @llvm.lifetime.start.p0(i64 35, ptr nonnull %9) #5
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(35) %9, ptr noundef nonnull align 16 dereferenceable(35) @__const.main.greeting, i64 35, i1 false)
  %10 = call i32 @puts(ptr nonnull %9)
  br label %13

11:                                               ; preds = %13
  %12 = icmp eq i32 %21, 0
  br i1 %12, label %30, label %28

13:                                               ; preds = %13, %2
  %14 = phi i64 [ 0, %2 ], [ %25, %13 ]
  %15 = phi i32 [ 0, %2 ], [ %21, %13 ]
  %16 = getelementptr inbounds [5 x i32], ptr %3, i64 0, i64 %14
  %17 = load i32, ptr %16, align 4, !tbaa !5
  %18 = sub i32 0, %17
  %19 = sub i32 0, %15
  %20 = add i32 %18, %19
  %21 = sub i32 0, %20
  %22 = add nsw i32 %17, %15
  %23 = sub i64 0, %14
  %24 = add i64 %23, -1
  %25 = sub i64 0, %24
  %26 = add nuw nsw i64 %14, 1
  %27 = icmp eq i64 %25, 5
  br i1 %27, label %11, label %13, !llvm.loop !9

28:                                               ; preds = %11
  %29 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, i32 noundef %21)
  br label %32

30:                                               ; preds = %11
  %31 = call i32 @puts(ptr nonnull dereferenceable(1) @str)
  br label %32

32:                                               ; preds = %30, %28
  br label %33

33:                                               ; preds = %33, %32
  %34 = phi i64 [ %41, %33 ], [ 0, %32 ]
  %35 = getelementptr inbounds [5 x i32], ptr @__const.main.array, i64 0, i64 %34
  %36 = load i32, ptr %35, align 4, !tbaa !5
  %37 = trunc i64 %34 to i32
  %38 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.3, i32 noundef %37, i32 noundef %36)
  %39 = sub i64 0, %34
  %40 = add i64 %39, -1
  %41 = sub i64 0, %40
  %42 = add nuw nsw i64 %34, 1
  %43 = icmp eq i64 %41, 5
  br i1 %43, label %44, label %33, !llvm.loop !12

44:                                               ; preds = %33
  call void @llvm.lifetime.end.p0(i64 35, ptr nonnull %9) #5
  call void @llvm.lifetime.end.p0(i64 20, ptr nonnull %5) #5
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr nocapture noundef readonly, ...) local_unnamed_addr #1

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr nocapture noundef readonly) local_unnamed_addr #2

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #3

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #3

attributes #0 = { nofree nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nounwind "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nofree nounwind }
attributes #3 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #4 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #5 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = distinct !{!9, !10, !11}
!10 = !{!"llvm.loop.mustprogress"}
!11 = !{!"llvm.loop.unroll.disable"}
!12 = distinct !{!12, !10, !11}
