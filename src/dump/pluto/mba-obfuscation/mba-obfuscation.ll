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
@x = private global i32 -1976399462
@y = private global i32 1321303015
@x.1 = private global i32 1546466561
@y.2 = private global i32 -60717535

; Function Attrs: nofree nounwind uwtable
define dso_local noundef i32 @main(i32 noundef %0, ptr nocapture noundef readonly %1) local_unnamed_addr #0 {
  %3 = load ptr, ptr @good_string, align 8, !tbaa !5
  %4 = tail call i64 @strlen(ptr noundef nonnull dereferenceable(1) %3) #5
  %5 = trunc i64 %4 to i32
  %6 = mul i32 1, %5
  %7 = add i32 0, %6
  %8 = add i32 %7, 1
  %9 = mul i32 -1007998215, %8
  %10 = add i32 %9, -315316193
  %11 = mul i32 1735358281, %10
  %12 = add i32 %11, -2090555863
  %13 = add i32 %5, 1
  store i32 %12, ptr @size_good_string, align 4, !tbaa !9
  %14 = load i32, ptr @x, align 4
  %15 = load i32, ptr @y, align 4
  %16 = xor i32 %15, -1
  %17 = and i32 %14, %16
  %18 = mul i32 1, %17
  %19 = add i32 0, %18
  %20 = xor i32 %14, -1
  %21 = or i32 %20, %15
  %22 = mul i32 1, %21
  %23 = add i32 %19, %22
  %24 = add i32 %23, 4
  %25 = mul i32 1344408147, %24
  %26 = add i32 %25, -995065532
  %27 = mul i32 -2023568933, %26
  %28 = add i32 %27, -814020908
  %29 = icmp eq i32 %0, %28
  br i1 %29, label %34, label %30

30:                                               ; preds = %2
  %31 = load ptr, ptr @stderr, align 8, !tbaa !5
  %32 = load ptr, ptr %1, align 8, !tbaa !5
  %33 = tail call i32 (ptr, ptr, ...) @fprintf(ptr noundef %31, ptr noundef nonnull @.str.1, ptr noundef %32) #6
  br label %121

34:                                               ; preds = %2
  %35 = getelementptr inbounds ptr, ptr %1, i64 2
  %36 = load ptr, ptr %35, align 8, !tbaa !5
  %37 = tail call i64 @strtoull(ptr nocapture noundef %36, ptr noundef null, i32 noundef 16) #7
  %38 = getelementptr inbounds ptr, ptr %1, i64 1
  %39 = load ptr, ptr %38, align 8, !tbaa !5
  %40 = icmp eq ptr %39, null
  br i1 %40, label %119, label %41

41:                                               ; preds = %34
  %42 = load ptr, ptr @good_string, align 8, !tbaa !5
  %43 = tail call i64 @strlen(ptr noundef nonnull dereferenceable(1) %42) #5
  %44 = trunc i64 %43 to i32
  %45 = and i32 %44, 1
  %46 = mul i32 -1, %45
  %47 = add i32 0, %46
  %48 = mul i32 1, %44
  %49 = add i32 %47, %48
  %50 = xor i32 %44, -1
  %51 = and i32 %50, 1
  %52 = mul i32 1, %51
  %53 = add i32 %49, %52
  %54 = add i32 %53, 1
  %55 = xor i32 %44, 1
  %56 = mul i32 -1, %55
  %57 = add i32 %54, %56
  %58 = xor i32 %44, -1
  %59 = mul i32 -1, %58
  %60 = add i32 %57, %59
  %61 = add i32 %60, -1
  %62 = mul i32 -848524741, %61
  %63 = add i32 %62, -2044723399
  %64 = mul i32 -2095857933, %63
  %65 = add i32 %64, -738627867
  %66 = add i32 %44, 1
  store i32 %65, ptr @size_good_string, align 4, !tbaa !9
  %67 = load i32, ptr @x.1, align 4
  %68 = load i32, ptr @y.2, align 4
  %69 = xor i32 %68, -1
  %70 = and i32 %67, %69
  %71 = mul i32 1, %70
  %72 = add i32 0, %71
  %73 = mul i32 -1, %67
  %74 = add i32 %72, %73
  %75 = xor i32 %68, -1
  %76 = mul i32 -1, %75
  %77 = add i32 %74, %76
  %78 = xor i32 %68, -1
  %79 = or i32 %67, %78
  %80 = mul i32 1, %79
  %81 = add i32 %77, %80
  %82 = add i32 %81, 2147483647
  %83 = mul i32 -1726008305, %82
  %84 = add i32 %83, 1646595206
  %85 = mul i32 -977454353, %84
  %86 = add i32 %85, -1650134298
  %87 = icmp ult i32 %44, %86
  br i1 %87, label %88, label %114

88:                                               ; preds = %41
  %89 = sext i32 %65 to i64
  %90 = zext i32 %65 to i64
  %91 = load i8, ptr %39, align 1, !tbaa !11
  %92 = load i8, ptr %42, align 1, !tbaa !11
  %93 = icmp eq i8 %91, %92
  br i1 %93, label %94, label %109

94:                                               ; preds = %101, %88
  %95 = phi i64 [ %98, %101 ], [ 0, %88 ]
  %96 = mul i64 1, %95
  %97 = add i64 0, %96
  %98 = add i64 %97, 1
  %99 = add nuw nsw i64 %95, 1
  %100 = icmp eq i64 %98, %90
  br i1 %100, label %114, label %101, !llvm.loop !12

101:                                              ; preds = %94
  %102 = getelementptr inbounds i8, ptr %39, i64 %98
  %103 = load i8, ptr %102, align 1, !tbaa !11
  %104 = getelementptr inbounds i8, ptr %42, i64 %98
  %105 = load i8, ptr %104, align 1, !tbaa !11
  %106 = icmp eq i8 %103, %105
  br i1 %106, label %94, label %107, !llvm.loop !12

107:                                              ; preds = %101
  %108 = icmp slt i64 %98, %89
  br label %109

109:                                              ; preds = %107, %88
  %110 = phi i1 [ true, %88 ], [ %108, %107 ]
  %111 = load i64, ptr @good_value, align 8
  %112 = icmp ne i64 %111, %37
  %113 = select i1 %110, i1 true, i1 %112
  br i1 %113, label %119, label %117

114:                                              ; preds = %94, %41
  %115 = load i64, ptr @good_value, align 8, !tbaa !15
  %116 = icmp eq i64 %115, %37
  br i1 %116, label %117, label %119

117:                                              ; preds = %114, %109
  %118 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.4)
  br label %121

119:                                              ; preds = %114, %109, %34
  %120 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str)
  br label %121

121:                                              ; preds = %119, %117, %30
  %122 = phi i32 [ 1, %30 ], [ 0, %119 ], [ 0, %117 ]
  ret i32 %122
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
