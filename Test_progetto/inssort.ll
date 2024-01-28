declare double @randinit(double)

declare double @randk()

declare double @timek()

declare double @printval(double, double)

@A = common global [10 x double] zeroinitializer
define double @inssort() {
entry:
  %j = alloca double, align 8
  %step = alloca double, align 8
  %pivot = alloca double, align 8
  %i = alloca double, align 8
  store double 1.000000e+00, ptr %i, align 8
  %i1 = load double, ptr %i, align 8
  %lttest = fcmp ult double %i1, 1.000000e+01
  br i1 %lttest, label %forbody, label %endcond35

forbody:                                          ; preds = %forcond30, %entry
  %i2 = load double, ptr %i, align 8
  %0 = fptrunc double %i2 to float
  %1 = fptosi float %0 to i32
  %2 = getelementptr inbounds ptr, ptr @A, i32 %1
  %A = load double, ptr %2, align 8
  store double %A, ptr %pivot, align 8
  store double 1.000000e+00, ptr %step, align 8
  %i3 = load double, ptr %i, align 8
  %subres = fsub double %i3, 1.000000e+00
  store double %subres, ptr %j, align 8
  %j4 = load double, ptr %j, align 8
  %lttest5 = fcmp ult double -1.000000e+00, %j4
  br i1 %lttest5, label %forbody6, label %endcond22

forbody6:                                         ; preds = %forcond, %forbody
  %pivot7 = load double, ptr %pivot, align 8
  %j8 = load double, ptr %j, align 8
  %3 = fptrunc double %j8 to float
  %4 = fptosi float %3 to i32
  %5 = getelementptr inbounds ptr, ptr @A, i32 %4
  %A9 = load double, ptr %5, align 8
  %lttest10 = fcmp ult double %pivot7, %A9
  br i1 %lttest10, label %trueexp, label %falseexp

trueexp:                                          ; preds = %forbody6
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
  br label %endcond

falseexp:                                         ; preds = %forbody6
  %pivot14 = load double, ptr %pivot, align 8
  %j15 = load double, ptr %j, align 8
  %addres16 = fadd double %j15, 1.000000e+00
  %12 = fptrunc double %addres16 to float
  %13 = fptosi float %12 to i32
  %14 = getelementptr inbounds ptr, ptr @A, i32 %13
  store double %pivot14, ptr %14, align 8
  store double 1.000000e+01, ptr %step, align 8
  br label %endcond

endcond:                                          ; preds = %falseexp, %trueexp
  %condval = phi double [ 0.000000e+00, %trueexp ], [ 1.000000e+00, %falseexp ]
  br label %forcond

forcond:                                          ; preds = %endcond
  %j17 = load double, ptr %j, align 8
  %step18 = load double, ptr %step, align 8
  %subres19 = fsub double %j17, %step18
  store double %subres19, ptr %j, align 8
  %j20 = load double, ptr %j, align 8
  %lttest21 = fcmp ult double -1.000000e+00, %j20
  br i1 %lttest21, label %forbody6, label %endcond22

endcond22:                                        ; preds = %forcond, %forbody
  %condval23 = phi double [ %condval, %forcond ], [ 1.000000e+00, %forbody ]
  %step24 = load double, ptr %step, align 8
  %eqtest = fcmp ueq double %step24, 1.000000e+00
  br i1 %eqtest, label %trueexp25, label %falseexp27

trueexp25:                                        ; preds = %endcond22
  %pivot26 = load double, ptr %pivot, align 8
  store double %pivot26, ptr @A, align 8
  br label %endcond28

falseexp27:                                       ; preds = %endcond22
  br label %endcond28

endcond28:                                        ; preds = %falseexp27, %trueexp25
  %condval29 = phi double [ 0.000000e+00, %trueexp25 ], [ 1.000000e+00, %falseexp27 ]
  br label %forcond30

forcond30:                                        ; preds = %endcond28
  %i31 = load double, ptr %i, align 8
  %addres32 = fadd double %i31, 1.000000e+00
  store double %addres32, ptr %i, align 8
  %i33 = load double, ptr %i, align 8
  %lttest34 = fcmp ult double %i33, 1.000000e+01
  br i1 %lttest34, label %forbody, label %endcond35

endcond35:                                        ; preds = %forcond30, %entry
  %condval36 = phi double [ %condval29, %forcond30 ], [ 1.000000e+00, %entry ]
  ret double %condval36
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

