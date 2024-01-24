define double @pow2(double %x, double %i) {
entry:
  %i2 = alloca double, align 8
  %x1 = alloca double, align 8
  store double %x, ptr %x1, align 8
  store double %i, ptr %i2, align 8
  %x3 = load double, ptr %x1, align 8
  %i4 = load double, ptr %i2, align 8
  %mulres = fmul double 2.000000e+00, %i4
  %lttest = fcmp ult double %x3, %mulres
  br i1 %lttest, label %trueexp, label %falseexp

trueexp:                                          ; preds = %entry
  %i5 = load double, ptr %i2, align 8
  br label %endcond

falseexp:                                         ; preds = %entry
  br label %endcond

endcond:                                          ; preds = %falseexp, %trueexp
  %condval = phi double [ %i5, %trueexp ], [ 0.000000e+00, %falseexp ]
  ret double %condval
}

define double @intpart(double %x, double %acc) {
entry:
  %y = alloca double, align 8
  %acc2 = alloca double, align 8
  %x1 = alloca double, align 8
  store double %x, ptr %x1, align 8
  store double %acc, ptr %acc2, align 8
  %x3 = load double, ptr %x1, align 8
  %lttest = fcmp ult double %x3, 1.000000e+00
  br i1 %lttest, label %trueexp, label %falseexp

trueexp:                                          ; preds = %entry
  br label %endcond

falseexp:                                         ; preds = %entry
  br label %endcond

endcond:                                          ; preds = %falseexp, %trueexp
  %condval = phi double [ 0.000000e+00, %trueexp ], [ 0.000000e+00, %falseexp ]
  store double %condval, ptr %y, align 8
  %y4 = load double, ptr %y, align 8
  %eqtest = fcmp ueq double %y4, 0.000000e+00
  br i1 %eqtest, label %trueexp5, label %falseexp7

trueexp5:                                         ; preds = %endcond
  %acc6 = load double, ptr %acc2, align 8
  br label %endcond8

falseexp7:                                        ; preds = %endcond
  br label %endcond8

endcond8:                                         ; preds = %falseexp7, %trueexp5
  %condval9 = phi double [ %acc6, %trueexp5 ], [ 0.000000e+00, %falseexp7 ]
  ret double %condval9
}

define double @floor(double %x) {
entry:
  %x1 = alloca double, align 8
  store double %x, ptr %x1, align 8
  %x2 = load double, ptr %x1, align 8
  %calltmp = call double @intpart(double %x2, double 0.000000e+00)
  ret double %calltmp
}

