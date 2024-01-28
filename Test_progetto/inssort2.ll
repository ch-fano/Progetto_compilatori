declare double @randinit(double)

declare double @randk()

declare double @timek()

declare double @printval(double, double)

@A = common global [10 x double] zeroinitializer
define double @inssort() {
entry:
  %j = alloca double, align 8
  %pivot = alloca double, align 8
  %i = alloca double, align 8
  store double 1.000000e+00, ptr %i, align 8
  %i1 = load double, ptr %i, align 8
  %lttest = fcmp ult double %i1, 1.000000e+01
  br i1 %lttest, label %forbody, label %endcond31

forbody:                                          ; preds = %forcond26, %entry
  %i2 = load double, ptr %i, align 8
  %0 = fptrunc double %i2 to float
  %1 = fptosi float %0 to i32
  %2 = getelementptr inbounds ptr, ptr @A, i32 %1
  %A = load double, ptr %2, align 8
  store double %A, ptr %pivot, align 8
  %i3 = load double, ptr %i, align 8
  %subres = fsub double %i3, 1.000000e+00
  store double %subres, ptr %j, align 8
  %j4 = load double, ptr %j, align 8
  %lttest5 = fcmp ult double -1.000000e+00, %j4
  %pivot6 = load double, ptr %pivot, align 8
  %j7 = load double, ptr %j, align 8
  %3 = fptrunc double %j7 to float
  %4 = fptosi float %3 to i32
  %5 = getelementptr inbounds ptr, ptr @A, i32 %4
  %A8 = load double, ptr %5, align 8
  %lttest9 = fcmp ult double %pivot6, %A8
  %andtest = and i1 %lttest5, %lttest9
  br i1 %andtest, label %forbody10, label %endcond

forbody10:                                        ; preds = %forcond, %forbody
  %j11 = load double, ptr %j, align 8
  %6 = fptrunc double %j11 to float
  %7 = fptosi float %6 to i32
  %8 = getelementptr inbounds ptr, ptr @A, i32 %7
  %A12 = load double, ptr %8, align 8
  %j13 = load double, ptr %j, align 8
  %addres = fadd double %j13, 1.000000e+00
  %9 = fptrunc double %addres to float
  %10 = fptosi float %9 to i32
  %11 = getelementptr inbounds ptr, ptr @A, i32 %10
  store double %A12, ptr %11, align 8
  br label %forcond

forcond:                                          ; preds = %forbody10
  %j14 = load double, ptr %j, align 8
  %subres15 = fsub double %j14, 1.000000e+00
  store double %subres15, ptr %j, align 8
  %j16 = load double, ptr %j, align 8
  %lttest17 = fcmp ult double -1.000000e+00, %j16
  %pivot18 = load double, ptr %pivot, align 8
  %j19 = load double, ptr %j, align 8
  %12 = fptrunc double %j19 to float
  %13 = fptosi float %12 to i32
  %14 = getelementptr inbounds ptr, ptr @A, i32 %13
  %A20 = load double, ptr %14, align 8
  %lttest21 = fcmp ult double %pivot18, %A20
  %andtest22 = and i1 %lttest17, %lttest21
  br i1 %andtest22, label %forbody10, label %endcond

endcond:                                          ; preds = %forcond, %forbody
  %condval = phi double [ %A12, %forcond ], [ 1.000000e+00, %forbody ]
  %pivot23 = load double, ptr %pivot, align 8
  %j24 = load double, ptr %j, align 8
  %addres25 = fadd double %j24, 1.000000e+00
  %15 = fptrunc double %addres25 to float
  %16 = fptosi float %15 to i32
  %17 = getelementptr inbounds ptr, ptr @A, i32 %16
  store double %pivot23, ptr %17, align 8
  br label %forcond26

forcond26:                                        ; preds = %endcond
  %i27 = load double, ptr %i, align 8
  %addres28 = fadd double %i27, 1.000000e+00
  store double %addres28, ptr %i, align 8
  %i29 = load double, ptr %i, align 8
  %lttest30 = fcmp ult double %i29, 1.000000e+01
  br i1 %lttest30, label %forbody, label %endcond31

endcond31:                                        ; preds = %forcond26, %entry
  %condval32 = phi double [ %pivot23, %forcond26 ], [ 1.000000e+00, %entry ]
  ret double %condval32
}

define double @main() {
entry:
  %i13 = alloca double, align 8
  %i = alloca double, align 8
  %seed = alloca double, align 8
  %calltmp = call double @timek()
  store double %calltmp, ptr %seed, align 8
  %seed1 = load double, ptr %seed, align 8
  %calltmp2 = call double @randinit(double %seed1)
  store double 0.000000e+00, ptr %i, align 8
  %i3 = load double, ptr %i, align 8
  %lttest = fcmp ult double %i3, 1.000000e+01
  br i1 %lttest, label %forbody, label %endcond

forbody:                                          ; preds = %forcond, %entry
  %calltmp4 = call double @randk()
  %i5 = load double, ptr %i, align 8
  %0 = fptrunc double %i5 to float
  %1 = fptosi float %0 to i32
  %2 = getelementptr inbounds ptr, ptr @A, i32 %1
  store double %calltmp4, ptr %2, align 8
  %i6 = load double, ptr %i, align 8
  %3 = fptrunc double %i6 to float
  %4 = fptosi float %3 to i32
  %5 = getelementptr inbounds ptr, ptr @A, i32 %4
  %A = load double, ptr %5, align 8
  %calltmp7 = call double @printval(double %A, double 0.000000e+00)
  br label %forcond

forcond:                                          ; preds = %forbody
  %i8 = load double, ptr %i, align 8
  %addres = fadd double %i8, 1.000000e+00
  store double %addres, ptr %i, align 8
  %i9 = load double, ptr %i, align 8
  %lttest10 = fcmp ult double %i9, 1.000000e+01
  br i1 %lttest10, label %forbody, label %endcond

endcond:                                          ; preds = %forcond, %entry
  %condval = phi double [ %calltmp7, %forcond ], [ 1.000000e+00, %entry ]
  %calltmp11 = call double @printval(double 0.000000e+00, double 1.000000e+00)
  %calltmp12 = call double @inssort()
  store double 0.000000e+00, ptr %i13, align 8
  %i14 = load double, ptr %i13, align 8
  %lttest15 = fcmp ult double %i14, 1.000000e+01
  br i1 %lttest15, label %forbody16, label %endcond25

forbody16:                                        ; preds = %forcond20, %endcond
  %i17 = load double, ptr %i13, align 8
  %6 = fptrunc double %i17 to float
  %7 = fptosi float %6 to i32
  %8 = getelementptr inbounds ptr, ptr @A, i32 %7
  %A18 = load double, ptr %8, align 8
  %calltmp19 = call double @printval(double %A18, double 0.000000e+00)
  br label %forcond20

forcond20:                                        ; preds = %forbody16
  %i21 = load double, ptr %i13, align 8
  %addres22 = fadd double %i21, 1.000000e+00
  store double %addres22, ptr %i13, align 8
  %i23 = load double, ptr %i13, align 8
  %lttest24 = fcmp ult double %i23, 1.000000e+01
  br i1 %lttest24, label %forbody16, label %endcond25

endcond25:                                        ; preds = %forcond20, %endcond
  %condval26 = phi double [ %calltmp19, %forcond20 ], [ 1.000000e+00, %endcond ]
  ret double %condval26
}

