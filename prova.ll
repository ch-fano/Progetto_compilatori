@a = common global double 0.000000e+00
@n = common global double 0.000000e+00
define double @fun() {
entry:
  %j = alloca double, align 8
  %i = alloca double, align 8
  %b = alloca double, align 8
  %a = alloca double, align 8
  store double 0.000000e+00, ptr %a, align 8
  store double 0.000000e+00, ptr %b, align 8
  %a1 = load double, ptr %a, align 8
  %eqtest = fcmp ueq double %a1, 0.000000e+00
  br i1 %eqtest, label %trueexp, label %falseexp

trueexp:                                          ; preds = %entry
  store double 1.000000e+01, ptr @n, align 8
  br label %endcond

falseexp:                                         ; preds = %entry
  store double 5.000000e+00, ptr @n, align 8
  br label %endcond

endcond:                                          ; preds = %falseexp, %trueexp
  %condval = phi double [ 1.000000e+01, %trueexp ], [ 5.000000e+00, %falseexp ]
  store double 0.000000e+00, ptr %i, align 8
  %i2 = load double, ptr %i, align 8
  %n = load double, ptr @n, align 8
  %lttest = fcmp ult double %i2, %n
  br i1 %lttest, label %forbody, label %endcond19

forbody:                                          ; preds = %endcond
  %n3 = load double, ptr @n, align 8
  store double %n3, ptr %j, align 8
  %n4 = load double, ptr @n, align 8
  %lttest5 = fcmp ult double 0.000000e+00, %n4
  br i1 %lttest5, label %forbody6, label %endcond11

forbody6:                                         ; preds = %forcond, %forbody
  %b7 = load double, ptr %b, align 8
  %addres = fadd double %b7, 1.000000e+00
  store double %addres, ptr %b, align 8
  br label %forcond

forcond:                                          ; preds = %forbody6
  %j8 = load double, ptr %j, align 8
  %subres = fsub double %j8, 1.000000e+00
  store double %subres, ptr %j, align 8
  %n9 = load double, ptr @n, align 8
  %lttest10 = fcmp ult double 0.000000e+00, %n9
  br i1 %lttest10, label %forbody6, label %endcond11

endcond11:                                        ; preds = %forcond13, %forcond, %forbody
  %condval12 = phi double [ %addres, %forcond ], [ 1.000000e+00, %forbody ]
  br label %forcond13

forcond13:                                        ; preds = %endcond11
  %i14 = load double, ptr %i, align 8
  %addres15 = fadd double %i14, 1.000000e+00
  store double %addres15, ptr %i, align 8
  %i16 = load double, ptr %i, align 8
  %n17 = load double, ptr @n, align 8
  %lttest18 = fcmp ult double %i16, %n17
  br i1 %lttest18, label %endcond11, label %endcond19

endcond19:                                        ; preds = %forcond13, %endcond
  %condval20 = phi double [ %condval12, %forcond13 ], [ 1.000000e+00, %endcond ]
  %b21 = load double, ptr %b, align 8
  ret double %b21
}

