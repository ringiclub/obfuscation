; ModuleID = 'src/ollvm/demo-v1/demo-v1.ll'
source_filename = "src/demo-v1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@__const.main.array = private unnamed_addr constant [5 x i32] [i32 1, i32 2, i32 3, i32 4, i32 5], align 16
@__const.main.greeting = private unnamed_addr constant [35 x i8] c"Calculating sum of array elements!\00", align 16
@.str.1 = private unnamed_addr constant [29 x i8] c"Sum of array elements is %d\0A\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Element %d: %d\0A\00", align 1
@str = private unnamed_addr constant [12 x i8] c"Sum is zero\00", align 1
@x = common global i32 0
@y = common global i32 0
@x.1 = common global i32 0
@y.2 = common global i32 0
@x.3 = common global i32 0
@y.4 = common global i32 0
@x.5 = common global i32 0
@y.6 = common global i32 0
@x.7 = common global i32 0
@y.8 = common global i32 0
@x.9 = common global i32 0
@y.10 = common global i32 0
@x.11 = common global i32 0
@y.12 = common global i32 0
@x.13 = common global i32 0
@y.14 = common global i32 0
@x.15 = common global i32 0
@y.16 = common global i32 0
@x.17 = common global i32 0
@y.18 = common global i32 0
@x.19 = common global i32 0
@y.20 = common global i32 0
@x.21 = common global i32 0
@y.22 = common global i32 0
@x.23 = common global i32 0
@y.24 = common global i32 0
@x.25 = common global i32 0
@y.26 = common global i32 0
@x.27 = common global i32 0
@y.28 = common global i32 0
@x.29 = common global i32 0
@y.30 = common global i32 0

; Function Attrs: nofree nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr nocapture noundef readnone %1) local_unnamed_addr #0 {
  %3 = load i32, ptr @x, align 4
  %4 = load i32, ptr @y, align 4
  %5 = icmp slt i32 %4, 10
  %6 = add i32 %3, 1
  %7 = mul i32 %6, %3
  %8 = urem i32 %7, 2
  %9 = icmp eq i32 %8, 0
  %10 = or i1 %5, %9
  br i1 %10, label %bodyBB, label %bodyBBcloneBB

bodyBB:                                           ; preds = %bodyBBcloneBB, %2
  %11 = alloca [5 x i32], align 16
  %12 = alloca [35 x i8], align 16
  %13 = bitcast ptr %11 to ptr
  call void @llvm.lifetime.start.p0(i64 20, ptr nonnull %13) #5
  %14 = bitcast ptr %11 to ptr
  store i64 8589934593, ptr %14, align 16, !tbaa !5
  %15 = getelementptr inbounds [5 x i32], ptr %11, i64 0, i64 2
  %16 = bitcast ptr %15 to ptr
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(12) %16, ptr noundef nonnull align 8 dereferenceable(12) getelementptr inbounds ([5 x i32], ptr @__const.main.array, i64 0, i64 2), i64 12, i1 false)
  %17 = getelementptr inbounds [35 x i8], ptr %12, i64 0, i64 0
  call void @llvm.lifetime.start.p0(i64 35, ptr nonnull %17) #5
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(35) %17, ptr noundef nonnull align 16 dereferenceable(35) @__const.main.greeting, i64 35, i1 false)
  %18 = call i32 @puts(ptr nonnull %17)
  %19 = load i32, ptr @x.1, align 4
  %20 = load i32, ptr @y.2, align 4
  %21 = icmp slt i32 %20, 10
  %22 = add i32 %19, 1
  %23 = mul i32 %22, %19
  %24 = urem i32 %23, 2
  %25 = icmp eq i32 %24, 0
  %26 = or i1 %21, %25
  br i1 %26, label %endBB, label %bodyBBcloneBB

endBB:                                            ; preds = %bodyBB
  br label %45

27:                                               ; preds = %endBB4
  %28 = load i32, ptr @x.3, align 4
  %29 = load i32, ptr @y.4, align 4
  %30 = icmp slt i32 %29, 10
  %31 = add i32 %28, 1
  %32 = mul i32 %31, %28
  %33 = urem i32 %32, 2
  %34 = icmp eq i32 %33, 0
  %35 = or i1 %30, %34
  br i1 %35, label %bodyBB1, label %bodyBB1cloneBB

bodyBB1:                                          ; preds = %bodyBB1cloneBB, %27
  %36 = icmp eq i32 %58, 0
  %37 = load i32, ptr @x.5, align 4
  %38 = load i32, ptr @y.6, align 4
  %39 = icmp slt i32 %38, 10
  %40 = add i32 %37, 1
  %41 = mul i32 %40, %37
  %42 = urem i32 %41, 2
  %43 = icmp eq i32 %42, 0
  %44 = or i1 %39, %43
  br i1 %44, label %endBB2, label %bodyBB1cloneBB

endBB2:                                           ; preds = %bodyBB1
  br i1 %36, label %87, label %69

45:                                               ; preds = %endBB4, %endBB
  %46 = phi i64 [ 0, %endBB ], [ %59, %endBB4 ]
  %47 = phi i32 [ 0, %endBB ], [ %58, %endBB4 ]
  %48 = load i32, ptr @x.7, align 4
  %49 = load i32, ptr @y.8, align 4
  %50 = icmp slt i32 %49, 10
  %51 = add i32 %48, 1
  %52 = mul i32 %51, %48
  %53 = urem i32 %52, 2
  %54 = icmp eq i32 %53, 0
  %55 = or i1 %50, %54
  br i1 %55, label %bodyBB3, label %bodyBB3cloneBB

bodyBB3:                                          ; preds = %bodyBB3cloneBB, %45
  %56 = getelementptr inbounds [5 x i32], ptr %11, i64 0, i64 %46
  %57 = load i32, ptr %56, align 4, !tbaa !5
  %58 = add nsw i32 %57, %47
  %59 = add nuw nsw i64 %46, 1
  %60 = icmp eq i64 %59, 5
  %61 = load i32, ptr @x.9, align 4
  %62 = load i32, ptr @y.10, align 4
  %63 = icmp slt i32 %62, 10
  %64 = add i32 %61, 1
  %65 = mul i32 %64, %61
  %66 = urem i32 %65, 2
  %67 = icmp eq i32 %66, 0
  %68 = or i1 %63, %67
  br i1 %68, label %endBB4, label %bodyBB3cloneBB

endBB4:                                           ; preds = %bodyBB3
  br i1 %60, label %27, label %45, !llvm.loop !9

69:                                               ; preds = %endBB2
  %70 = load i32, ptr @x.11, align 4
  %71 = load i32, ptr @y.12, align 4
  %72 = icmp slt i32 %71, 10
  %73 = add i32 %70, 1
  %74 = mul i32 %73, %70
  %75 = urem i32 %74, 2
  %76 = icmp eq i32 %75, 0
  %77 = or i1 %72, %76
  br i1 %77, label %bodyBB5, label %bodyBB5cloneBB

bodyBB5:                                          ; preds = %bodyBB5cloneBB, %69
  %78 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, i32 noundef %58)
  %79 = load i32, ptr @x.13, align 4
  %80 = load i32, ptr @y.14, align 4
  %81 = icmp slt i32 %80, 10
  %82 = add i32 %79, 1
  %83 = mul i32 %82, %79
  %84 = urem i32 %83, 2
  %85 = icmp eq i32 %84, 0
  %86 = or i1 %81, %85
  br i1 %86, label %endBB6, label %bodyBB5cloneBB

endBB6:                                           ; preds = %bodyBB5
  br label %105

87:                                               ; preds = %endBB2
  %88 = load i32, ptr @x.15, align 4
  %89 = load i32, ptr @y.16, align 4
  %90 = icmp slt i32 %89, 10
  %91 = add i32 %88, 1
  %92 = mul i32 %91, %88
  %93 = urem i32 %92, 2
  %94 = icmp eq i32 %93, 0
  %95 = or i1 %90, %94
  br i1 %95, label %bodyBB7, label %bodyBB7cloneBB

bodyBB7:                                          ; preds = %bodyBB7cloneBB, %87
  %96 = call i32 @puts(ptr nonnull dereferenceable(1) @str)
  %97 = load i32, ptr @x.17, align 4
  %98 = load i32, ptr @y.18, align 4
  %99 = icmp slt i32 %98, 10
  %100 = add i32 %97, 1
  %101 = mul i32 %100, %97
  %102 = urem i32 %101, 2
  %103 = icmp eq i32 %102, 0
  %104 = or i1 %99, %103
  br i1 %104, label %endBB8, label %bodyBB7cloneBB

endBB8:                                           ; preds = %bodyBB7
  br label %105

105:                                              ; preds = %endBB8, %endBB6
  %106 = load i32, ptr @x.19, align 4
  %107 = load i32, ptr @y.20, align 4
  %108 = icmp slt i32 %107, 10
  %109 = add i32 %106, 1
  %110 = mul i32 %109, %106
  %111 = urem i32 %110, 2
  %112 = icmp eq i32 %111, 0
  %113 = or i1 %108, %112
  br i1 %113, label %bodyBB9, label %bodyBB9cloneBB

bodyBB9:                                          ; preds = %bodyBB9cloneBB, %105
  %114 = load i32, ptr @x.21, align 4
  %115 = load i32, ptr @y.22, align 4
  %116 = icmp slt i32 %115, 10
  %117 = add i32 %114, 1
  %118 = mul i32 %117, %114
  %119 = urem i32 %118, 2
  %120 = icmp eq i32 %119, 0
  %121 = or i1 %116, %120
  br i1 %121, label %endBB10, label %bodyBB9cloneBB

endBB10:                                          ; preds = %bodyBB9
  br label %122

122:                                              ; preds = %endBB12, %endBB10
  %123 = phi i64 [ %136, %endBB12 ], [ 0, %endBB10 ]
  %124 = load i32, ptr @x.23, align 4
  %125 = load i32, ptr @y.24, align 4
  %126 = icmp slt i32 %125, 10
  %127 = add i32 %124, 1
  %128 = mul i32 %127, %124
  %129 = urem i32 %128, 2
  %130 = icmp eq i32 %129, 0
  %131 = or i1 %126, %130
  br i1 %131, label %bodyBB11, label %bodyBB11cloneBB

bodyBB11:                                         ; preds = %bodyBB11cloneBB, %122
  %132 = getelementptr inbounds [5 x i32], ptr @__const.main.array, i64 0, i64 %123
  %133 = load i32, ptr %132, align 4, !tbaa !5
  %134 = trunc i64 %123 to i32
  %135 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.3, i32 noundef %134, i32 noundef %133)
  %136 = add nuw nsw i64 %123, 1
  %137 = icmp eq i64 %136, 5
  %138 = load i32, ptr @x.25, align 4
  %139 = load i32, ptr @y.26, align 4
  %140 = icmp slt i32 %139, 10
  %141 = add i32 %138, 1
  %142 = mul i32 %141, %138
  %143 = urem i32 %142, 2
  %144 = icmp eq i32 %143, 0
  %145 = or i1 %140, %144
  br i1 %145, label %endBB12, label %bodyBB11cloneBB

endBB12:                                          ; preds = %bodyBB11
  br i1 %137, label %146, label %122, !llvm.loop !12

146:                                              ; preds = %endBB12
  call void @llvm.lifetime.end.p0(i64 35, ptr nonnull %17) #5
  call void @llvm.lifetime.end.p0(i64 20, ptr nonnull %13) #5
  %147 = load i32, ptr @x.27, align 4
  %148 = load i32, ptr @y.28, align 4
  %149 = icmp slt i32 %148, 10
  %150 = add i32 %147, 1
  %151 = mul i32 %150, %147
  %152 = urem i32 %151, 2
  %153 = icmp eq i32 %152, 0
  %154 = or i1 %149, %153
  br i1 %154, label %bodyBB13, label %bodyBB13cloneBB

bodyBB13:                                         ; preds = %bodyBB13cloneBB, %146
  %155 = load i32, ptr @x.29, align 4
  %156 = load i32, ptr @y.30, align 4
  %157 = icmp slt i32 %156, 10
  %158 = add i32 %155, 1
  %159 = mul i32 %158, %155
  %160 = urem i32 %159, 2
  %161 = icmp eq i32 %160, 0
  %162 = or i1 %157, %161
  br i1 %162, label %endBB14, label %bodyBB13cloneBB

endBB14:                                          ; preds = %bodyBB13
  ret i32 0

bodyBBcloneBB:                                    ; preds = %bodyBB, %2
  %163 = alloca [5 x i32], align 16
  %164 = alloca [35 x i8], align 16
  %165 = bitcast ptr %163 to ptr
  call void @llvm.lifetime.start.p0(i64 20, ptr nonnull %165) #5
  %166 = bitcast ptr %163 to ptr
  store i64 8589934593, ptr %166, align 16, !tbaa !5
  %167 = getelementptr inbounds [5 x i32], ptr %163, i64 0, i64 2
  %168 = bitcast ptr %167 to ptr
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(12) %168, ptr noundef nonnull align 8 dereferenceable(12) getelementptr inbounds ([5 x i32], ptr @__const.main.array, i64 0, i64 2), i64 12, i1 false)
  %169 = getelementptr inbounds [35 x i8], ptr %164, i64 0, i64 0
  call void @llvm.lifetime.start.p0(i64 35, ptr nonnull %169) #5
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(35) %169, ptr noundef nonnull align 16 dereferenceable(35) @__const.main.greeting, i64 35, i1 false)
  %170 = call i32 @puts(ptr nonnull %169)
  br label %bodyBB

bodyBB1cloneBB:                                   ; preds = %bodyBB1, %27
  %171 = icmp eq i32 %58, 0
  br label %bodyBB1

bodyBB3cloneBB:                                   ; preds = %bodyBB3, %45
  %172 = getelementptr inbounds [5 x i32], ptr %11, i64 0, i64 %46
  %173 = load i32, ptr %172, align 4, !tbaa !5
  %174 = add nsw i32 %173, %47
  %175 = add nuw nsw i64 %46, 1
  %176 = icmp eq i64 %175, 5
  br label %bodyBB3

bodyBB5cloneBB:                                   ; preds = %bodyBB5, %69
  %177 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, i32 noundef %58)
  br label %bodyBB5

bodyBB7cloneBB:                                   ; preds = %bodyBB7, %87
  %178 = call i32 @puts(ptr nonnull dereferenceable(1) @str)
  br label %bodyBB7

bodyBB9cloneBB:                                   ; preds = %bodyBB9, %105
  br label %bodyBB9

bodyBB11cloneBB:                                  ; preds = %bodyBB11, %122
  %179 = getelementptr inbounds [5 x i32], ptr @__const.main.array, i64 0, i64 %123
  %180 = load i32, ptr %179, align 4, !tbaa !5
  %181 = trunc i64 %123 to i32
  %182 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.3, i32 noundef %181, i32 noundef %180)
  %183 = add nuw nsw i64 %123, 1
  %184 = icmp eq i64 %183, 5
  br label %bodyBB11

bodyBB13cloneBB:                                  ; preds = %bodyBB13, %146
  br label %bodyBB13
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
