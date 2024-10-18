; ModuleID = 'src/demo-v1.c'
source_filename = "src/demo-v1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@__const.main.array = private unnamed_addr constant [5 x i32] [i32 1, i32 2, i32 3, i32 4, i32 5], align 16
@__const.main.greeting = private unnamed_addr constant [35 x i8] c"Calculating sum of array elements!\00", align 16
@.str.1 = private unnamed_addr constant [29 x i8] c"Sum of array elements is %d\0A\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Element %d: %d\0A\00", align 1
@str = private unnamed_addr constant [12 x i8] c"Sum is zero\00", align 1

; Function Attrs: nofree nounwind uwtable
define dso_local i32 @main(i32 noundef %0, i8** nocapture noundef readnone %1) local_unnamed_addr #0 {
  %3 = alloca [5 x i32], align 16
  %4 = alloca [35 x i8], align 16
  %5 = bitcast [5 x i32]* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 20, i8* nonnull %5) #5
  %6 = bitcast [5 x i32]* %3 to i64*
  store i64 8589934593, i64* %6, align 16, !tbaa !5
  %7 = getelementptr inbounds [5 x i32], [5 x i32]* %3, i64 0, i64 2
  %8 = bitcast i32* %7 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(12) %8, i8* noundef nonnull align 8 dereferenceable(12) bitcast (i32* getelementptr inbounds ([5 x i32], [5 x i32]* @__const.main.array, i64 0, i64 2) to i8*), i64 12, i1 false)
  %9 = getelementptr inbounds [35 x i8], [35 x i8]* %4, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 35, i8* nonnull %9) #5
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(35) %9, i8* noundef nonnull align 16 dereferenceable(35) getelementptr inbounds ([35 x i8], [35 x i8]* @__const.main.greeting, i64 0, i64 0), i64 35, i1 false)
  %10 = call i32 @puts(i8* nonnull %9)
  br label %13

11:                                               ; preds = %13
  %12 = icmp eq i32 %18, 0
  br i1 %12, label %23, label %21

13:                                               ; preds = %2, %13
  %14 = phi i64 [ 0, %2 ], [ %19, %13 ]
  %15 = phi i32 [ 0, %2 ], [ %18, %13 ]
  %16 = getelementptr inbounds [5 x i32], [5 x i32]* %3, i64 0, i64 %14
  %17 = load i32, i32* %16, align 4, !tbaa !5
  %18 = add nsw i32 %17, %15
  %19 = add nuw nsw i64 %14, 1
  %20 = icmp eq i64 %19, 5
  br i1 %20, label %11, label %13, !llvm.loop !9

21:                                               ; preds = %11
  %22 = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([29 x i8], [29 x i8]* @.str.1, i64 0, i64 0), i32 noundef %18)
  br label %25

23:                                               ; preds = %11
  %24 = call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([12 x i8], [12 x i8]* @str, i64 0, i64 0))
  br label %25

25:                                               ; preds = %23, %21
  br label %26

26:                                               ; preds = %25, %26
  %27 = phi i64 [ %32, %26 ], [ 0, %25 ]
  %28 = getelementptr inbounds [5 x i32], [5 x i32]* @__const.main.array, i64 0, i64 %27
  %29 = load i32, i32* %28, align 4, !tbaa !5
  %30 = trunc i64 %27 to i32
  %31 = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0), i32 noundef %30, i32 noundef %29)
  %32 = add nuw nsw i64 %27, 1
  %33 = icmp eq i64 %32, 5
  br i1 %33, label %34, label %26, !llvm.loop !12

34:                                               ; preds = %26
  call void @llvm.lifetime.end.p0i8(i64 35, i8* nonnull %9) #5
  call void @llvm.lifetime.end.p0i8(i64 20, i8* nonnull %5) #5
  ret i32 0
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nofree nounwind
declare noundef i32 @printf(i8* nocapture noundef readonly, ...) local_unnamed_addr #3

; Function Attrs: nofree nounwind
declare noundef i32 @puts(i8* nocapture noundef readonly) local_unnamed_addr #4

attributes #0 = { nofree nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { argmemonly mustprogress nofree nounwind willreturn }
attributes #3 = { nofree nounwind "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nofree nounwind }
attributes #5 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
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
