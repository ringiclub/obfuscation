; ModuleID = 'src/ollvm/demo-v1/demo-v1.ll'
source_filename = "src/demo-v1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@__const.main.array = private unnamed_addr constant [5 x i32] [i32 1, i32 2, i32 3, i32 4, i32 5], align 16
@__const.main.greeting = private unnamed_addr constant [35 x i8] c"Calculating sum of array elements!\00", align 16
@.str.1 = private unnamed_addr constant [29 x i8] c"Sum of array elements is %d\0A\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Element %d: %d\0A\00", align 1
@str = private unnamed_addr constant [12 x i8] c"Sum is zero\00", align 1
@x = private global i64 -5383885935588106119
@y = private global i64 -4778465268747436891
@x.1 = private global i32 1452792356
@y.2 = private global i32 1698166590
@x.3 = private global i64 144379154818350516
@y.4 = private global i64 3527787638980088628
@x.5 = private global i64 5534198664754134267
@y.6 = private global i64 -7547318014992565146

; Function Attrs: nofree nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr nocapture noundef readnone %1) local_unnamed_addr #0 {
  %3 = alloca [5 x i32], align 16
  %4 = alloca [35 x i8], align 16
  %5 = bitcast ptr %3 to ptr
  call void @llvm.lifetime.start.p0(i64 20, ptr nonnull %5) #5
  %6 = bitcast ptr %3 to ptr
  %7 = load i64, ptr @x, align 8
  %8 = load i64, ptr @y, align 8
  store i64 8589934593, ptr %6, align 16, !tbaa !5
  %9 = getelementptr inbounds [5 x i32], ptr %3, i64 0, i64 2
  %10 = bitcast ptr %9 to ptr
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(12) %10, ptr noundef nonnull align 8 dereferenceable(12) getelementptr inbounds ([5 x i32], ptr @__const.main.array, i64 0, i64 2), i64 12, i1 false)
  %11 = getelementptr inbounds [35 x i8], ptr %4, i64 0, i64 0
  call void @llvm.lifetime.start.p0(i64 35, ptr nonnull %11) #5
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(35) %11, ptr noundef nonnull align 16 dereferenceable(35) @__const.main.greeting, i64 35, i1 false)
  %12 = call i32 @puts(ptr nonnull %11)
  br label %33

13:                                               ; preds = %33
  %14 = load i32, ptr @x.1, align 4
  %15 = load i32, ptr @y.2, align 4
  %16 = xor i32 %15, -1
  %17 = and i32 %14, %16
  %18 = mul i32 1, %17
  %19 = add i32 0, %18
  %20 = mul i32 -1, %14
  %21 = add i32 %19, %20
  %22 = xor i32 %14, -1
  %23 = and i32 %22, %15
  %24 = mul i32 -1, %23
  %25 = add i32 %21, %24
  %26 = mul i32 1, %15
  %27 = add i32 %25, %26
  %28 = mul i32 1827511929, %27
  %29 = add i32 %28, 575732913
  %30 = mul i32 1967287241, %29
  %31 = add i32 %30, 707370503
  %32 = icmp eq i32 %45, %31
  br i1 %32, label %66, label %64

33:                                               ; preds = %33, %2
  %34 = phi i64 [ 0, %2 ], [ %49, %33 ]
  %35 = phi i32 [ 0, %2 ], [ %45, %33 ]
  %36 = getelementptr inbounds [5 x i32], ptr %3, i64 0, i64 %34
  %37 = load i32, ptr %36, align 4, !tbaa !5
  %38 = mul i32 1, %37
  %39 = add i32 0, %38
  %40 = mul i32 1, %35
  %41 = add i32 %39, %40
  %42 = mul i32 862892485, %41
  %43 = add i32 %42, -1768899427
  %44 = mul i32 -1385585395, %43
  %45 = add i32 %44, -1682949369
  %46 = add nsw i32 %37, %35
  %47 = mul i64 1, %34
  %48 = add i64 0, %47
  %49 = add i64 %48, 1
  %50 = add nuw nsw i64 %34, 1
  %51 = load i64, ptr @x.3, align 8
  %52 = load i64, ptr @y.4, align 8
  %53 = mul i64 1, %51
  %54 = add i64 0, %53
  %55 = xor i64 %51, -1
  %56 = and i64 %55, %52
  %57 = mul i64 1, %56
  %58 = add i64 %54, %57
  %59 = or i64 %51, %52
  %60 = mul i64 -1, %59
  %61 = add i64 %58, %60
  %62 = add i64 %61, 5
  %63 = icmp eq i64 %49, %62
  br i1 %63, label %13, label %33, !llvm.loop !9

64:                                               ; preds = %13
  %65 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, i32 noundef %45)
  br label %68

66:                                               ; preds = %13
  %67 = call i32 @puts(ptr nonnull dereferenceable(1) @str)
  br label %68

68:                                               ; preds = %66, %64
  br label %69

69:                                               ; preds = %69, %68
  %70 = phi i64 [ %79, %69 ], [ 0, %68 ]
  %71 = getelementptr inbounds [5 x i32], ptr @__const.main.array, i64 0, i64 %70
  %72 = load i32, ptr %71, align 4, !tbaa !5
  %73 = trunc i64 %70 to i32
  %74 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.3, i32 noundef %73, i32 noundef %72)
  %75 = mul i64 1, %70
  %76 = add i64 0, %75
  %77 = add i64 %76, -1
  %78 = add i64 %77, 4
  %79 = add i64 %78, -2
  %80 = add nuw nsw i64 %70, 1
  %81 = load i64, ptr @x.5, align 8
  %82 = load i64, ptr @y.6, align 8
  %83 = and i64 %81, %82
  %84 = mul i64 4, %83
  %85 = add i64 0, %84
  %86 = mul i64 -2, %82
  %87 = add i64 %85, %86
  %88 = xor i64 %81, %82
  %89 = xor i64 %88, -1
  %90 = mul i64 -2, %89
  %91 = add i64 %87, %90
  %92 = xor i64 %81, -1
  %93 = mul i64 2, %92
  %94 = add i64 %91, %93
  %95 = add i64 %94, 5
  %96 = icmp eq i64 %79, %95
  br i1 %96, label %97, label %69, !llvm.loop !12

97:                                               ; preds = %69
  call void @llvm.lifetime.end.p0(i64 35, ptr nonnull %11) #5
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
