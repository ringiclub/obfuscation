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
@x.31 = common global i32 0
@y.32 = common global i32 0
@x.33 = common global i32 0
@y.34 = common global i32 0
@x.35 = common global i32 0
@y.36 = common global i32 0
@x.37 = common global i32 0
@y.38 = common global i32 0
@x.39 = common global i32 0
@y.40 = common global i32 0
@x.41 = common global i32 0
@y.42 = common global i32 0
@x.43 = common global i32 0
@y.44 = common global i32 0
@x.45 = common global i32 0
@y.46 = common global i32 0
@x.47 = common global i32 0
@y.48 = common global i32 0
@x.49 = common global i32 0
@y.50 = common global i32 0

; Function Attrs: nofree nounwind uwtable
define dso_local noundef i32 @main(i32 noundef %0, ptr nocapture noundef readonly %1) local_unnamed_addr #0 {
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
  %11 = load ptr, ptr @good_string, align 8, !tbaa !5
  %12 = tail call i64 @strlen(ptr noundef nonnull dereferenceable(1) %11) #5
  %13 = trunc i64 %12 to i32
  %14 = add i32 %13, 1
  store i32 %14, ptr @size_good_string, align 4, !tbaa !9
  %15 = icmp eq i32 %0, 3
  %16 = load i32, ptr @x.1, align 4
  %17 = load i32, ptr @y.2, align 4
  %18 = icmp slt i32 %17, 10
  %19 = add i32 %16, 1
  %20 = mul i32 %19, %16
  %21 = urem i32 %20, 2
  %22 = icmp eq i32 %21, 0
  %23 = or i1 %18, %22
  br i1 %23, label %endBB, label %bodyBBcloneBB

endBB:                                            ; preds = %bodyBB
  br i1 %15, label %44, label %24

24:                                               ; preds = %endBB
  %25 = load i32, ptr @x.3, align 4
  %26 = load i32, ptr @y.4, align 4
  %27 = icmp slt i32 %26, 10
  %28 = add i32 %25, 1
  %29 = mul i32 %28, %25
  %30 = urem i32 %29, 2
  %31 = icmp eq i32 %30, 0
  %32 = or i1 %27, %31
  br i1 %32, label %bodyBB1, label %bodyBB1cloneBB

bodyBB1:                                          ; preds = %bodyBB1cloneBB, %24
  %33 = load ptr, ptr @stderr, align 8, !tbaa !5
  %34 = load ptr, ptr %1, align 8, !tbaa !5
  %35 = tail call i32 (ptr, ptr, ...) @fprintf(ptr noundef %33, ptr noundef nonnull @.str.1, ptr noundef %34) #6
  %36 = load i32, ptr @x.5, align 4
  %37 = load i32, ptr @y.6, align 4
  %38 = icmp slt i32 %37, 10
  %39 = add i32 %36, 1
  %40 = mul i32 %39, %36
  %41 = urem i32 %40, 2
  %42 = icmp eq i32 %41, 0
  %43 = or i1 %38, %42
  br i1 %43, label %endBB2, label %bodyBB1cloneBB

endBB2:                                           ; preds = %bodyBB1
  br label %247

44:                                               ; preds = %endBB
  %45 = load i32, ptr @x.7, align 4
  %46 = load i32, ptr @y.8, align 4
  %47 = icmp slt i32 %46, 10
  %48 = add i32 %45, 1
  %49 = mul i32 %48, %45
  %50 = urem i32 %49, 2
  %51 = icmp eq i32 %50, 0
  %52 = or i1 %47, %51
  br i1 %52, label %bodyBB3, label %bodyBB3cloneBB

bodyBB3:                                          ; preds = %bodyBB3cloneBB, %44
  %53 = getelementptr inbounds ptr, ptr %1, i64 2
  %54 = load ptr, ptr %53, align 8, !tbaa !5
  %55 = tail call i64 @strtoull(ptr nocapture noundef %54, ptr noundef null, i32 noundef 16) #7
  %56 = getelementptr inbounds ptr, ptr %1, i64 1
  %57 = load ptr, ptr %56, align 8, !tbaa !5
  %58 = icmp eq ptr %57, null
  %59 = load i32, ptr @x.9, align 4
  %60 = load i32, ptr @y.10, align 4
  %61 = icmp slt i32 %60, 10
  %62 = add i32 %59, 1
  %63 = mul i32 %62, %59
  %64 = urem i32 %63, 2
  %65 = icmp eq i32 %64, 0
  %66 = or i1 %61, %65
  br i1 %66, label %endBB4, label %bodyBB3cloneBB

endBB4:                                           ; preds = %bodyBB3
  br i1 %58, label %229, label %67

67:                                               ; preds = %endBB4
  %68 = load i32, ptr @x.11, align 4
  %69 = load i32, ptr @y.12, align 4
  %70 = icmp slt i32 %69, 10
  %71 = add i32 %68, 1
  %72 = mul i32 %71, %68
  %73 = urem i32 %72, 2
  %74 = icmp eq i32 %73, 0
  %75 = or i1 %70, %74
  br i1 %75, label %bodyBB5, label %bodyBB5cloneBB

bodyBB5:                                          ; preds = %bodyBB5cloneBB, %67
  %76 = load ptr, ptr @good_string, align 8, !tbaa !5
  %77 = tail call i64 @strlen(ptr noundef nonnull dereferenceable(1) %76) #5
  %78 = trunc i64 %77 to i32
  %79 = add i32 %78, 1
  store i32 %79, ptr @size_good_string, align 4, !tbaa !9
  %80 = icmp ult i32 %78, 2147483647
  %81 = load i32, ptr @x.13, align 4
  %82 = load i32, ptr @y.14, align 4
  %83 = icmp slt i32 %82, 10
  %84 = add i32 %81, 1
  %85 = mul i32 %84, %81
  %86 = urem i32 %85, 2
  %87 = icmp eq i32 %86, 0
  %88 = or i1 %83, %87
  br i1 %88, label %endBB6, label %bodyBB5cloneBB

endBB6:                                           ; preds = %bodyBB5
  br i1 %80, label %89, label %192

89:                                               ; preds = %endBB6
  %90 = load i32, ptr @x.15, align 4
  %91 = load i32, ptr @y.16, align 4
  %92 = icmp slt i32 %91, 10
  %93 = add i32 %90, 1
  %94 = mul i32 %93, %90
  %95 = urem i32 %94, 2
  %96 = icmp eq i32 %95, 0
  %97 = or i1 %92, %96
  br i1 %97, label %bodyBB7, label %bodyBB7cloneBB

bodyBB7:                                          ; preds = %bodyBB7cloneBB, %89
  %98 = sext i32 %79 to i64
  %99 = zext i32 %79 to i64
  %100 = load i8, ptr %57, align 1, !tbaa !11
  %101 = load i8, ptr %76, align 1, !tbaa !11
  %102 = icmp eq i8 %100, %101
  %103 = load i32, ptr @x.17, align 4
  %104 = load i32, ptr @y.18, align 4
  %105 = icmp slt i32 %104, 10
  %106 = add i32 %103, 1
  %107 = mul i32 %106, %103
  %108 = urem i32 %107, 2
  %109 = icmp eq i32 %108, 0
  %110 = or i1 %105, %109
  br i1 %110, label %endBB8, label %bodyBB7cloneBB

endBB8:                                           ; preds = %bodyBB7
  br i1 %102, label %111, label %171

111:                                              ; preds = %endBB12, %endBB8
  %112 = phi i64 [ %121, %endBB12 ], [ 0, %endBB8 ]
  %113 = load i32, ptr @x.19, align 4
  %114 = load i32, ptr @y.20, align 4
  %115 = icmp slt i32 %114, 10
  %116 = add i32 %113, 1
  %117 = mul i32 %116, %113
  %118 = urem i32 %117, 2
  %119 = icmp eq i32 %118, 0
  %120 = or i1 %115, %119
  br i1 %120, label %bodyBB9, label %bodyBB9cloneBB

bodyBB9:                                          ; preds = %bodyBB9cloneBB, %111
  %121 = add nuw nsw i64 %112, 1
  %122 = icmp eq i64 %121, %99
  %123 = load i32, ptr @x.21, align 4
  %124 = load i32, ptr @y.22, align 4
  %125 = icmp slt i32 %124, 10
  %126 = add i32 %123, 1
  %127 = mul i32 %126, %123
  %128 = urem i32 %127, 2
  %129 = icmp eq i32 %128, 0
  %130 = or i1 %125, %129
  br i1 %130, label %endBB10, label %bodyBB9cloneBB

endBB10:                                          ; preds = %bodyBB9
  br i1 %122, label %192, label %131, !llvm.loop !12

131:                                              ; preds = %endBB10
  %132 = load i32, ptr @x.23, align 4
  %133 = load i32, ptr @y.24, align 4
  %134 = icmp slt i32 %133, 10
  %135 = add i32 %132, 1
  %136 = mul i32 %135, %132
  %137 = urem i32 %136, 2
  %138 = icmp eq i32 %137, 0
  %139 = or i1 %134, %138
  br i1 %139, label %bodyBB11, label %bodyBB11cloneBB

bodyBB11:                                         ; preds = %bodyBB11cloneBB, %131
  %140 = getelementptr inbounds i8, ptr %57, i64 %121
  %141 = load i8, ptr %140, align 1, !tbaa !11
  %142 = getelementptr inbounds i8, ptr %76, i64 %121
  %143 = load i8, ptr %142, align 1, !tbaa !11
  %144 = icmp eq i8 %141, %143
  %145 = load i32, ptr @x.25, align 4
  %146 = load i32, ptr @y.26, align 4
  %147 = icmp slt i32 %146, 10
  %148 = add i32 %145, 1
  %149 = mul i32 %148, %145
  %150 = urem i32 %149, 2
  %151 = icmp eq i32 %150, 0
  %152 = or i1 %147, %151
  br i1 %152, label %endBB12, label %bodyBB11cloneBB

endBB12:                                          ; preds = %bodyBB11
  br i1 %144, label %111, label %153, !llvm.loop !12

153:                                              ; preds = %endBB12
  %154 = load i32, ptr @x.27, align 4
  %155 = load i32, ptr @y.28, align 4
  %156 = icmp slt i32 %155, 10
  %157 = add i32 %154, 1
  %158 = mul i32 %157, %154
  %159 = urem i32 %158, 2
  %160 = icmp eq i32 %159, 0
  %161 = or i1 %156, %160
  br i1 %161, label %bodyBB13, label %bodyBB13cloneBB

bodyBB13:                                         ; preds = %bodyBB13cloneBB, %153
  %162 = icmp slt i64 %121, %98
  %163 = load i32, ptr @x.29, align 4
  %164 = load i32, ptr @y.30, align 4
  %165 = icmp slt i32 %164, 10
  %166 = add i32 %163, 1
  %167 = mul i32 %166, %163
  %168 = urem i32 %167, 2
  %169 = icmp eq i32 %168, 0
  %170 = or i1 %165, %169
  br i1 %170, label %endBB14, label %bodyBB13cloneBB

endBB14:                                          ; preds = %bodyBB13
  br label %171

171:                                              ; preds = %endBB14, %endBB8
  %172 = phi i1 [ true, %endBB8 ], [ %162, %endBB14 ]
  %173 = load i32, ptr @x.31, align 4
  %174 = load i32, ptr @y.32, align 4
  %175 = icmp slt i32 %174, 10
  %176 = add i32 %173, 1
  %177 = mul i32 %176, %173
  %178 = urem i32 %177, 2
  %179 = icmp eq i32 %178, 0
  %180 = or i1 %175, %179
  br i1 %180, label %bodyBB15, label %bodyBB15cloneBB

bodyBB15:                                         ; preds = %bodyBB15cloneBB, %171
  %181 = load i64, ptr @good_value, align 8
  %182 = icmp ne i64 %181, %55
  %183 = select i1 %172, i1 true, i1 %182
  %184 = load i32, ptr @x.33, align 4
  %185 = load i32, ptr @y.34, align 4
  %186 = icmp slt i32 %185, 10
  %187 = add i32 %184, 1
  %188 = mul i32 %187, %184
  %189 = urem i32 %188, 2
  %190 = icmp eq i32 %189, 0
  %191 = or i1 %186, %190
  br i1 %191, label %endBB16, label %bodyBB15cloneBB

endBB16:                                          ; preds = %bodyBB15
  br i1 %183, label %229, label %211

192:                                              ; preds = %endBB10, %endBB6
  %193 = load i32, ptr @x.35, align 4
  %194 = load i32, ptr @y.36, align 4
  %195 = icmp slt i32 %194, 10
  %196 = add i32 %193, 1
  %197 = mul i32 %196, %193
  %198 = urem i32 %197, 2
  %199 = icmp eq i32 %198, 0
  %200 = or i1 %195, %199
  br i1 %200, label %bodyBB17, label %bodyBB17cloneBB

bodyBB17:                                         ; preds = %bodyBB17cloneBB, %192
  %201 = load i64, ptr @good_value, align 8, !tbaa !15
  %202 = icmp eq i64 %201, %55
  %203 = load i32, ptr @x.37, align 4
  %204 = load i32, ptr @y.38, align 4
  %205 = icmp slt i32 %204, 10
  %206 = add i32 %203, 1
  %207 = mul i32 %206, %203
  %208 = urem i32 %207, 2
  %209 = icmp eq i32 %208, 0
  %210 = or i1 %205, %209
  br i1 %210, label %endBB18, label %bodyBB17cloneBB

endBB18:                                          ; preds = %bodyBB17
  br i1 %202, label %211, label %229

211:                                              ; preds = %endBB18, %endBB16
  %212 = load i32, ptr @x.39, align 4
  %213 = load i32, ptr @y.40, align 4
  %214 = icmp slt i32 %213, 10
  %215 = add i32 %212, 1
  %216 = mul i32 %215, %212
  %217 = urem i32 %216, 2
  %218 = icmp eq i32 %217, 0
  %219 = or i1 %214, %218
  br i1 %219, label %bodyBB19, label %bodyBB19cloneBB

bodyBB19:                                         ; preds = %bodyBB19cloneBB, %211
  %220 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.4)
  %221 = load i32, ptr @x.41, align 4
  %222 = load i32, ptr @y.42, align 4
  %223 = icmp slt i32 %222, 10
  %224 = add i32 %221, 1
  %225 = mul i32 %224, %221
  %226 = urem i32 %225, 2
  %227 = icmp eq i32 %226, 0
  %228 = or i1 %223, %227
  br i1 %228, label %endBB20, label %bodyBB19cloneBB

endBB20:                                          ; preds = %bodyBB19
  br label %247

229:                                              ; preds = %endBB18, %endBB16, %endBB4
  %230 = load i32, ptr @x.43, align 4
  %231 = load i32, ptr @y.44, align 4
  %232 = icmp slt i32 %231, 10
  %233 = add i32 %230, 1
  %234 = mul i32 %233, %230
  %235 = urem i32 %234, 2
  %236 = icmp eq i32 %235, 0
  %237 = or i1 %232, %236
  br i1 %237, label %bodyBB21, label %bodyBB21cloneBB

bodyBB21:                                         ; preds = %bodyBB21cloneBB, %229
  %238 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str)
  %239 = load i32, ptr @x.45, align 4
  %240 = load i32, ptr @y.46, align 4
  %241 = icmp slt i32 %240, 10
  %242 = add i32 %239, 1
  %243 = mul i32 %242, %239
  %244 = urem i32 %243, 2
  %245 = icmp eq i32 %244, 0
  %246 = or i1 %241, %245
  br i1 %246, label %endBB22, label %bodyBB21cloneBB

endBB22:                                          ; preds = %bodyBB21
  br label %247

247:                                              ; preds = %endBB22, %endBB20, %endBB2
  %248 = phi i32 [ 1, %endBB2 ], [ 0, %endBB22 ], [ 0, %endBB20 ]
  %249 = load i32, ptr @x.47, align 4
  %250 = load i32, ptr @y.48, align 4
  %251 = icmp slt i32 %250, 10
  %252 = add i32 %249, 1
  %253 = mul i32 %252, %249
  %254 = urem i32 %253, 2
  %255 = icmp eq i32 %254, 0
  %256 = or i1 %251, %255
  br i1 %256, label %bodyBB23, label %bodyBB23cloneBB

bodyBB23:                                         ; preds = %bodyBB23cloneBB, %247
  %257 = load i32, ptr @x.49, align 4
  %258 = load i32, ptr @y.50, align 4
  %259 = icmp slt i32 %258, 10
  %260 = add i32 %257, 1
  %261 = mul i32 %260, %257
  %262 = urem i32 %261, 2
  %263 = icmp eq i32 %262, 0
  %264 = or i1 %259, %263
  br i1 %264, label %endBB24, label %bodyBB23cloneBB

endBB24:                                          ; preds = %bodyBB23
  ret i32 %248

bodyBBcloneBB:                                    ; preds = %bodyBB, %2
  %265 = load ptr, ptr @good_string, align 8, !tbaa !5
  %266 = tail call i64 @strlen(ptr noundef nonnull dereferenceable(1) %265) #5
  %267 = trunc i64 %266 to i32
  %268 = add i32 %267, 1
  store i32 %268, ptr @size_good_string, align 4, !tbaa !9
  %269 = icmp eq i32 %0, 3
  br label %bodyBB

bodyBB1cloneBB:                                   ; preds = %bodyBB1, %24
  %270 = load ptr, ptr @stderr, align 8, !tbaa !5
  %271 = load ptr, ptr %1, align 8, !tbaa !5
  %272 = tail call i32 (ptr, ptr, ...) @fprintf(ptr noundef %270, ptr noundef nonnull @.str.1, ptr noundef %271) #6
  br label %bodyBB1

bodyBB3cloneBB:                                   ; preds = %bodyBB3, %44
  %273 = getelementptr inbounds ptr, ptr %1, i64 2
  %274 = load ptr, ptr %273, align 8, !tbaa !5
  %275 = tail call i64 @strtoull(ptr nocapture noundef %274, ptr noundef null, i32 noundef 16) #7
  %276 = getelementptr inbounds ptr, ptr %1, i64 1
  %277 = load ptr, ptr %276, align 8, !tbaa !5
  %278 = icmp eq ptr %277, null
  br label %bodyBB3

bodyBB5cloneBB:                                   ; preds = %bodyBB5, %67
  %279 = load ptr, ptr @good_string, align 8, !tbaa !5
  %280 = tail call i64 @strlen(ptr noundef nonnull dereferenceable(1) %279) #5
  %281 = trunc i64 %280 to i32
  %282 = add i32 %281, 1
  store i32 %282, ptr @size_good_string, align 4, !tbaa !9
  %283 = icmp ult i32 %281, 2147483647
  br label %bodyBB5

bodyBB7cloneBB:                                   ; preds = %bodyBB7, %89
  %284 = sext i32 %79 to i64
  %285 = zext i32 %79 to i64
  %286 = load i8, ptr %57, align 1, !tbaa !11
  %287 = load i8, ptr %76, align 1, !tbaa !11
  %288 = icmp eq i8 %286, %287
  br label %bodyBB7

bodyBB9cloneBB:                                   ; preds = %bodyBB9, %111
  %289 = add nuw nsw i64 %112, 1
  %290 = icmp eq i64 %289, %99
  br label %bodyBB9

bodyBB11cloneBB:                                  ; preds = %bodyBB11, %131
  %291 = getelementptr inbounds i8, ptr %57, i64 %121
  %292 = load i8, ptr %291, align 1, !tbaa !11
  %293 = getelementptr inbounds i8, ptr %76, i64 %121
  %294 = load i8, ptr %293, align 1, !tbaa !11
  %295 = icmp eq i8 %292, %294
  br label %bodyBB11

bodyBB13cloneBB:                                  ; preds = %bodyBB13, %153
  %296 = icmp slt i64 %121, %98
  br label %bodyBB13

bodyBB15cloneBB:                                  ; preds = %bodyBB15, %171
  %297 = load i64, ptr @good_value, align 8
  %298 = icmp ne i64 %297, %55
  %299 = select i1 %172, i1 true, i1 %298
  br label %bodyBB15

bodyBB17cloneBB:                                  ; preds = %bodyBB17, %192
  %300 = load i64, ptr @good_value, align 8, !tbaa !15
  %301 = icmp eq i64 %300, %55
  br label %bodyBB17

bodyBB19cloneBB:                                  ; preds = %bodyBB19, %211
  %302 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.4)
  br label %bodyBB19

bodyBB21cloneBB:                                  ; preds = %bodyBB21, %229
  %303 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str)
  br label %bodyBB21

bodyBB23cloneBB:                                  ; preds = %bodyBB23, %247
  br label %bodyBB23
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
