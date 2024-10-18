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
  %.reg2mem13 = alloca i32, align 4
  %.reg2mem8 = alloca ptr, align 8
  %.reg2mem5 = alloca ptr, align 8
  %3 = alloca [5 x i32], align 16
  %4 = alloca [35 x i8], align 16
  %5 = bitcast ptr %3 to ptr
  store ptr %5, ptr %.reg2mem5, align 8
  %.reload7 = load volatile ptr, ptr %.reg2mem5, align 8
  call void @llvm.lifetime.start.p0(i64 20, ptr nonnull %.reload7) #5
  %6 = bitcast ptr %3 to ptr
  store i64 8589934593, ptr %6, align 16, !tbaa !5
  %7 = getelementptr inbounds [5 x i32], ptr %3, i64 0, i64 2
  %8 = bitcast ptr %7 to ptr
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(12) %8, ptr noundef nonnull align 8 dereferenceable(12) getelementptr inbounds ([5 x i32], ptr @__const.main.array, i64 0, i64 2), i64 12, i1 false)
  %9 = getelementptr inbounds [35 x i8], ptr %4, i64 0, i64 0
  store ptr %9, ptr %.reg2mem8, align 8
  %.reload12 = load volatile ptr, ptr %.reg2mem8, align 8
  call void @llvm.lifetime.start.p0(i64 35, ptr nonnull %.reload12) #5
  %.reload11 = load volatile ptr, ptr %.reg2mem8, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(35) %.reload11, ptr noundef nonnull align 16 dereferenceable(35) @__const.main.greeting, i64 35, i1 false)
  %.reload10 = load volatile ptr, ptr %.reg2mem8, align 8
  %10 = call i32 @puts(ptr nonnull %.reload10)
  %swVar.ptr = alloca i32, align 4
  store i32 231407501, ptr %swVar.ptr, align 4
  %.reg2mem = alloca i64, align 8
  store i64 0, ptr %.reg2mem, align 8
  %.reg2mem1 = alloca i32, align 4
  store i32 0, ptr %.reg2mem1, align 4
  %.reg2mem3 = alloca i64, align 8
  br label %dispatchBB

dispatchBB:                                       ; preds = %2, %returnBB
  %swVar = load i32, ptr %swVar.ptr, align 4
  switch i32 %swVar, label %swDefault [
    i32 231407501, label %11
    i32 -688077145, label %14
    i32 1903167544, label %21
    i32 2109242566, label %23
    i32 -813953611, label %25
    i32 172270500, label %26
    i32 988360850, label %34
  ]

swDefault:                                        ; preds = %dispatchBB
  br label %returnBB

11:                                               ; preds = %dispatchBB
  %.reload16 = load volatile i32, ptr %.reg2mem13, align 4
  %12 = icmp eq i32 %.reload16, 0
  %13 = select i1 %12, i32 2109242566, i32 1903167544
  store i32 %13, ptr %swVar.ptr, align 4
  br label %returnBB

14:                                               ; preds = %dispatchBB
  %.reload2 = load i32, ptr %.reg2mem1, align 4
  %.reload = load i64, ptr %.reg2mem, align 8
  %15 = getelementptr inbounds [5 x i32], ptr %3, i64 0, i64 %.reload
  %16 = load i32, ptr %15, align 4, !tbaa !5
  %17 = add nsw i32 %16, %.reload2
  store i32 %17, ptr %.reg2mem13, align 4
  %18 = add nuw nsw i64 %.reload, 1
  %19 = icmp eq i64 %18, 5
  %20 = select i1 %19, i32 231407501, i32 -688077145
  store i32 %20, ptr %swVar.ptr, align 4
  store i64 %18, ptr %.reg2mem, align 8
  %.reload14 = load volatile i32, ptr %.reg2mem13, align 4
  store i32 %.reload14, ptr %.reg2mem1, align 4
  br label %returnBB

21:                                               ; preds = %dispatchBB
  %.reload15 = load volatile i32, ptr %.reg2mem13, align 4
  %22 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, i32 noundef %.reload15)
  store i32 -813953611, ptr %swVar.ptr, align 4
  br label %returnBB

23:                                               ; preds = %dispatchBB
  %24 = call i32 @puts(ptr nonnull dereferenceable(1) @str)
  store i32 -813953611, ptr %swVar.ptr, align 4
  br label %returnBB

25:                                               ; preds = %dispatchBB
  store i32 172270500, ptr %swVar.ptr, align 4
  store i64 0, ptr %.reg2mem3, align 8
  br label %returnBB

26:                                               ; preds = %dispatchBB
  %.reload4 = load i64, ptr %.reg2mem3, align 8
  %27 = getelementptr inbounds [5 x i32], ptr @__const.main.array, i64 0, i64 %.reload4
  %28 = load i32, ptr %27, align 4, !tbaa !5
  %29 = trunc i64 %.reload4 to i32
  %30 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.3, i32 noundef %29, i32 noundef %28)
  %31 = add nuw nsw i64 %.reload4, 1
  %32 = icmp eq i64 %31, 5
  %33 = select i1 %32, i32 988360850, i32 172270500
  store i32 %33, ptr %swVar.ptr, align 4
  store i64 %31, ptr %.reg2mem3, align 8
  br label %returnBB

34:                                               ; preds = %dispatchBB
  %.reload9 = load volatile ptr, ptr %.reg2mem8, align 8
  call void @llvm.lifetime.end.p0(i64 35, ptr nonnull %.reload9) #5
  %.reload6 = load volatile ptr, ptr %.reg2mem5, align 8
  call void @llvm.lifetime.end.p0(i64 20, ptr nonnull %.reload6) #5
  ret i32 0

returnBB:                                         ; preds = %26, %25, %23, %21, %14, %11, %swDefault
  br label %dispatchBB
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
